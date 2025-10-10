import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/foundation.dart';
import 'package:teatally/core/infrastructure/failure.dart';
import 'package:teatally/core/infrastructure/failure_handler.dart';
import 'package:teatally/core/infrastructure/remote_response.dart';

typedef RepoResponse<T> = Future<Either<Failure, T>>;

mixin BaseRepo {
  Future<Either<Failure, T>> getData<T>(
    Future<RemoteResponse> Function() apiCall,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    try {
      final response = await apiCall();
      return response.when(
        success: (data) async {
          try {
            final convertedData = fromJson(data);
            return Right(convertedData);
          } catch (e) {
            return Left(FailureHandler.dataConversionFailure);
          }
        },
        failure: (data) {
          return Left(FailureHandler.handleFirestoreException(data));
        },
      );
    } on FirebaseException catch (e) {
      return Left(FailureHandler.handleFirestoreException(e));
    }
  }

  Future<Either<Failure, List<T>>> getListData<T>(
    Future<RemoteResponse> Function() apiCall,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    try {
      final response = await apiCall();
      return response.when(
        success: (data) async {
          try {
            if (data is! List) {
              return Left(FailureHandler.dataConversionFailure);
            }
            final convertedList =
                data.map((e) => fromJson(e as Map<String, dynamic>)).toList();
            return Right(convertedList);
          } catch (e) {
            return Left(FailureHandler.dataConversionFailure);
          }
        },
        failure: (data) {
          return Left(FailureHandler.handleFirestoreException(data));
        },
      );
    } on FirebaseException catch (e) {
      return Left(FailureHandler.handleFirestoreException(e));
    }
  }

  Future<Either<Failure, bool>> performAction(
    Future<RemoteResponse> Function() apiCall,
  ) async {
    try {
      final response = await apiCall();
      return response.when(
        success: (data) async {
          try {
            if (data is! List) {
              return Left(FailureHandler.dataConversionFailure);
            }

            return Right(true);
          } catch (e) {
            return Left(FailureHandler.dataConversionFailure);
          }
        },
        failure: (data) {
          return Left(FailureHandler.handleFirestoreException(data));
        },
      );
    } on FirebaseException catch (e) {
      return Left(FailureHandler.handleFirestoreException(e));
    }
  }
}
