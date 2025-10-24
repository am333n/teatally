import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:teatally/core/common/api_state.dart';
import 'package:teatally/core/infrastructure/failure.dart';
import 'package:teatally/core/injection/injection.dart';
import 'package:teatally/core/router/router.dart';
import 'package:teatally/core/widgets/toast.dart';
import 'package:teatally/features/auth/infrastructure/credential_storage.dart';
import 'package:teatally/features/group/application/cubit/group_detail_state.dart';
import 'package:teatally/features/group/domain/categories_model.dart';
import 'package:teatally/features/group/domain/item_model.dart';
import 'package:teatally/features/group/domain/group_details_state_model.dart';
import 'package:teatally/features/group/infrastructure/group_repository.dart';
import 'package:teatally/features/group/domain/session_model.dart';
import 'package:teatally/features/home/domain/group_model.dart';
import 'package:teatally/features/home/infrastructure/home_repository.dart';
import 'package:uuid/uuid.dart';

@injectable
class GroupDetailCubit extends Cubit<GroupDetailState> {
  final GroupRepository _repository;

  GroupDetailCubit(
    this._repository,
  ) : super(GroupDetailState());
  // GroupDetailsLoadedStateModel loadedStateData =
  //     const GroupDetailsLoadedStateModel();
  StreamSubscription<Either<Failure, SessionModel?>>? _subscription;

  void resetSelection() {
    // loadedStateData = const GroupDetailsLoadedStateModel();
    emit(GroupDetailState(
        itemsState: ApiLoaded(state.allItems ?? []), allItems: []));
  }

  Future<void> startUpFunction(GroupModel? groupDetails) async {
    emit(state.copyWith(
        categoriesState: const ApiLoading(),
        itemsState: const ApiLoading(),
        membersState: const ApiLoading()));
    await getCategories(groupDetails?.uid, emitLoading: true).then((_) async {
      await getItemsForGroup(groupDetails?.uid, emitLoading: true)
          .then((_) async {
        await getAllMembersDetails(groupDetails?.members, emitLoading: true);
      });
    });

    startListeningForActiveSession(groupDetails?.uid);
  }

  Future<void> getCategories(String? groupId,
      {bool emitLoading = false}) async {
    if (emitLoading) {
      emit(state.copyWith(categoriesState: const ApiLoading()));
    }
    final response = await _repository.getCategories(groupId);
    response.fold((l) {
      emit(state.copyWith(categoriesState: ApiError(l)));
    }, (r) {
      setSelectedCategory(null);
      emit(state.copyWith(categoriesState: ApiLoaded(r)));
    });
  }

  Future<void> getAllMembersDetails(List<String>? membersUids,
      {bool emitLoading = false}) async {
    if (emitLoading) {
      emit(state.copyWith(membersState: const ApiLoading()));
    }
    final response = await _repository.getAllMemberDetails(membersUids);
    response.fold((l) {
      emit(state.copyWith(membersState: ApiError(l)));
      // Toast.showErrorMessage(l.toString());
    }, (r) {
      emit(state.copyWith(membersState: ApiLoaded(r)));
    });
  }

  Future<void> getItemsForGroup(String? groupId,
      {bool emitLoading = false}) async {
    if (emitLoading) {
      emit(state.copyWith(itemsState: const ApiLoading()));
    }
    final response = await _repository.getItemsForGroup(groupId);
    response.fold((l) {
      emit(state.copyWith(itemsState: ApiError(l)));
    }, (r) {
      emit(state.copyWith(
        allItems: r,
      ));
      getFilterdItems();
      // loadedStateData =
      //     loadedStateData.copyWith(items: getFilterdItems(allItems));
      // emit(GroupDetailState.loadedState(loadedStateData));
    });
  }

  void startListeningForActiveSession(String? groupId) {
    if (groupId == null) {
      return;
    }
    // Cancel any existing subscription
    _subscription?.cancel();

    // Emit a loading state initially

    // Start listening to the stream
    _subscription = _repository.streamLatestActiveSession(groupId).listen(
      (result) {
        result.fold(
          (failure) {
            Toast.showErrorMessage(failure.toString());
            emit(state.copyWith(sessionState: const ApiLoaded(null)));
            // loadedStateData = loadedStateData.copyWith(session: null);
            // emit(GroupDetailState.loadedState(loadedStateData));
          },
          (sessionData) {
            if (sessionData == null) {
              emit(state.copyWith(sessionState: const ApiLoaded(null)));
              // loadedStateData = loadedStateData.copyWith(session: null);
              // emit(GroupDetailState.loadedState(loadedStateData));
            } else {
              emit(state.copyWith(sessionState: ApiLoaded(sessionData)));
              // loadedStateData = loadedStateData.copyWith(session: sessionData);
              // log('Update Data: ${loadedStateData.session}');
              // emit(GroupDetailState.loadedState(loadedStateData));
            }
          },
        );
      },
      onError: (error) {
        emit(state.copyWith(sessionState: ApiError(error)));
        // emit(GroupDetailState.errorState(error));
        // Toast.showErrorMessage(error.toString());
        // Handle unexpected errors
        // emit(SessionError(error.toString()));
      },
    );
  }

  Future<void> incrementOrDecrementItemCount(
      String? itemName,
      String? itemId,
      String? groupId,
      double? itemPrice,
      String? categoryId,
      bool isIncrement) async {
    if (state.sessionState.getOrNull() != null) {
      log('active session 1');
      updateItemCount(itemId, itemName, itemPrice, categoryId, isIncrement);
    } else {
      await startCountSession(itemId, groupId, categoryId);
      updateItemCount(itemId, itemName, itemPrice, categoryId, isIncrement);
      log('active session null');
    }
  }

  Future<void> startCountSession(
      String? itemId, String? groupId, String? categoryId) async {
    if (itemId == null && groupId == null && categoryId == null) return;
    final activeSessionDetails = SessionModel(
        isActive: true,
        uid: const Uuid().v4(),
        groupId: groupId,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now());
    final response = await _repository.addActiveSession(activeSessionDetails);
    response.fold((l) {
      Toast.showErrorMessage(l.toString());
    }, (r) {});
  }

  Future<void> updateItemCount(
    String? itemId,
    String? itemName,
    double? itemPrice,
    String? categoryId,
    bool isIncrement, // Flag to indicate increment or decrement
  ) async {
    if (itemId == null || itemName == null || categoryId == null) return;

    // Get the user ID
    final userId = await CredentialStorage.getUid();

    // Get the current session's selected items
    // final selectedItems = loadedStateData.session?.selectedItems ?? [];
    final selectedItems = state.sessionState.getOrNull()?.selectedItems ?? [];

    // Create a mutable copy of selected items
    final updatedSelectedItems = List<SelectedItem>.from(selectedItems);

    // Check if the item already exists in the session
    final existingItemIndex =
        updatedSelectedItems.indexWhere((item) => item.itemUid == itemId);

    if (existingItemIndex != -1) {
      // Item exists
      final existingItem = updatedSelectedItems[existingItemIndex];

      // Check if the user already has a selection for this item
      final userSelectionIndex = existingItem.selections
              ?.indexWhere((selection) => selection.userUid == userId) ??
          -1;

      // Create a mutable copy of the item's selections
      final updatedSelections =
          List<Selection>.from(existingItem.selections ?? []);

      if (userSelectionIndex != -1) {
        // User already has a selection
        final currentUserSelection = updatedSelections[userSelectionIndex];
        final currentCount = currentUserSelection.count ?? 0;

        if (isIncrement) {
          // Increment the count
          updatedSelections[userSelectionIndex] =
              currentUserSelection.copyWith(count: currentCount + 1);
        } else if (currentCount > 0) {
          // Decrement the count if greater than 0
          if (currentCount == 1) {
            // Remove the user's selection if count becomes zero
            updatedSelections.removeAt(userSelectionIndex);
          } else {
            updatedSelections[userSelectionIndex] =
                currentUserSelection.copyWith(count: currentCount - 1);
          }
        }

        // Update the item with new selections and total count
        updatedSelectedItems[existingItemIndex] = existingItem.copyWith(
          selections: updatedSelections,
          totalCount: isIncrement
              ? (existingItem.totalCount ?? 0) + 1
              : (existingItem.totalCount ?? 0) - 1,
        );

        // Optionally remove the item if total count becomes zero
        if (updatedSelectedItems[existingItemIndex].totalCount == 0) {
          updatedSelectedItems.removeAt(existingItemIndex);
        }
      } else if (isIncrement) {
        // User does not have a selection, add a new one for increment only
        updatedSelections.add(Selection(userUid: userId, count: 1));
        updatedSelectedItems[existingItemIndex] = existingItem.copyWith(
          selections: updatedSelections,
          totalCount: (existingItem.totalCount ?? 0) + 1,
        );
      }
    } else if (isIncrement) {
      // Item does not exist, add a new item for increment only
      final newItem = SelectedItem(
        itemUid: itemId,
        itemPrice: itemPrice,
        itemName: itemName,
        categoryId: categoryId,
        totalCount: 1,
        selections: [Selection(userUid: userId, count: 1)],
      );

      updatedSelectedItems.add(newItem);
    }

    final session = state.sessionState
        .getOrNull()
        ?.copyWith(selectedItems: updatedSelectedItems);
    // loadedStateData.session?.copyWith(selectedItems: updatedSelectedItems);
    updateActiveSession(session);
  }

  Future<void> updateActiveSession(SessionModel? sessionDetails) async {
    if (sessionDetails == null) return;
    final response = await _repository.updateActiveSession(sessionDetails);
    response.fold((l) {
      Toast.showErrorMessage(l.toString());
    }, (r) {});
  }

  bool doesItemExistInCurrentSession(SessionModel session, String itemId) {
    final selectedItems = session.selectedItems ?? [];
    return selectedItems.any((item) => item.itemUid == itemId);
  }

  void disposeSessionStream() {
    _subscription?.cancel();
  }

  void setSelectedCategory(String? categoryId) {
    // loadedStateData = loadedStateData.copyWith(
    //   selectedCategory: categoryId,
    // );
    // loadedStateData = state.copyWith(
    //   selectedCategory: categoryId,
    // );
    // loadedStateData = loadedStateData.copyWith(
    //   items: getFilterdItems(allItems),
    // );

    emit(state.copyWith(
      selectedCategory: categoryId,
    ));
    getFilterdItems();
    // emit(GroupDetailState.loadedState(loadedStateData));
  }

  void getFilterdItems() {
    final categoryId = state.selectedCategory;
    final allItems = state.allItems;
    final items = (categoryId != null)
        ? allItems?.where((e) => e.categoryId == categoryId).toList()
        : allItems;
    emit(state.copyWith(itemsState: ApiLoaded(items ?? [])));
  }

  Future<void> addCategory(
      String? groupId, CategoriesModel categoryDetail) async {
    final response = await _repository.addCategory(categoryDetail);
    response.fold((l) {
      Toast.showErrorMessage(l.toString());
    }, (r) {
      getCategories(groupId);
      Toast.showSuccess('Category Added');
    });
  }

  Future<void> deleteCetagoryItem(String? itemDocID, String? groupId) async {
    if (itemDocID == null) {
      Toast.showErrorMessage('InvalidID');
      return;
    }
    final response = await _repository.deleteCategoryItem(itemDocID);
    response.fold((f) {
      Toast.showErrorMessage(f.toString());
    }, (r) {
      Toast.showSuccess('Item Deleted');
    });
    getItemsForGroup(groupId);
  }

  Future<void> updateCategory(CategoriesModel? categoryDetail) async {
    if (categoryDetail == null) return;
    final response = await _repository.updateCategory(categoryDetail);
    response.fold((l) {
      Toast.showErrorMessage(l.toString());
    }, (r) {
      getCategories(categoryDetail.groupId);
      Toast.showSuccess('Category Added');
    });
  }

  Future<void> deleteSession(String? docID) async {
    if (docID == null) return;
    final response = await _repository.deleteSession(docID);
    response.fold((l) {
      Toast.showErrorMessage(l.toString());
    }, (r) {
      Toast.showSuccess('Session Stoped');
    });
  }

  Future<void> deleteCategory(
      String? categoryUid, String? categoryDocID, String? groupId) async {
    if (categoryUid == null || categoryDocID == null) return;

    final allItemsUnderThisCategory = state.itemsState
        .getOrNull()
        ?.where((item) => item.categoryId == categoryUid)
        .toList();

    if (allItemsUnderThisCategory?.isNotEmpty ?? false) {
      Toast.showErrorMessage(
          'Delete Not Allowed: Please remove all items under this category to proceed');
      return;
    }

    // Proceed to delete the category
    final response = await _repository.deleteCategory(categoryDocID);
    response.fold((l) {
      Toast.showErrorMessage(l.toString());
    }, (r) {
      getCategories(groupId); // Refresh categories
      Toast.showSuccess('Category Deleted');
    });
  }

  Future<void> addItemForCategory(String? groupId, ItemModel itemDetail) async {
    final response = await _repository.addItemForCategory(itemDetail);
    response.fold((l) {
      Toast.showErrorMessage(l.toString());
    }, (r) {
      Toast.showSuccess('item Added');
      getIt<AppRouter>().maybePop();
      getItemsForGroup(groupId);
    });
  }
}
