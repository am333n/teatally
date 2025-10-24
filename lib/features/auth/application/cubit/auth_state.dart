// ignore_for_file: invalid_annotation_target

part of 'auth_cubit.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthenticationStatus.unAuthenticated())
    AuthenticationStatus status,
  }) = _AuthState;

  factory AuthState.fromJson(Map<String, dynamic> json) =>
      _$AuthStateFromJson(json);
}

@freezed
sealed class AuthenticationStatus with _$AuthenticationStatus {
  const factory AuthenticationStatus.authLoading() = AuthLoading;
  const factory AuthenticationStatus.authenticated(UserData userData) =
      Authenticated;
  const factory AuthenticationStatus.unAuthenticated({String? errorMessage}) =
      UnAuthenticated;
  const AuthenticationStatus._();

  UserData? getUserDataOrNull() => switch (this) {
        Authenticated(:final UserData userData) => userData,
        _ => null,
      };
  factory AuthenticationStatus.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationStatusFromJson(json);
}

@freezed
abstract class UserData with _$UserData {
  const factory UserData({
    @JsonKey(name: 'docId', includeToJson: false) String? docId,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'displayName') String? displayName,
    @JsonKey(name: 'uid') String? uid,
    @JsonKey(name: 'photoURL') String? photoUrl,
    @JsonKey(name: 'preferences') Preferences? preferences,
    @JsonKey(name: 'fireBaseUID') String? fireBaseUID,
    @JsonKey(name: 'lastLogin') DateTime? lastLogin,
  }) = _UserData;
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}

@freezed
abstract class Preferences with _$Preferences {
  const factory Preferences({
    @Default(false) @JsonKey(name: 'isDarkMode') bool? isDarkMode,
  }) = _Preferences;
  factory Preferences.fromJson(Map<String, dynamic> json) =>
      _$PreferencesFromJson(json);
}
