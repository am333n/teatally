// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Failure _$FailureFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'serverError':
      return _ServerError.fromJson(json);
    case 'clientError':
      return _ClientError.fromJson(json);
    case 'noInternet':
      return _NoInternet.fromJson(json);
    case 'noPermission':
      return _NoPermission.fromJson(json);
    case 'firebaseAuthError':
      return _FirebaseAuthError.fromJson(json);
    case 'firebaseNetworkError':
      return _FirebaseNetworkError.fromJson(json);
    case 'firebaseUnknownError':
      return _FirebaseUnknownError.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Failure',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$Failure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverError,
    required TResult Function(String message) clientError,
    required TResult Function() noInternet,
    required TResult Function() noPermission,
    required TResult Function(String message, String? code) firebaseAuthError,
    required TResult Function(String message, String? code)
        firebaseNetworkError,
    required TResult Function(String message, String? code)
        firebaseUnknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverError,
    TResult? Function(String message)? clientError,
    TResult? Function()? noInternet,
    TResult? Function()? noPermission,
    TResult? Function(String message, String? code)? firebaseAuthError,
    TResult? Function(String message, String? code)? firebaseNetworkError,
    TResult? Function(String message, String? code)? firebaseUnknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverError,
    TResult Function(String message)? clientError,
    TResult Function()? noInternet,
    TResult Function()? noPermission,
    TResult Function(String message, String? code)? firebaseAuthError,
    TResult Function(String message, String? code)? firebaseNetworkError,
    TResult Function(String message, String? code)? firebaseUnknownError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_ClientError value) clientError,
    required TResult Function(_NoInternet value) noInternet,
    required TResult Function(_NoPermission value) noPermission,
    required TResult Function(_FirebaseAuthError value) firebaseAuthError,
    required TResult Function(_FirebaseNetworkError value) firebaseNetworkError,
    required TResult Function(_FirebaseUnknownError value) firebaseUnknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_ClientError value)? clientError,
    TResult? Function(_NoInternet value)? noInternet,
    TResult? Function(_NoPermission value)? noPermission,
    TResult? Function(_FirebaseAuthError value)? firebaseAuthError,
    TResult? Function(_FirebaseNetworkError value)? firebaseNetworkError,
    TResult? Function(_FirebaseUnknownError value)? firebaseUnknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_ClientError value)? clientError,
    TResult Function(_NoInternet value)? noInternet,
    TResult Function(_NoPermission value)? noPermission,
    TResult Function(_FirebaseAuthError value)? firebaseAuthError,
    TResult Function(_FirebaseNetworkError value)? firebaseNetworkError,
    TResult Function(_FirebaseUnknownError value)? firebaseUnknownError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this Failure to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ServerErrorImplCopyWith<$Res> {
  factory _$$ServerErrorImplCopyWith(
          _$ServerErrorImpl value, $Res Function(_$ServerErrorImpl) then) =
      __$$ServerErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ServerErrorImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ServerErrorImpl>
    implements _$$ServerErrorImplCopyWith<$Res> {
  __$$ServerErrorImplCopyWithImpl(
      _$ServerErrorImpl _value, $Res Function(_$ServerErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ServerErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServerErrorImpl implements _ServerError {
  const _$ServerErrorImpl({required this.message, final String? $type})
      : $type = $type ?? 'serverError';

  factory _$ServerErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServerErrorImplFromJson(json);

  @override
  final String message;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Failure.serverError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerErrorImplCopyWith<_$ServerErrorImpl> get copyWith =>
      __$$ServerErrorImplCopyWithImpl<_$ServerErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverError,
    required TResult Function(String message) clientError,
    required TResult Function() noInternet,
    required TResult Function() noPermission,
    required TResult Function(String message, String? code) firebaseAuthError,
    required TResult Function(String message, String? code)
        firebaseNetworkError,
    required TResult Function(String message, String? code)
        firebaseUnknownError,
  }) {
    return serverError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverError,
    TResult? Function(String message)? clientError,
    TResult? Function()? noInternet,
    TResult? Function()? noPermission,
    TResult? Function(String message, String? code)? firebaseAuthError,
    TResult? Function(String message, String? code)? firebaseNetworkError,
    TResult? Function(String message, String? code)? firebaseUnknownError,
  }) {
    return serverError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverError,
    TResult Function(String message)? clientError,
    TResult Function()? noInternet,
    TResult Function()? noPermission,
    TResult Function(String message, String? code)? firebaseAuthError,
    TResult Function(String message, String? code)? firebaseNetworkError,
    TResult Function(String message, String? code)? firebaseUnknownError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_ClientError value) clientError,
    required TResult Function(_NoInternet value) noInternet,
    required TResult Function(_NoPermission value) noPermission,
    required TResult Function(_FirebaseAuthError value) firebaseAuthError,
    required TResult Function(_FirebaseNetworkError value) firebaseNetworkError,
    required TResult Function(_FirebaseUnknownError value) firebaseUnknownError,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_ClientError value)? clientError,
    TResult? Function(_NoInternet value)? noInternet,
    TResult? Function(_NoPermission value)? noPermission,
    TResult? Function(_FirebaseAuthError value)? firebaseAuthError,
    TResult? Function(_FirebaseNetworkError value)? firebaseNetworkError,
    TResult? Function(_FirebaseUnknownError value)? firebaseUnknownError,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_ClientError value)? clientError,
    TResult Function(_NoInternet value)? noInternet,
    TResult Function(_NoPermission value)? noPermission,
    TResult Function(_FirebaseAuthError value)? firebaseAuthError,
    TResult Function(_FirebaseNetworkError value)? firebaseNetworkError,
    TResult Function(_FirebaseUnknownError value)? firebaseUnknownError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ServerErrorImplToJson(
      this,
    );
  }
}

abstract class _ServerError implements Failure {
  const factory _ServerError({required final String message}) =
      _$ServerErrorImpl;

  factory _ServerError.fromJson(Map<String, dynamic> json) =
      _$ServerErrorImpl.fromJson;

  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServerErrorImplCopyWith<_$ServerErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClientErrorImplCopyWith<$Res> {
  factory _$$ClientErrorImplCopyWith(
          _$ClientErrorImpl value, $Res Function(_$ClientErrorImpl) then) =
      __$$ClientErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ClientErrorImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ClientErrorImpl>
    implements _$$ClientErrorImplCopyWith<$Res> {
  __$$ClientErrorImplCopyWithImpl(
      _$ClientErrorImpl _value, $Res Function(_$ClientErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ClientErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClientErrorImpl implements _ClientError {
  const _$ClientErrorImpl({required this.message, final String? $type})
      : $type = $type ?? 'clientError';

  factory _$ClientErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClientErrorImplFromJson(json);

  @override
  final String message;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Failure.clientError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientErrorImplCopyWith<_$ClientErrorImpl> get copyWith =>
      __$$ClientErrorImplCopyWithImpl<_$ClientErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverError,
    required TResult Function(String message) clientError,
    required TResult Function() noInternet,
    required TResult Function() noPermission,
    required TResult Function(String message, String? code) firebaseAuthError,
    required TResult Function(String message, String? code)
        firebaseNetworkError,
    required TResult Function(String message, String? code)
        firebaseUnknownError,
  }) {
    return clientError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverError,
    TResult? Function(String message)? clientError,
    TResult? Function()? noInternet,
    TResult? Function()? noPermission,
    TResult? Function(String message, String? code)? firebaseAuthError,
    TResult? Function(String message, String? code)? firebaseNetworkError,
    TResult? Function(String message, String? code)? firebaseUnknownError,
  }) {
    return clientError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverError,
    TResult Function(String message)? clientError,
    TResult Function()? noInternet,
    TResult Function()? noPermission,
    TResult Function(String message, String? code)? firebaseAuthError,
    TResult Function(String message, String? code)? firebaseNetworkError,
    TResult Function(String message, String? code)? firebaseUnknownError,
    required TResult orElse(),
  }) {
    if (clientError != null) {
      return clientError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_ClientError value) clientError,
    required TResult Function(_NoInternet value) noInternet,
    required TResult Function(_NoPermission value) noPermission,
    required TResult Function(_FirebaseAuthError value) firebaseAuthError,
    required TResult Function(_FirebaseNetworkError value) firebaseNetworkError,
    required TResult Function(_FirebaseUnknownError value) firebaseUnknownError,
  }) {
    return clientError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_ClientError value)? clientError,
    TResult? Function(_NoInternet value)? noInternet,
    TResult? Function(_NoPermission value)? noPermission,
    TResult? Function(_FirebaseAuthError value)? firebaseAuthError,
    TResult? Function(_FirebaseNetworkError value)? firebaseNetworkError,
    TResult? Function(_FirebaseUnknownError value)? firebaseUnknownError,
  }) {
    return clientError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_ClientError value)? clientError,
    TResult Function(_NoInternet value)? noInternet,
    TResult Function(_NoPermission value)? noPermission,
    TResult Function(_FirebaseAuthError value)? firebaseAuthError,
    TResult Function(_FirebaseNetworkError value)? firebaseNetworkError,
    TResult Function(_FirebaseUnknownError value)? firebaseUnknownError,
    required TResult orElse(),
  }) {
    if (clientError != null) {
      return clientError(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ClientErrorImplToJson(
      this,
    );
  }
}

abstract class _ClientError implements Failure {
  const factory _ClientError({required final String message}) =
      _$ClientErrorImpl;

  factory _ClientError.fromJson(Map<String, dynamic> json) =
      _$ClientErrorImpl.fromJson;

  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClientErrorImplCopyWith<_$ClientErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoInternetImplCopyWith<$Res> {
  factory _$$NoInternetImplCopyWith(
          _$NoInternetImpl value, $Res Function(_$NoInternetImpl) then) =
      __$$NoInternetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoInternetImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$NoInternetImpl>
    implements _$$NoInternetImplCopyWith<$Res> {
  __$$NoInternetImplCopyWithImpl(
      _$NoInternetImpl _value, $Res Function(_$NoInternetImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$NoInternetImpl implements _NoInternet {
  const _$NoInternetImpl({final String? $type}) : $type = $type ?? 'noInternet';

  factory _$NoInternetImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoInternetImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Failure.noInternet()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoInternetImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverError,
    required TResult Function(String message) clientError,
    required TResult Function() noInternet,
    required TResult Function() noPermission,
    required TResult Function(String message, String? code) firebaseAuthError,
    required TResult Function(String message, String? code)
        firebaseNetworkError,
    required TResult Function(String message, String? code)
        firebaseUnknownError,
  }) {
    return noInternet();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverError,
    TResult? Function(String message)? clientError,
    TResult? Function()? noInternet,
    TResult? Function()? noPermission,
    TResult? Function(String message, String? code)? firebaseAuthError,
    TResult? Function(String message, String? code)? firebaseNetworkError,
    TResult? Function(String message, String? code)? firebaseUnknownError,
  }) {
    return noInternet?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverError,
    TResult Function(String message)? clientError,
    TResult Function()? noInternet,
    TResult Function()? noPermission,
    TResult Function(String message, String? code)? firebaseAuthError,
    TResult Function(String message, String? code)? firebaseNetworkError,
    TResult Function(String message, String? code)? firebaseUnknownError,
    required TResult orElse(),
  }) {
    if (noInternet != null) {
      return noInternet();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_ClientError value) clientError,
    required TResult Function(_NoInternet value) noInternet,
    required TResult Function(_NoPermission value) noPermission,
    required TResult Function(_FirebaseAuthError value) firebaseAuthError,
    required TResult Function(_FirebaseNetworkError value) firebaseNetworkError,
    required TResult Function(_FirebaseUnknownError value) firebaseUnknownError,
  }) {
    return noInternet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_ClientError value)? clientError,
    TResult? Function(_NoInternet value)? noInternet,
    TResult? Function(_NoPermission value)? noPermission,
    TResult? Function(_FirebaseAuthError value)? firebaseAuthError,
    TResult? Function(_FirebaseNetworkError value)? firebaseNetworkError,
    TResult? Function(_FirebaseUnknownError value)? firebaseUnknownError,
  }) {
    return noInternet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_ClientError value)? clientError,
    TResult Function(_NoInternet value)? noInternet,
    TResult Function(_NoPermission value)? noPermission,
    TResult Function(_FirebaseAuthError value)? firebaseAuthError,
    TResult Function(_FirebaseNetworkError value)? firebaseNetworkError,
    TResult Function(_FirebaseUnknownError value)? firebaseUnknownError,
    required TResult orElse(),
  }) {
    if (noInternet != null) {
      return noInternet(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NoInternetImplToJson(
      this,
    );
  }
}

abstract class _NoInternet implements Failure {
  const factory _NoInternet() = _$NoInternetImpl;

  factory _NoInternet.fromJson(Map<String, dynamic> json) =
      _$NoInternetImpl.fromJson;
}

/// @nodoc
abstract class _$$NoPermissionImplCopyWith<$Res> {
  factory _$$NoPermissionImplCopyWith(
          _$NoPermissionImpl value, $Res Function(_$NoPermissionImpl) then) =
      __$$NoPermissionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoPermissionImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$NoPermissionImpl>
    implements _$$NoPermissionImplCopyWith<$Res> {
  __$$NoPermissionImplCopyWithImpl(
      _$NoPermissionImpl _value, $Res Function(_$NoPermissionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$NoPermissionImpl implements _NoPermission {
  const _$NoPermissionImpl({final String? $type})
      : $type = $type ?? 'noPermission';

  factory _$NoPermissionImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoPermissionImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Failure.noPermission()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoPermissionImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverError,
    required TResult Function(String message) clientError,
    required TResult Function() noInternet,
    required TResult Function() noPermission,
    required TResult Function(String message, String? code) firebaseAuthError,
    required TResult Function(String message, String? code)
        firebaseNetworkError,
    required TResult Function(String message, String? code)
        firebaseUnknownError,
  }) {
    return noPermission();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverError,
    TResult? Function(String message)? clientError,
    TResult? Function()? noInternet,
    TResult? Function()? noPermission,
    TResult? Function(String message, String? code)? firebaseAuthError,
    TResult? Function(String message, String? code)? firebaseNetworkError,
    TResult? Function(String message, String? code)? firebaseUnknownError,
  }) {
    return noPermission?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverError,
    TResult Function(String message)? clientError,
    TResult Function()? noInternet,
    TResult Function()? noPermission,
    TResult Function(String message, String? code)? firebaseAuthError,
    TResult Function(String message, String? code)? firebaseNetworkError,
    TResult Function(String message, String? code)? firebaseUnknownError,
    required TResult orElse(),
  }) {
    if (noPermission != null) {
      return noPermission();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_ClientError value) clientError,
    required TResult Function(_NoInternet value) noInternet,
    required TResult Function(_NoPermission value) noPermission,
    required TResult Function(_FirebaseAuthError value) firebaseAuthError,
    required TResult Function(_FirebaseNetworkError value) firebaseNetworkError,
    required TResult Function(_FirebaseUnknownError value) firebaseUnknownError,
  }) {
    return noPermission(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_ClientError value)? clientError,
    TResult? Function(_NoInternet value)? noInternet,
    TResult? Function(_NoPermission value)? noPermission,
    TResult? Function(_FirebaseAuthError value)? firebaseAuthError,
    TResult? Function(_FirebaseNetworkError value)? firebaseNetworkError,
    TResult? Function(_FirebaseUnknownError value)? firebaseUnknownError,
  }) {
    return noPermission?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_ClientError value)? clientError,
    TResult Function(_NoInternet value)? noInternet,
    TResult Function(_NoPermission value)? noPermission,
    TResult Function(_FirebaseAuthError value)? firebaseAuthError,
    TResult Function(_FirebaseNetworkError value)? firebaseNetworkError,
    TResult Function(_FirebaseUnknownError value)? firebaseUnknownError,
    required TResult orElse(),
  }) {
    if (noPermission != null) {
      return noPermission(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NoPermissionImplToJson(
      this,
    );
  }
}

abstract class _NoPermission implements Failure {
  const factory _NoPermission() = _$NoPermissionImpl;

  factory _NoPermission.fromJson(Map<String, dynamic> json) =
      _$NoPermissionImpl.fromJson;
}

/// @nodoc
abstract class _$$FirebaseAuthErrorImplCopyWith<$Res> {
  factory _$$FirebaseAuthErrorImplCopyWith(_$FirebaseAuthErrorImpl value,
          $Res Function(_$FirebaseAuthErrorImpl) then) =
      __$$FirebaseAuthErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, String? code});
}

/// @nodoc
class __$$FirebaseAuthErrorImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$FirebaseAuthErrorImpl>
    implements _$$FirebaseAuthErrorImplCopyWith<$Res> {
  __$$FirebaseAuthErrorImplCopyWithImpl(_$FirebaseAuthErrorImpl _value,
      $Res Function(_$FirebaseAuthErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = freezed,
  }) {
    return _then(_$FirebaseAuthErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FirebaseAuthErrorImpl implements _FirebaseAuthError {
  const _$FirebaseAuthErrorImpl(
      {required this.message, this.code, final String? $type})
      : $type = $type ?? 'firebaseAuthError';

  factory _$FirebaseAuthErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$FirebaseAuthErrorImplFromJson(json);

  @override
  final String message;
  @override
  final String? code;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Failure.firebaseAuthError(message: $message, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirebaseAuthErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FirebaseAuthErrorImplCopyWith<_$FirebaseAuthErrorImpl> get copyWith =>
      __$$FirebaseAuthErrorImplCopyWithImpl<_$FirebaseAuthErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverError,
    required TResult Function(String message) clientError,
    required TResult Function() noInternet,
    required TResult Function() noPermission,
    required TResult Function(String message, String? code) firebaseAuthError,
    required TResult Function(String message, String? code)
        firebaseNetworkError,
    required TResult Function(String message, String? code)
        firebaseUnknownError,
  }) {
    return firebaseAuthError(message, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverError,
    TResult? Function(String message)? clientError,
    TResult? Function()? noInternet,
    TResult? Function()? noPermission,
    TResult? Function(String message, String? code)? firebaseAuthError,
    TResult? Function(String message, String? code)? firebaseNetworkError,
    TResult? Function(String message, String? code)? firebaseUnknownError,
  }) {
    return firebaseAuthError?.call(message, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverError,
    TResult Function(String message)? clientError,
    TResult Function()? noInternet,
    TResult Function()? noPermission,
    TResult Function(String message, String? code)? firebaseAuthError,
    TResult Function(String message, String? code)? firebaseNetworkError,
    TResult Function(String message, String? code)? firebaseUnknownError,
    required TResult orElse(),
  }) {
    if (firebaseAuthError != null) {
      return firebaseAuthError(message, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_ClientError value) clientError,
    required TResult Function(_NoInternet value) noInternet,
    required TResult Function(_NoPermission value) noPermission,
    required TResult Function(_FirebaseAuthError value) firebaseAuthError,
    required TResult Function(_FirebaseNetworkError value) firebaseNetworkError,
    required TResult Function(_FirebaseUnknownError value) firebaseUnknownError,
  }) {
    return firebaseAuthError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_ClientError value)? clientError,
    TResult? Function(_NoInternet value)? noInternet,
    TResult? Function(_NoPermission value)? noPermission,
    TResult? Function(_FirebaseAuthError value)? firebaseAuthError,
    TResult? Function(_FirebaseNetworkError value)? firebaseNetworkError,
    TResult? Function(_FirebaseUnknownError value)? firebaseUnknownError,
  }) {
    return firebaseAuthError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_ClientError value)? clientError,
    TResult Function(_NoInternet value)? noInternet,
    TResult Function(_NoPermission value)? noPermission,
    TResult Function(_FirebaseAuthError value)? firebaseAuthError,
    TResult Function(_FirebaseNetworkError value)? firebaseNetworkError,
    TResult Function(_FirebaseUnknownError value)? firebaseUnknownError,
    required TResult orElse(),
  }) {
    if (firebaseAuthError != null) {
      return firebaseAuthError(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FirebaseAuthErrorImplToJson(
      this,
    );
  }
}

abstract class _FirebaseAuthError implements Failure {
  const factory _FirebaseAuthError(
      {required final String message,
      final String? code}) = _$FirebaseAuthErrorImpl;

  factory _FirebaseAuthError.fromJson(Map<String, dynamic> json) =
      _$FirebaseAuthErrorImpl.fromJson;

  String get message;
  String? get code;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FirebaseAuthErrorImplCopyWith<_$FirebaseAuthErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FirebaseNetworkErrorImplCopyWith<$Res> {
  factory _$$FirebaseNetworkErrorImplCopyWith(_$FirebaseNetworkErrorImpl value,
          $Res Function(_$FirebaseNetworkErrorImpl) then) =
      __$$FirebaseNetworkErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, String? code});
}

/// @nodoc
class __$$FirebaseNetworkErrorImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$FirebaseNetworkErrorImpl>
    implements _$$FirebaseNetworkErrorImplCopyWith<$Res> {
  __$$FirebaseNetworkErrorImplCopyWithImpl(_$FirebaseNetworkErrorImpl _value,
      $Res Function(_$FirebaseNetworkErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = freezed,
  }) {
    return _then(_$FirebaseNetworkErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FirebaseNetworkErrorImpl implements _FirebaseNetworkError {
  const _$FirebaseNetworkErrorImpl(
      {required this.message, this.code, final String? $type})
      : $type = $type ?? 'firebaseNetworkError';

  factory _$FirebaseNetworkErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$FirebaseNetworkErrorImplFromJson(json);

  @override
  final String message;
  @override
  final String? code;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Failure.firebaseNetworkError(message: $message, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirebaseNetworkErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FirebaseNetworkErrorImplCopyWith<_$FirebaseNetworkErrorImpl>
      get copyWith =>
          __$$FirebaseNetworkErrorImplCopyWithImpl<_$FirebaseNetworkErrorImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverError,
    required TResult Function(String message) clientError,
    required TResult Function() noInternet,
    required TResult Function() noPermission,
    required TResult Function(String message, String? code) firebaseAuthError,
    required TResult Function(String message, String? code)
        firebaseNetworkError,
    required TResult Function(String message, String? code)
        firebaseUnknownError,
  }) {
    return firebaseNetworkError(message, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverError,
    TResult? Function(String message)? clientError,
    TResult? Function()? noInternet,
    TResult? Function()? noPermission,
    TResult? Function(String message, String? code)? firebaseAuthError,
    TResult? Function(String message, String? code)? firebaseNetworkError,
    TResult? Function(String message, String? code)? firebaseUnknownError,
  }) {
    return firebaseNetworkError?.call(message, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverError,
    TResult Function(String message)? clientError,
    TResult Function()? noInternet,
    TResult Function()? noPermission,
    TResult Function(String message, String? code)? firebaseAuthError,
    TResult Function(String message, String? code)? firebaseNetworkError,
    TResult Function(String message, String? code)? firebaseUnknownError,
    required TResult orElse(),
  }) {
    if (firebaseNetworkError != null) {
      return firebaseNetworkError(message, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_ClientError value) clientError,
    required TResult Function(_NoInternet value) noInternet,
    required TResult Function(_NoPermission value) noPermission,
    required TResult Function(_FirebaseAuthError value) firebaseAuthError,
    required TResult Function(_FirebaseNetworkError value) firebaseNetworkError,
    required TResult Function(_FirebaseUnknownError value) firebaseUnknownError,
  }) {
    return firebaseNetworkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_ClientError value)? clientError,
    TResult? Function(_NoInternet value)? noInternet,
    TResult? Function(_NoPermission value)? noPermission,
    TResult? Function(_FirebaseAuthError value)? firebaseAuthError,
    TResult? Function(_FirebaseNetworkError value)? firebaseNetworkError,
    TResult? Function(_FirebaseUnknownError value)? firebaseUnknownError,
  }) {
    return firebaseNetworkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_ClientError value)? clientError,
    TResult Function(_NoInternet value)? noInternet,
    TResult Function(_NoPermission value)? noPermission,
    TResult Function(_FirebaseAuthError value)? firebaseAuthError,
    TResult Function(_FirebaseNetworkError value)? firebaseNetworkError,
    TResult Function(_FirebaseUnknownError value)? firebaseUnknownError,
    required TResult orElse(),
  }) {
    if (firebaseNetworkError != null) {
      return firebaseNetworkError(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FirebaseNetworkErrorImplToJson(
      this,
    );
  }
}

abstract class _FirebaseNetworkError implements Failure {
  const factory _FirebaseNetworkError(
      {required final String message,
      final String? code}) = _$FirebaseNetworkErrorImpl;

  factory _FirebaseNetworkError.fromJson(Map<String, dynamic> json) =
      _$FirebaseNetworkErrorImpl.fromJson;

  String get message;
  String? get code;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FirebaseNetworkErrorImplCopyWith<_$FirebaseNetworkErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FirebaseUnknownErrorImplCopyWith<$Res> {
  factory _$$FirebaseUnknownErrorImplCopyWith(_$FirebaseUnknownErrorImpl value,
          $Res Function(_$FirebaseUnknownErrorImpl) then) =
      __$$FirebaseUnknownErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, String? code});
}

/// @nodoc
class __$$FirebaseUnknownErrorImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$FirebaseUnknownErrorImpl>
    implements _$$FirebaseUnknownErrorImplCopyWith<$Res> {
  __$$FirebaseUnknownErrorImplCopyWithImpl(_$FirebaseUnknownErrorImpl _value,
      $Res Function(_$FirebaseUnknownErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = freezed,
  }) {
    return _then(_$FirebaseUnknownErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FirebaseUnknownErrorImpl implements _FirebaseUnknownError {
  const _$FirebaseUnknownErrorImpl(
      {required this.message, this.code, final String? $type})
      : $type = $type ?? 'firebaseUnknownError';

  factory _$FirebaseUnknownErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$FirebaseUnknownErrorImplFromJson(json);

  @override
  final String message;
  @override
  final String? code;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Failure.firebaseUnknownError(message: $message, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirebaseUnknownErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FirebaseUnknownErrorImplCopyWith<_$FirebaseUnknownErrorImpl>
      get copyWith =>
          __$$FirebaseUnknownErrorImplCopyWithImpl<_$FirebaseUnknownErrorImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverError,
    required TResult Function(String message) clientError,
    required TResult Function() noInternet,
    required TResult Function() noPermission,
    required TResult Function(String message, String? code) firebaseAuthError,
    required TResult Function(String message, String? code)
        firebaseNetworkError,
    required TResult Function(String message, String? code)
        firebaseUnknownError,
  }) {
    return firebaseUnknownError(message, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverError,
    TResult? Function(String message)? clientError,
    TResult? Function()? noInternet,
    TResult? Function()? noPermission,
    TResult? Function(String message, String? code)? firebaseAuthError,
    TResult? Function(String message, String? code)? firebaseNetworkError,
    TResult? Function(String message, String? code)? firebaseUnknownError,
  }) {
    return firebaseUnknownError?.call(message, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverError,
    TResult Function(String message)? clientError,
    TResult Function()? noInternet,
    TResult Function()? noPermission,
    TResult Function(String message, String? code)? firebaseAuthError,
    TResult Function(String message, String? code)? firebaseNetworkError,
    TResult Function(String message, String? code)? firebaseUnknownError,
    required TResult orElse(),
  }) {
    if (firebaseUnknownError != null) {
      return firebaseUnknownError(message, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_ClientError value) clientError,
    required TResult Function(_NoInternet value) noInternet,
    required TResult Function(_NoPermission value) noPermission,
    required TResult Function(_FirebaseAuthError value) firebaseAuthError,
    required TResult Function(_FirebaseNetworkError value) firebaseNetworkError,
    required TResult Function(_FirebaseUnknownError value) firebaseUnknownError,
  }) {
    return firebaseUnknownError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_ClientError value)? clientError,
    TResult? Function(_NoInternet value)? noInternet,
    TResult? Function(_NoPermission value)? noPermission,
    TResult? Function(_FirebaseAuthError value)? firebaseAuthError,
    TResult? Function(_FirebaseNetworkError value)? firebaseNetworkError,
    TResult? Function(_FirebaseUnknownError value)? firebaseUnknownError,
  }) {
    return firebaseUnknownError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_ClientError value)? clientError,
    TResult Function(_NoInternet value)? noInternet,
    TResult Function(_NoPermission value)? noPermission,
    TResult Function(_FirebaseAuthError value)? firebaseAuthError,
    TResult Function(_FirebaseNetworkError value)? firebaseNetworkError,
    TResult Function(_FirebaseUnknownError value)? firebaseUnknownError,
    required TResult orElse(),
  }) {
    if (firebaseUnknownError != null) {
      return firebaseUnknownError(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FirebaseUnknownErrorImplToJson(
      this,
    );
  }
}

abstract class _FirebaseUnknownError implements Failure {
  const factory _FirebaseUnknownError(
      {required final String message,
      final String? code}) = _$FirebaseUnknownErrorImpl;

  factory _FirebaseUnknownError.fromJson(Map<String, dynamic> json) =
      _$FirebaseUnknownErrorImpl.fromJson;

  String get message;
  String? get code;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FirebaseUnknownErrorImplCopyWith<_$FirebaseUnknownErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
