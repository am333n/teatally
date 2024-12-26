import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:teatally/core/infrastructure/failure.dart';
import 'package:teatally/core/widgets/toast.dart';
import 'package:teatally/features/auth/infrastructure/credential_storage.dart';
import 'package:teatally/features/group/application/cubit/group_detail_state.dart';
import 'package:teatally/features/group/domain/categories_model.dart';
import 'package:teatally/features/group/domain/item_model.dart';
import 'package:teatally/features/group/domain/group_details_state_model.dart';
import 'package:teatally/features/group/infrastructure/group_repository.dart';
import 'package:teatally/features/group/domain/session_model.dart';
import 'package:teatally/features/home/infrastructure/home_repository.dart';
import 'package:uuid/uuid.dart';

@injectable
class GroupDetailCubit extends Cubit<GroupDetailState> {
  final GroupRepository _repository;

  GroupDetailCubit(
    this._repository,
  ) : super(const GroupDetailState.loadingState());
  GroupDetailsLoadedStateModel loadedStateData =
      const GroupDetailsLoadedStateModel();
  StreamSubscription<Either<Failure, SessionModel?>>? _subscription;
  List<ItemModel>? allItems;

  void resetSelection() {
    allItems = null;
    loadedStateData = const GroupDetailsLoadedStateModel();
  }

  Future<void> getCategories(String? groupId) async {
    emit(const GroupDetailState.loadingState());
    final response = await _repository.getCategories(groupId);
    response.fold((l) {
      emit(GroupDetailState.errorState(l));
    }, (r) {
      loadedStateData = loadedStateData.copyWith(categories: r);
      emit(GroupDetailState.loadedState(loadedStateData));
    });
  }

  Future<void> getAllMembersDetails(List<String>? membersUids) async {
    final response = await _repository.getAllMemberDetails(membersUids);
    response.fold((l) {
      Toast.showErrorMessage(l.toString());
    }, (r) {
      loadedStateData = loadedStateData.copyWith(members: r);
    });
  }

  Future<void> getItemsForGroup(String? groupId,
      {bool emitLoading = false}) async {
    if (emitLoading) {
      emit(const GroupDetailState.loadingState());
    }
    final response = await _repository.getItemsForGroup(groupId);
    response.fold((l) {
      emit(GroupDetailState.errorState(l));
    }, (r) {
      allItems = r;
      loadedStateData =
          loadedStateData.copyWith(items: getFilterdItems(allItems));
      emit(GroupDetailState.loadedState(loadedStateData));
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
          },
          (sessionData) {
            if (sessionData == null) {
              log('No session data found');
              // emit(SessionNoActiveSession());
            } else {
              loadedStateData = loadedStateData.copyWith(session: sessionData);
              log('Update Data: ${loadedStateData.session}');
              emit(GroupDetailState.loadedState(loadedStateData));
            }
          },
        );
      },
      onError: (error) {
        Toast.showErrorMessage(error.toString());
        // Handle unexpected errors
        // emit(SessionError(error.toString()));
      },
    );
  }

  Future<void> incrementItemCount(String? itemName, String? itemId,
      String? groupId, String? categoryId) async {
    if (loadedStateData.session != null) {
      log('active session 1');
      addItemToSession(itemId, itemName);
    } else {
      await startCountSession(itemId, groupId, categoryId);
      addItemToSession(itemId, itemName);
      log('active session null');
    }
  }

  Future<void> startCountSession(
      String? itemId, String? groupId, String? categoryId) async {
    if (itemId == null && groupId == null && categoryId == null) return;
    final activeSessionDetails = SessionModel(
        isActive: true,
        uid: Uuid().v4(),
        groupId: groupId,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now());
    final response = await _repository.addActiveSession(activeSessionDetails);
    response.fold((l) {
      Toast.showErrorMessage(l.toString());
    }, (r) {});
  }

  Future<void> addItemToSession(
    String? itemId,
    String? itemName,
  ) async {
    if (itemId == null || itemName == null) return;

    // Get the user ID
    final userId = await CredentialStorage.getUid();

    // Get the current session's selected items
    final selectedItems = loadedStateData.session?.selectedItems ?? [];

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
        // User already has a selection, increment the count
        updatedSelections[userSelectionIndex] =
            updatedSelections[userSelectionIndex].copyWith(
          count: (updatedSelections[userSelectionIndex].count ?? 0) + 1,
        );
      } else {
        // User does not have a selection, add a new one
        updatedSelections.add(Selection(userUid: userId, count: 1));
      }

      // Update the item with new selections and total count
      updatedSelectedItems[existingItemIndex] = existingItem.copyWith(
        selections: updatedSelections,
        totalCount: (existingItem.totalCount ?? 0) + 1,
      );
    } else {
      // Item does not exist, add a new item
      final newItem = SelectedItem(
        itemUid: itemId,
        itemName: itemName,
        totalCount: 1,
        selections: [Selection(userUid: userId, count: 1)],
      );

      updatedSelectedItems.add(newItem);
    }

    // Update the session's selected items
    final sessionDetails =
        loadedStateData.session?.copyWith(selectedItems: updatedSelectedItems);

    // Update the active session with new details
    updateActiveSession(sessionDetails);
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
    loadedStateData = loadedStateData.copyWith(
      selectedCategory: categoryId,
    );
    loadedStateData = loadedStateData.copyWith(
      items: getFilterdItems(allItems),
    );

    emit(GroupDetailState.loadedState(loadedStateData));
  }

  List<ItemModel>? getFilterdItems(List<ItemModel>? items) {
    final categoryId = loadedStateData.selectedCategory;
    return (categoryId != null)
        ? allItems?.where((e) => e.categoryId == categoryId).toList()
        : allItems;
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

  Future<void> addItemForCategory(String? groupId, ItemModel itemDetail) async {
    final response = await _repository.addItemForCategory(itemDetail);
    response.fold((l) {
      Toast.showErrorMessage(l.toString());
    }, (r) {
      Toast.showSuccess('item Added');
      getItemsForGroup(groupId);
    });
  }
}
