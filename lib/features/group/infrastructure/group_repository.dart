import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:teatally/core/infrastructure/base_repository.dart';
import 'package:teatally/core/infrastructure/failure.dart';
import 'package:teatally/core/infrastructure/failure_handler.dart';
import 'package:teatally/features/group/domain/categories_model.dart';
import 'package:teatally/features/group/domain/item_model.dart';
import 'package:teatally/features/group/infrastructure/group_remote_service.dart';
import 'package:teatally/features/group/domain/session_model.dart';
import 'package:teatally/features/home/domain/users_model.dart';

@injectable
class GroupRepository with BaseRepo {
  final GroupRemoteService _remoteService;

  GroupRepository(this._remoteService);

  Future<Either<Failure, List<CategoriesModel>>> getCategories(
      String? groupId) async {
    try {
      final response = await _remoteService.getCategories(groupId);
      return response.when(success: (data) {
        final convertedData = (data as List<dynamic>)
            .map((e) => CategoriesModel.fromJson(e))
            .toList();
        return Right(convertedData);
      }, failure: (failure) {
        return Left(failure);
      });
    } catch (e) {
      return Left(FailureHandler.handleGenericException(e as Exception));
    }
  }

  Future<Either<Failure, List<ItemModel>>> getItemsForGroup(
      String? groupId) async {
    try {
      final response = await _remoteService.getItemsForGroup(groupId);
      return response.when(success: (data) {
        final convertedData =
            (data as List<dynamic>).map((e) => ItemModel.fromJson(e)).toList();
        return Right(convertedData);
      }, failure: (failure) {
        return Left(failure);
      });
    } catch (e) {
      return Left(FailureHandler.handleGenericException(e as Exception));
    }
  }

  Future<Either<Failure, List<UserModel>>> getAllMemberDetails(
      List<String>? membersUids) async {
    try {
      final response = await _remoteService.getAllMemberDetails(membersUids);
      return response.when(success: (data) {
        final convertedData =
            (data as List<dynamic>).map((e) => UserModel.fromJson(e)).toList();
        return Right(convertedData);
      }, failure: (failure) {
        return Left(failure);
      });
    } catch (e) {
      return Left(FailureHandler.handleGenericException(e as Exception));
    }
  }

  Stream<Either<Failure, SessionModel?>> streamLatestActiveSession(
      String groupId) {
    try {
      return _remoteService
          .streamLatestActiveSession(groupId)
          .map<Either<Failure, SessionModel?>>((response) {
        return response.when(
          success: (data) {
            if (data == null) {
              // Emit null if no active session is found
              return const Right(null);
            } else {
              // Convert data to SessionModel
              final sessionModel = SessionModel.fromJson(data);
              return Right(sessionModel);
            }
          },
          failure: (failure) {
            // Emit failure
            return Left(failure);
          },
        );
      }).handleError((error) {
        if (error is FirebaseException) {
          return Left(FailureHandler.handleFirestoreException(error));
        }
        return Left(Failure.serverError(message: error.toString()));
      });
    } catch (e) {
      // Return a stream with a single error if an exception occurs
      return Stream.value(
          Left(FailureHandler.handleGenericException(e as Exception)));
    }
  }

  Future<Either<Failure, bool>> addCategory(
      CategoriesModel categoryDetail) async {
    try {
      final response = await _remoteService.addCategory(categoryDetail);
      return response.when(success: (data) {
        return const Right(true);
      }, failure: (failure) {
        return Left(failure);
      });
    } catch (e) {
      return Left(FailureHandler.handleGenericException(e as Exception));
    }
  }

  Future<Either<Failure, bool>> updateCategory(
      CategoriesModel categoryDetail) async {
    try {
      final response = await _remoteService.updateCategory(categoryDetail);
      return response.when(success: (data) {
        return const Right(true);
      }, failure: (failure) {
        return Left(failure);
      });
    } catch (e) {
      return Left(FailureHandler.handleGenericException(e as Exception));
    }
  }

  Future<Either<Failure, bool>> deleteCategory(String docId) async {
    try {
      final response = await _remoteService.deleteCategory(docId);
      return response.when(success: (data) {
        return const Right(true);
      }, failure: (failure) {
        return Left(failure);
      });
    } catch (e) {
      return Left(FailureHandler.handleGenericException(e as Exception));
    }
  }

  Future<Either<Failure, bool>> deleteSession(String docId) async {
    try {
      final response = await _remoteService.deleteSession(docId);
      return response.when(success: (data) {
        return const Right(true);
      }, failure: (failure) {
        return Left(failure);
      });
    } catch (e) {
      return Left(FailureHandler.handleGenericException(e as Exception));
    }
  }

  Future<Either<Failure, bool>> addActiveSession(
      SessionModel sessionDetails) async {
    try {
      final response = await _remoteService.addActiveSession(sessionDetails);
      return response.when(success: (data) {
        return const Right(true);
      }, failure: (failure) {
        return Left(failure);
      });
    } catch (e) {
      return Left(FailureHandler.handleGenericException(e as Exception));
    }
  }

  Future<Either<Failure, bool>> updateActiveSession(
      SessionModel sessionDetails) async {
    try {
      final response = await _remoteService.updateActiveSession(sessionDetails);
      return response.when(success: (data) {
        return const Right(true);
      }, failure: (failure) {
        return Left(failure);
      });
    } catch (e) {
      return Left(FailureHandler.handleGenericException(e as Exception));
    }
  }

  Future<Either<Failure, bool>> addItemForCategory(ItemModel itemDetail) async {
    try {
      final response = await _remoteService.addItemForCategory(itemDetail);
      return response.when(success: (data) {
        return const Right(true);
      }, failure: (failure) {
        return Left(failure);
      });
    } catch (e) {
      return Left(FailureHandler.handleGenericException(e as Exception));
    }
  }

  RepoResponse<bool> deleteCategoryItem(String itemDocID) {
    return super
        .performAction(() => _remoteService.deleteCategoryItem(itemDocID));
  }
}
