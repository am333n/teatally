// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) {
  return _NotificationModel.fromJson(json);
}

/// @nodoc
mixin _$NotificationModel {
  @JsonKey(name: 'docId', includeToJson: false)
  String? get docId => throw _privateConstructorUsedError;
  @JsonKey(name: 'userUID')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'uid')
  String get uid => throw _privateConstructorUsedError;
  @JsonKey(name: 'userName')
  String get userName => throw _privateConstructorUsedError;
  @JsonKey(name: 'fcmToken')
  String get fcmToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'deviceName')
  String? get deviceName => throw _privateConstructorUsedError;
  @JsonKey(name: 'deviceID')
  String? get deviceID => throw _privateConstructorUsedError;
  @JsonKey(name: 'deviceDisplayName')
  String? get deviceDisplayName => throw _privateConstructorUsedError;
  @JsonKey(name: 'lastUpdatedAt')
  DateTime? get lastUpdatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'isActive')
  bool? get isActive => throw _privateConstructorUsedError;

  /// Serializes this NotificationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationModelCopyWith<NotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationModelCopyWith<$Res> {
  factory $NotificationModelCopyWith(
          NotificationModel value, $Res Function(NotificationModel) then) =
      _$NotificationModelCopyWithImpl<$Res, NotificationModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'docId', includeToJson: false) String? docId,
      @JsonKey(name: 'userUID') String userId,
      @JsonKey(name: 'uid') String uid,
      @JsonKey(name: 'userName') String userName,
      @JsonKey(name: 'fcmToken') String fcmToken,
      @JsonKey(name: 'deviceName') String? deviceName,
      @JsonKey(name: 'deviceID') String? deviceID,
      @JsonKey(name: 'deviceDisplayName') String? deviceDisplayName,
      @JsonKey(name: 'lastUpdatedAt') DateTime? lastUpdatedAt,
      @JsonKey(name: 'isActive') bool? isActive});
}

/// @nodoc
class _$NotificationModelCopyWithImpl<$Res, $Val extends NotificationModel>
    implements $NotificationModelCopyWith<$Res> {
  _$NotificationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? docId = freezed,
    Object? userId = null,
    Object? uid = null,
    Object? userName = null,
    Object? fcmToken = null,
    Object? deviceName = freezed,
    Object? deviceID = freezed,
    Object? deviceDisplayName = freezed,
    Object? lastUpdatedAt = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      docId: freezed == docId
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
      deviceName: freezed == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceID: freezed == deviceID
          ? _value.deviceID
          : deviceID // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceDisplayName: freezed == deviceDisplayName
          ? _value.deviceDisplayName
          : deviceDisplayName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdatedAt: freezed == lastUpdatedAt
          ? _value.lastUpdatedAt
          : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationModelImplCopyWith<$Res>
    implements $NotificationModelCopyWith<$Res> {
  factory _$$NotificationModelImplCopyWith(_$NotificationModelImpl value,
          $Res Function(_$NotificationModelImpl) then) =
      __$$NotificationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'docId', includeToJson: false) String? docId,
      @JsonKey(name: 'userUID') String userId,
      @JsonKey(name: 'uid') String uid,
      @JsonKey(name: 'userName') String userName,
      @JsonKey(name: 'fcmToken') String fcmToken,
      @JsonKey(name: 'deviceName') String? deviceName,
      @JsonKey(name: 'deviceID') String? deviceID,
      @JsonKey(name: 'deviceDisplayName') String? deviceDisplayName,
      @JsonKey(name: 'lastUpdatedAt') DateTime? lastUpdatedAt,
      @JsonKey(name: 'isActive') bool? isActive});
}

/// @nodoc
class __$$NotificationModelImplCopyWithImpl<$Res>
    extends _$NotificationModelCopyWithImpl<$Res, _$NotificationModelImpl>
    implements _$$NotificationModelImplCopyWith<$Res> {
  __$$NotificationModelImplCopyWithImpl(_$NotificationModelImpl _value,
      $Res Function(_$NotificationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? docId = freezed,
    Object? userId = null,
    Object? uid = null,
    Object? userName = null,
    Object? fcmToken = null,
    Object? deviceName = freezed,
    Object? deviceID = freezed,
    Object? deviceDisplayName = freezed,
    Object? lastUpdatedAt = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$NotificationModelImpl(
      docId: freezed == docId
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
      deviceName: freezed == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceID: freezed == deviceID
          ? _value.deviceID
          : deviceID // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceDisplayName: freezed == deviceDisplayName
          ? _value.deviceDisplayName
          : deviceDisplayName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdatedAt: freezed == lastUpdatedAt
          ? _value.lastUpdatedAt
          : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationModelImpl
    with DiagnosticableTreeMixin
    implements _NotificationModel {
  const _$NotificationModelImpl(
      {@JsonKey(name: 'docId', includeToJson: false) this.docId,
      @JsonKey(name: 'userUID') required this.userId,
      @JsonKey(name: 'uid') required this.uid,
      @JsonKey(name: 'userName') required this.userName,
      @JsonKey(name: 'fcmToken') required this.fcmToken,
      @JsonKey(name: 'deviceName') this.deviceName,
      @JsonKey(name: 'deviceID') this.deviceID,
      @JsonKey(name: 'deviceDisplayName') this.deviceDisplayName,
      @JsonKey(name: 'lastUpdatedAt') this.lastUpdatedAt,
      @JsonKey(name: 'isActive') this.isActive});

  factory _$NotificationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationModelImplFromJson(json);

  @override
  @JsonKey(name: 'docId', includeToJson: false)
  final String? docId;
  @override
  @JsonKey(name: 'userUID')
  final String userId;
  @override
  @JsonKey(name: 'uid')
  final String uid;
  @override
  @JsonKey(name: 'userName')
  final String userName;
  @override
  @JsonKey(name: 'fcmToken')
  final String fcmToken;
  @override
  @JsonKey(name: 'deviceName')
  final String? deviceName;
  @override
  @JsonKey(name: 'deviceID')
  final String? deviceID;
  @override
  @JsonKey(name: 'deviceDisplayName')
  final String? deviceDisplayName;
  @override
  @JsonKey(name: 'lastUpdatedAt')
  final DateTime? lastUpdatedAt;
  @override
  @JsonKey(name: 'isActive')
  final bool? isActive;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotificationModel(docId: $docId, userId: $userId, uid: $uid, userName: $userName, fcmToken: $fcmToken, deviceName: $deviceName, deviceID: $deviceID, deviceDisplayName: $deviceDisplayName, lastUpdatedAt: $lastUpdatedAt, isActive: $isActive)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NotificationModel'))
      ..add(DiagnosticsProperty('docId', docId))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('userName', userName))
      ..add(DiagnosticsProperty('fcmToken', fcmToken))
      ..add(DiagnosticsProperty('deviceName', deviceName))
      ..add(DiagnosticsProperty('deviceID', deviceID))
      ..add(DiagnosticsProperty('deviceDisplayName', deviceDisplayName))
      ..add(DiagnosticsProperty('lastUpdatedAt', lastUpdatedAt))
      ..add(DiagnosticsProperty('isActive', isActive));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationModelImpl &&
            (identical(other.docId, docId) || other.docId == docId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken) &&
            (identical(other.deviceName, deviceName) ||
                other.deviceName == deviceName) &&
            (identical(other.deviceID, deviceID) ||
                other.deviceID == deviceID) &&
            (identical(other.deviceDisplayName, deviceDisplayName) ||
                other.deviceDisplayName == deviceDisplayName) &&
            (identical(other.lastUpdatedAt, lastUpdatedAt) ||
                other.lastUpdatedAt == lastUpdatedAt) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      docId,
      userId,
      uid,
      userName,
      fcmToken,
      deviceName,
      deviceID,
      deviceDisplayName,
      lastUpdatedAt,
      isActive);

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationModelImplCopyWith<_$NotificationModelImpl> get copyWith =>
      __$$NotificationModelImplCopyWithImpl<_$NotificationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationModelImplToJson(
      this,
    );
  }
}

abstract class _NotificationModel implements NotificationModel {
  const factory _NotificationModel(
          {@JsonKey(name: 'docId', includeToJson: false) final String? docId,
          @JsonKey(name: 'userUID') required final String userId,
          @JsonKey(name: 'uid') required final String uid,
          @JsonKey(name: 'userName') required final String userName,
          @JsonKey(name: 'fcmToken') required final String fcmToken,
          @JsonKey(name: 'deviceName') final String? deviceName,
          @JsonKey(name: 'deviceID') final String? deviceID,
          @JsonKey(name: 'deviceDisplayName') final String? deviceDisplayName,
          @JsonKey(name: 'lastUpdatedAt') final DateTime? lastUpdatedAt,
          @JsonKey(name: 'isActive') final bool? isActive}) =
      _$NotificationModelImpl;

  factory _NotificationModel.fromJson(Map<String, dynamic> json) =
      _$NotificationModelImpl.fromJson;

  @override
  @JsonKey(name: 'docId', includeToJson: false)
  String? get docId;
  @override
  @JsonKey(name: 'userUID')
  String get userId;
  @override
  @JsonKey(name: 'uid')
  String get uid;
  @override
  @JsonKey(name: 'userName')
  String get userName;
  @override
  @JsonKey(name: 'fcmToken')
  String get fcmToken;
  @override
  @JsonKey(name: 'deviceName')
  String? get deviceName;
  @override
  @JsonKey(name: 'deviceID')
  String? get deviceID;
  @override
  @JsonKey(name: 'deviceDisplayName')
  String? get deviceDisplayName;
  @override
  @JsonKey(name: 'lastUpdatedAt')
  DateTime? get lastUpdatedAt;
  @override
  @JsonKey(name: 'isActive')
  bool? get isActive;

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationModelImplCopyWith<_$NotificationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
