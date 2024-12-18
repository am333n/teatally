// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.serverError({required String message}) = _ServerError;
  const factory Failure.clientError({required String message}) = _ClientError;
  const factory Failure.noInternet() = _NoInternet;
  const factory Failure.noPermission() = _NoPermission;

  const factory Failure.firebaseAuthError(
      {required String message, String? code}) = _FirebaseAuthError;
  const factory Failure.firebaseNetworkError(
      {required String message, String? code}) = _FirebaseNetworkError;
  const factory Failure.firebaseUnknownError(
      {required String message, String? code}) = _FirebaseUnknownError;
}
