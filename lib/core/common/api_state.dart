import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:teatally/core/infrastructure/failure.dart';

part 'api_state.freezed.dart';
part 'api_state.g.dart';

@Freezed(
  genericArgumentFactories: true,
)
sealed class ApiState<T> with _$ApiState<T> {
  const factory ApiState.loading() = ApiLoading;
  const factory ApiState.loaded(T data) = ApiLoaded;
  const factory ApiState.error(Failure failure) = ApiError;

  @override
  factory ApiState.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$ApiStateFromJson(json, fromJsonT);

  const ApiState._();

  T? getOrNull() => switch (this) {
        ApiLoaded<T>(:final data) => data,
        _ => null,
      };

  bool get isLoading => this is ApiLoading<T>;

  /// Returns `true` if the state is `error`.
  bool get hasError => this is ApiError<T>;

  /// Returns `true` if the state is `loaded`.
  bool get isLoaded => this is ApiLoaded<T>;

  /// Extracts the error message if `error`, otherwise null.
  String? get errorMessage => switch (this) {
        ApiError<T>(:final errorMessage) => errorMessage,
        _ => null,
      };

  R whenOr<R>({
    required R Function() loading,
    required R Function(T data) loaded,
    required R Function(Failure failure) error,
    R Function(T data)? updating,
  }) {
    return switch (this) {
      ApiLoading<T>() => loading(),
      ApiLoaded<T>(data: final data) => loaded(data),
      ApiError<T>(failure: final failure) => error(failure),
      _ => loading(),
    };
  }

  @override
  toJson(
    toJsonT,
  );
}
