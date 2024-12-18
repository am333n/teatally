import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:teatally/core/infrastructure/failure.dart';
import 'package:teatally/core/infrastructure/failure_handler.dart';
import 'package:teatally/features/auth/infrastructure/auth_remote.dart';
import 'package:teatally/features/auth/infrastructure/credential_storage.dart';

@injectable
class AuthRepository {
  final AuthRemoteService _remoteService;

  AuthRepository(this._remoteService);

  Future<Either<Failure, UserCredential?>> signInWithEmailPassword(
      String email, String password) async {
    try {
      final response = await _remoteService.signInWithEmailPassword(
        email,
        password,
      );
      return response.when(success: (user) async {
        await CredentialStorage.storeUser(user);
        return Right(user);
      }, failure: (failure) {
        return Left(failure);
      });
    } catch (e) {
      return Left(FailureHandler.handleGenericException(e as Exception));
    }
  }

  Future<Either<Failure, UserCredential?>> signInWithGoogle() async {
    try {
      final response = await _remoteService.signInWithGoogle();
      return response.when(
        success: (cred) async {
          final credentialResponse =
              await _remoteService.signInWithCredential(cred);
          return credentialResponse.when(
            success: (data) async {
              await CredentialStorage.storeUser(data);
              return Right(data);
            },
            failure: (failure) => Left(failure),
          );
        },
        failure: (failureMessage) {
          return Left(
            FailureHandler.handleGenericException(failureMessage as Exception),
          );
        },
      );
    } catch (e) {
      return Left(FailureHandler.handleGenericException(e as Exception));
    }
  }

  User? checkifUserSignedIn() {
    return _remoteService.checkUserSigned();
  }

  Future<Either<Failure, bool>> signOut() async {
    try {
      final response = await _remoteService.signOut();
      return response.when(success: (isSignedOut) {
        return Right(isSignedOut);
      }, failure: (failure) {
        return Left(failure);
      });
    } catch (e) {
      return Left(FailureHandler.handleGenericException(e as Exception));
    }
  }

  Future<Either<Failure, bool>> addUserToFireStore(
      UserCredential userCred) async {
    try {
      final response = await _remoteService.addUserDetailsToFireStore(userCred);
      return response.when(success: (isSignedOut) {
        return const Right(true);
      }, failure: (failure) {
        return Left(failure);
      });
    } catch (e) {
      return Left(FailureHandler.handleGenericException(e as Exception));
    }
  }
}
