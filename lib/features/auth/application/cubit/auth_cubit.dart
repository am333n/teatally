import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:teatally/core/infrastructure/failure_handler.dart';
import 'package:teatally/core/injection/injection.dart';
import 'package:teatally/core/router/router.dart';
import 'package:teatally/core/widgets/toast.dart';
import 'package:teatally/features/auth/application/cubit/auth_state.dart';
import 'package:teatally/features/auth/infrastructure/auth_repository.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _repository;
  AuthCubit(this._repository) : super(const AuthState.authInitialState());

  void signInWithEmailAndPassowrd(String email, String password) async {
    emit(const AuthState.authloadingState());
    final response = await _repository.signInWithEmailPassword(
      email,
      password,
    );
    response.fold((l) {
      emit(AuthState.authErrorState(
          errorMessage: FailureHandler.getErrorMessageFromFailure(l)));
    }, (r) {
      signInSuccessAction(r);
    });
  }

  void signInWithGoogle() async {
    emit(const AuthState.authloadingState());
    final response = await _repository.signInWithGoogle();
    response.fold((l) {
      emit(AuthState.authErrorState(
          errorMessage: FailureHandler.getErrorMessageFromFailure(l)));
    }, (r) {
      signInSuccessAction(r);
    });
  }

  Future<void> signInSuccessAction(UserCredential? userCred) async {
    if (userCred == null) return;
    await storeUserDataToFireBase(userCred);
    Toast.showSuccess('Login Successfull');
    getIt<AppRouter>().replace(const HomeRoute());
  }

  Future<void> storeUserDataToFireBase(UserCredential userCred) async {
    final response = await _repository.addUserToFireStore(userCred);
    response.fold((l) {
      emit(AuthState.authErrorState(
          errorMessage: FailureHandler.getErrorMessageFromFailure(l)));
    }, (r) {
      emit(const AuthState.authSuccessState());
    });
  }

  bool checkUserSignedInStatus() {
    final user = _repository.checkifUserSignedIn();
    if (user != null) {
      return true;
    }
    return false;
  }

  Future<void> signOut() async {
    emit(const AuthState.authloadingState());
    final response = await _repository.signOut();
    response.fold((l) {
      emit(AuthState.authErrorState(
          errorMessage: FailureHandler.getErrorMessageFromFailure(l)));
    }, (r) {
      emit(const AuthState.authSuccessState());
      getIt<AppRouter>().replaceAll([AuthRoute()]);
      Toast.showSuccess('Successfully Signed Out');
    });
  }
}
