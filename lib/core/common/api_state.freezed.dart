// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApiState<T> _$ApiStateFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  switch (json['runtimeType']) {
    case 'loading':
      return ApiLoading<T>.fromJson(json, fromJsonT);
    case 'loaded':
      return ApiLoaded<T>.fromJson(json, fromJsonT);
    case 'error':
      return ApiError<T>.fromJson(json, fromJsonT);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'ApiState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$ApiState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(T data) loaded,
    required TResult Function(Failure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(T data)? loaded,
    TResult? Function(Failure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiLoading<T> value) loading,
    required TResult Function(ApiLoaded<T> value) loaded,
    required TResult Function(ApiError<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiLoading<T> value)? loading,
    TResult? Function(ApiLoaded<T> value)? loaded,
    TResult? Function(ApiError<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiLoading<T> value)? loading,
    TResult Function(ApiLoaded<T> value)? loaded,
    TResult Function(ApiError<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this ApiState to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiStateCopyWith<T, $Res> {
  factory $ApiStateCopyWith(
          ApiState<T> value, $Res Function(ApiState<T>) then) =
      _$ApiStateCopyWithImpl<T, $Res, ApiState<T>>;
}

/// @nodoc
class _$ApiStateCopyWithImpl<T, $Res, $Val extends ApiState<T>>
    implements $ApiStateCopyWith<T, $Res> {
  _$ApiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ApiLoadingImplCopyWith<T, $Res> {
  factory _$$ApiLoadingImplCopyWith(
          _$ApiLoadingImpl<T> value, $Res Function(_$ApiLoadingImpl<T>) then) =
      __$$ApiLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$ApiLoadingImplCopyWithImpl<T, $Res>
    extends _$ApiStateCopyWithImpl<T, $Res, _$ApiLoadingImpl<T>>
    implements _$$ApiLoadingImplCopyWith<T, $Res> {
  __$$ApiLoadingImplCopyWithImpl(
      _$ApiLoadingImpl<T> _value, $Res Function(_$ApiLoadingImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ApiState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$ApiLoadingImpl<T> extends ApiLoading<T> with DiagnosticableTreeMixin {
  const _$ApiLoadingImpl({final String? $type})
      : $type = $type ?? 'loading',
        super._();

  factory _$ApiLoadingImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$ApiLoadingImplFromJson(json, fromJsonT);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ApiState<$T>.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ApiState<$T>.loading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ApiLoadingImpl<T>);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(T data) loaded,
    required TResult Function(Failure failure) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(T data)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiLoading<T> value) loading,
    required TResult Function(ApiLoaded<T> value) loaded,
    required TResult Function(ApiError<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiLoading<T> value)? loading,
    TResult? Function(ApiLoaded<T> value)? loaded,
    TResult? Function(ApiError<T> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiLoading<T> value)? loading,
    TResult Function(ApiLoaded<T> value)? loaded,
    TResult Function(ApiError<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$ApiLoadingImplToJson<T>(this, toJsonT);
  }
}

abstract class ApiLoading<T> extends ApiState<T> {
  const factory ApiLoading() = _$ApiLoadingImpl<T>;
  const ApiLoading._() : super._();

  factory ApiLoading.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$ApiLoadingImpl<T>.fromJson;
}

/// @nodoc
abstract class _$$ApiLoadedImplCopyWith<T, $Res> {
  factory _$$ApiLoadedImplCopyWith(
          _$ApiLoadedImpl<T> value, $Res Function(_$ApiLoadedImpl<T>) then) =
      __$$ApiLoadedImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$ApiLoadedImplCopyWithImpl<T, $Res>
    extends _$ApiStateCopyWithImpl<T, $Res, _$ApiLoadedImpl<T>>
    implements _$$ApiLoadedImplCopyWith<T, $Res> {
  __$$ApiLoadedImplCopyWithImpl(
      _$ApiLoadedImpl<T> _value, $Res Function(_$ApiLoadedImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ApiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$ApiLoadedImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$ApiLoadedImpl<T> extends ApiLoaded<T> with DiagnosticableTreeMixin {
  const _$ApiLoadedImpl(this.data, {final String? $type})
      : $type = $type ?? 'loaded',
        super._();

  factory _$ApiLoadedImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$ApiLoadedImplFromJson(json, fromJsonT);

  @override
  final T data;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ApiState<$T>.loaded(data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ApiState<$T>.loaded'))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiLoadedImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of ApiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiLoadedImplCopyWith<T, _$ApiLoadedImpl<T>> get copyWith =>
      __$$ApiLoadedImplCopyWithImpl<T, _$ApiLoadedImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(T data) loaded,
    required TResult Function(Failure failure) error,
  }) {
    return loaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(T data)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return loaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiLoading<T> value) loading,
    required TResult Function(ApiLoaded<T> value) loaded,
    required TResult Function(ApiError<T> value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiLoading<T> value)? loading,
    TResult? Function(ApiLoaded<T> value)? loaded,
    TResult? Function(ApiError<T> value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiLoading<T> value)? loading,
    TResult Function(ApiLoaded<T> value)? loaded,
    TResult Function(ApiError<T> value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$ApiLoadedImplToJson<T>(this, toJsonT);
  }
}

abstract class ApiLoaded<T> extends ApiState<T> {
  const factory ApiLoaded(final T data) = _$ApiLoadedImpl<T>;
  const ApiLoaded._() : super._();

  factory ApiLoaded.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$ApiLoadedImpl<T>.fromJson;

  T get data;

  /// Create a copy of ApiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiLoadedImplCopyWith<T, _$ApiLoadedImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApiErrorImplCopyWith<T, $Res> {
  factory _$$ApiErrorImplCopyWith(
          _$ApiErrorImpl<T> value, $Res Function(_$ApiErrorImpl<T>) then) =
      __$$ApiErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({Failure failure});

  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$ApiErrorImplCopyWithImpl<T, $Res>
    extends _$ApiStateCopyWithImpl<T, $Res, _$ApiErrorImpl<T>>
    implements _$$ApiErrorImplCopyWith<T, $Res> {
  __$$ApiErrorImplCopyWithImpl(
      _$ApiErrorImpl<T> _value, $Res Function(_$ApiErrorImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ApiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$ApiErrorImpl<T>(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }

  /// Create a copy of ApiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res> get failure {
    return $FailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$ApiErrorImpl<T> extends ApiError<T> with DiagnosticableTreeMixin {
  const _$ApiErrorImpl(this.failure, {final String? $type})
      : $type = $type ?? 'error',
        super._();

  factory _$ApiErrorImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$ApiErrorImplFromJson(json, fromJsonT);

  @override
  final Failure failure;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ApiState<$T>.error(failure: $failure)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ApiState<$T>.error'))
      ..add(DiagnosticsProperty('failure', failure));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiErrorImpl<T> &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, failure);

  /// Create a copy of ApiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiErrorImplCopyWith<T, _$ApiErrorImpl<T>> get copyWith =>
      __$$ApiErrorImplCopyWithImpl<T, _$ApiErrorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(T data) loaded,
    required TResult Function(Failure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(T data)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiLoading<T> value) loading,
    required TResult Function(ApiLoaded<T> value) loaded,
    required TResult Function(ApiError<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiLoading<T> value)? loading,
    TResult? Function(ApiLoaded<T> value)? loaded,
    TResult? Function(ApiError<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiLoading<T> value)? loading,
    TResult Function(ApiLoaded<T> value)? loaded,
    TResult Function(ApiError<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$ApiErrorImplToJson<T>(this, toJsonT);
  }
}

abstract class ApiError<T> extends ApiState<T> {
  const factory ApiError(final Failure failure) = _$ApiErrorImpl<T>;
  const ApiError._() : super._();

  factory ApiError.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$ApiErrorImpl<T>.fromJson;

  Failure get failure;

  /// Create a copy of ApiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiErrorImplCopyWith<T, _$ApiErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
