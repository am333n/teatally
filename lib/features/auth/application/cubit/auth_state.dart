import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.authInitialState() = AuthInitialState;
  const factory AuthState.authloadingState() = AuthloadingState;
  const factory AuthState.authSuccessState() = AuthSuccessState;
  const factory AuthState.authErrorState({String? errorMessage}) =
      AuthErrorState;
}
