import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:teatally/core/infrastructure/failure.dart';
import 'package:teatally/core/infrastructure/failure_handler.dart';
import 'package:teatally/features/home/domain/group_model.dart';
import 'package:teatally/features/home/domain/users_model.dart';
import 'package:teatally/features/home/infrastructure/home_remote.dart';

@injectable
class HomeRepository {
  final HomeRemoteService _remoteService;

  HomeRepository(this._remoteService);

  Future<Either<Failure, List<UserModel>>> getAllUsersList() async {
    try {
      final response = await _remoteService.getAllUsersList();
      return response.when(success: (data) {
        final convertedData = (data as List<dynamic>)
            .map(
              (e) => UserModel.fromJson(e),
            )
            .toList();
        return Right(convertedData);
      }, failure: (failure) {
        return Left(failure);
      });
    } catch (e) {
      return Left(FailureHandler.handleGenericException(e as Exception));
    }
  }

  Future<Either<Failure, bool>> createGroup(GroupModel groupDetails) async {
    try {
      final response = await _remoteService.createGroup(groupDetails);
      return response.when(success: (data) {
        return const Right(true);
      }, failure: (failure) {
        return Left(failure);
      });
    } catch (e) {
      return Left(FailureHandler.handleGenericException(e as Exception));
    }
  }

  Future<Either<Failure, List<GroupModel>>> getAllGroups() async {
    try {
      final response = await _remoteService.getAllGroups();
      return response.when(success: (data) {
        final convertedData =
            (data as List<dynamic>).map((e) => GroupModel.fromJson(e)).toList();
        return Right(convertedData);
      }, failure: (failure) {
        return Left(failure);
      });
    } catch (e) {
      return Left(FailureHandler.handleGenericException(e as Exception));
    }
  }
}
