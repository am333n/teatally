import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:teatally/core/common/notification_service.dart';
import 'package:teatally/core/infrastructure/failure_handler.dart';
import 'package:teatally/core/injection/injection.dart';
import 'package:teatally/core/router/router.dart';
import 'package:teatally/core/widgets/toast.dart';

import 'package:teatally/features/auth/infrastructure/auth_repository.dart';
import 'package:teatally/features/auth/infrastructure/credential_storage.dart';

part 'auth_state.dart';

part 'auth_cubit.g.dart';
part 'auth_cubit.freezed.dart';

@singleton
class AuthCubit extends HydratedCubit<AuthState> {
  final AuthRepository _repository;
  AuthCubit(this._repository) : super(const AuthState());

  void signInWithEmailAndPassowrd(String email, String password) async {
    emit(const AuthState(status: AuthenticationStatus.authLoading()));
    final response = await _repository.signInWithEmailPassword(
      email,
      password,
    );
    response.fold((l) {
      emit(state.copyWith(
          status: UnAuthenticated(
              errorMessage: FailureHandler.getErrorMessageFromFailure(l))));
    }, (r) {
      signInSuccessAction(r);
    });
  }

  void signInWithGoogle() async {
    try {
      emit(const AuthState(status: AuthLoading()));
      final response = await _repository.signInWithGoogle();
      response.fold((l) {
        emit(state.copyWith(
            status: UnAuthenticated(
                errorMessage: FailureHandler.getErrorMessageFromFailure(l))));
      }, (r) {
        signInSuccessAction(r);
      });
    } catch (e) {
      emit(state.copyWith(
          status: const UnAuthenticated(errorMessage: 'Something went wrong')));
    }
  }

  Future<void> signInSuccessAction(UserCredential? userCred) async {
    if (userCred == null) return;
    final userData = userCred.user;
    final userExistingData = await checkIfUserDataExist(userCred.user?.email);
    if (userExistingData != null) {
      final updatedData = userExistingData.copyWith(
        displayName: userData?.displayName,
        lastLogin: DateTime.now(),
        fireBaseUID: userData?.uid,
        preferences: userExistingData.preferences ?? const Preferences(),
        photoUrl: userData?.photoURL,
      );
      final response = await _repository.updateUserData(updatedData);
      response.fold((f) {
        emit(state.copyWith(
            status: UnAuthenticated(
                errorMessage: FailureHandler.getErrorMessageFromFailure(f))));
      }, (r) async {
        emit(state.copyWith(
            status: AuthenticationStatus.authenticated(updatedData)));
        await _sendFcmAndNavigateHome();
      });
      return;
    }

    final newUserData = UserData(
      uid: userData?.uid,
      email: userData?.email,
      displayName: userData?.displayName,
      lastLogin: DateTime.now(),
      fireBaseUID: userData?.uid,
      preferences: const Preferences(),
      photoUrl: userData?.photoURL,
    );

    final response = await _repository.addUserToFireStore(newUserData);

    response.fold((f) {
      emit(state.copyWith(
          status: UnAuthenticated(
              errorMessage: FailureHandler.getErrorMessageFromFailure(f))));
    }, (r) async {
      emit(state.copyWith(
          status: AuthenticationStatus.authenticated(newUserData)));
      await _sendFcmAndNavigateHome();
    });
  }

  Future<void> _sendFcmAndNavigateHome() async {
    final fcmToken = await CredentialStorage.getFcmToken();
    if (fcmToken != null && fcmToken.isNotEmpty) {
      getIt<NotificationService>().sendFcmTokenToServer(fcmToken);
    }
    Toast.showSuccess('Login Successfull');
    getIt<AppRouter>().replace(const HomeRoute());
  }

  void resetState() {
    if (state.status is AuthLoading) {
      emit(state.copyWith(status: const UnAuthenticated()));
    } else if (state.status is UnAuthenticated) {
      // Reset UnAuthenticated state with no error message
      emit(state.copyWith(
        status: const UnAuthenticated(errorMessage: null),
      ));
    }
  }

  UserData? get currentUser => state.status.getUserDataOrNull();

  Future<UserData?> checkIfUserDataExist(String? email) async {
    if (email == null) {
      return null;
    }
    final response = await _repository.checkIfUserDataExist(email);
    return response.fold((f) {
      return null;
    }, (r) {
      return r.isNotEmpty ? r.first : null;
    });
  }

  Future<void> signOut() async {
    final response = await _repository.signOut();
    response.fold((l) {
      Toast.showErrorMessage(l.toString());
    }, (r) {
      setFcmInactive(currentUser?.uid);
      emit(state.copyWith(status: const UnAuthenticated()));
      getIt<AppRouter>().replaceAll([AuthRoute()]);
      Toast.showSuccess('Successfully Signed Out');
    });
  }

  Future<void> setFcmInactive(String? userId) async {
    if (userId == null) {
      return;
    }
    final response = await _repository.getUserNotification(userId);
    response.fold((f) {
      log('Error While geting User FCM: $f');
    }, (r) async {
      if (r == null && r.docId == null) {
        return;
      }
      final response = await _repository.setFcmInActive(
          r.docId!, r.copyWith(isActive: false));
      response.fold((f) {
        log('Error while setting FCM Inactive $f');
      }, (r) {
        log('FCM set to inactive');
      });
    });
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    return state.toJson();
  }

  @override
  AuthState fromJson(Map<String, dynamic> json) {
    return AuthState.fromJson(json);
  }
}

extension UserGetter on BuildContext {
  UserData? get currentUser => GetIt.I<AuthCubit>().currentUser;
}
