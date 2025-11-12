// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SendNotificationModel _$SendNotificationModelFromJson(
    Map<String, dynamic> json) {
  return _SendNotificationModel.fromJson(json);
}

/// @nodoc
mixin _$SendNotificationModel {
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'body')
  String get body => throw _privateConstructorUsedError;
  @JsonKey(name: 'tokens')
  List<String> get tokens => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  NotificationData? get data => throw _privateConstructorUsedError;

  /// Serializes this SendNotificationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SendNotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SendNotificationModelCopyWith<SendNotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendNotificationModelCopyWith<$Res> {
  factory $SendNotificationModelCopyWith(SendNotificationModel value,
          $Res Function(SendNotificationModel) then) =
      _$SendNotificationModelCopyWithImpl<$Res, SendNotificationModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String title,
      @JsonKey(name: 'body') String body,
      @JsonKey(name: 'tokens') List<String> tokens,
      @JsonKey(name: 'data') NotificationData? data});

  $NotificationDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$SendNotificationModelCopyWithImpl<$Res,
        $Val extends SendNotificationModel>
    implements $SendNotificationModelCopyWith<$Res> {
  _$SendNotificationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SendNotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? body = null,
    Object? tokens = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      tokens: null == tokens
          ? _value.tokens
          : tokens // ignore: cast_nullable_to_non_nullable
              as List<String>,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as NotificationData?,
    ) as $Val);
  }

  /// Create a copy of SendNotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $NotificationDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SendNotificationModelImplCopyWith<$Res>
    implements $SendNotificationModelCopyWith<$Res> {
  factory _$$SendNotificationModelImplCopyWith(
          _$SendNotificationModelImpl value,
          $Res Function(_$SendNotificationModelImpl) then) =
      __$$SendNotificationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String title,
      @JsonKey(name: 'body') String body,
      @JsonKey(name: 'tokens') List<String> tokens,
      @JsonKey(name: 'data') NotificationData? data});

  @override
  $NotificationDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$SendNotificationModelImplCopyWithImpl<$Res>
    extends _$SendNotificationModelCopyWithImpl<$Res,
        _$SendNotificationModelImpl>
    implements _$$SendNotificationModelImplCopyWith<$Res> {
  __$$SendNotificationModelImplCopyWithImpl(_$SendNotificationModelImpl _value,
      $Res Function(_$SendNotificationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendNotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? body = null,
    Object? tokens = null,
    Object? data = freezed,
  }) {
    return _then(_$SendNotificationModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      tokens: null == tokens
          ? _value._tokens
          : tokens // ignore: cast_nullable_to_non_nullable
              as List<String>,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as NotificationData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SendNotificationModelImpl
    with DiagnosticableTreeMixin
    implements _SendNotificationModel {
  const _$SendNotificationModelImpl(
      {@JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'body') required this.body,
      @JsonKey(name: 'tokens') required final List<String> tokens,
      @JsonKey(name: 'data') this.data})
      : _tokens = tokens;

  factory _$SendNotificationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SendNotificationModelImplFromJson(json);

  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'body')
  final String body;
  final List<String> _tokens;
  @override
  @JsonKey(name: 'tokens')
  List<String> get tokens {
    if (_tokens is EqualUnmodifiableListView) return _tokens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tokens);
  }

  @override
  @JsonKey(name: 'data')
  final NotificationData? data;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SendNotificationModel(title: $title, body: $body, tokens: $tokens, data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SendNotificationModel'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('body', body))
      ..add(DiagnosticsProperty('tokens', tokens))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendNotificationModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            const DeepCollectionEquality().equals(other._tokens, _tokens) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, body,
      const DeepCollectionEquality().hash(_tokens), data);

  /// Create a copy of SendNotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendNotificationModelImplCopyWith<_$SendNotificationModelImpl>
      get copyWith => __$$SendNotificationModelImplCopyWithImpl<
          _$SendNotificationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SendNotificationModelImplToJson(
      this,
    );
  }
}

abstract class _SendNotificationModel implements SendNotificationModel {
  const factory _SendNotificationModel(
          {@JsonKey(name: 'title') required final String title,
          @JsonKey(name: 'body') required final String body,
          @JsonKey(name: 'tokens') required final List<String> tokens,
          @JsonKey(name: 'data') final NotificationData? data}) =
      _$SendNotificationModelImpl;

  factory _SendNotificationModel.fromJson(Map<String, dynamic> json) =
      _$SendNotificationModelImpl.fromJson;

  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'body')
  String get body;
  @override
  @JsonKey(name: 'tokens')
  List<String> get tokens;
  @override
  @JsonKey(name: 'data')
  NotificationData? get data;

  /// Create a copy of SendNotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendNotificationModelImplCopyWith<_$SendNotificationModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

NotificationData _$NotificationDataFromJson(Map<String, dynamic> json) {
  return _NotificationData.fromJson(json);
}

/// @nodoc
mixin _$NotificationData {
  @JsonKey(name: 'type')
  String? get type => throw _privateConstructorUsedError;

  /// Serializes this NotificationData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationDataCopyWith<NotificationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationDataCopyWith<$Res> {
  factory $NotificationDataCopyWith(
          NotificationData value, $Res Function(NotificationData) then) =
      _$NotificationDataCopyWithImpl<$Res, NotificationData>;
  @useResult
  $Res call({@JsonKey(name: 'type') String? type});
}

/// @nodoc
class _$NotificationDataCopyWithImpl<$Res, $Val extends NotificationData>
    implements $NotificationDataCopyWith<$Res> {
  _$NotificationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationDataImplCopyWith<$Res>
    implements $NotificationDataCopyWith<$Res> {
  factory _$$NotificationDataImplCopyWith(_$NotificationDataImpl value,
          $Res Function(_$NotificationDataImpl) then) =
      __$$NotificationDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'type') String? type});
}

/// @nodoc
class __$$NotificationDataImplCopyWithImpl<$Res>
    extends _$NotificationDataCopyWithImpl<$Res, _$NotificationDataImpl>
    implements _$$NotificationDataImplCopyWith<$Res> {
  __$$NotificationDataImplCopyWithImpl(_$NotificationDataImpl _value,
      $Res Function(_$NotificationDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
  }) {
    return _then(_$NotificationDataImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationDataImpl
    with DiagnosticableTreeMixin
    implements _NotificationData {
  const _$NotificationDataImpl({@JsonKey(name: 'type') this.type});

  factory _$NotificationDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationDataImplFromJson(json);

  @override
  @JsonKey(name: 'type')
  final String? type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotificationData(type: $type)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NotificationData'))
      ..add(DiagnosticsProperty('type', type));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationDataImpl &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type);

  /// Create a copy of NotificationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationDataImplCopyWith<_$NotificationDataImpl> get copyWith =>
      __$$NotificationDataImplCopyWithImpl<_$NotificationDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationDataImplToJson(
      this,
    );
  }
}

abstract class _NotificationData implements NotificationData {
  const factory _NotificationData({@JsonKey(name: 'type') final String? type}) =
      _$NotificationDataImpl;

  factory _NotificationData.fromJson(Map<String, dynamic> json) =
      _$NotificationDataImpl.fromJson;

  @override
  @JsonKey(name: 'type')
  String? get type;

  /// Create a copy of NotificationData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationDataImplCopyWith<_$NotificationDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
