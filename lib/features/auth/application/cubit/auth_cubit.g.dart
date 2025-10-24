// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthStateImpl _$$AuthStateImplFromJson(Map<String, dynamic> json) =>
    _$AuthStateImpl(
      status: json['status'] == null
          ? const AuthenticationStatus.unAuthenticated()
          : AuthenticationStatus.fromJson(
              json['status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AuthStateImplToJson(_$AuthStateImpl instance) =>
    <String, dynamic>{
      'status': instance.status.toJson(),
    };

_$AuthLoadingImpl _$$AuthLoadingImplFromJson(Map<String, dynamic> json) =>
    _$AuthLoadingImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AuthLoadingImplToJson(_$AuthLoadingImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$AuthenticatedImpl _$$AuthenticatedImplFromJson(Map<String, dynamic> json) =>
    _$AuthenticatedImpl(
      UserData.fromJson(json['userData'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AuthenticatedImplToJson(_$AuthenticatedImpl instance) =>
    <String, dynamic>{
      'userData': instance.userData.toJson(),
      'runtimeType': instance.$type,
    };

_$UnAuthenticatedImpl _$$UnAuthenticatedImplFromJson(
        Map<String, dynamic> json) =>
    _$UnAuthenticatedImpl(
      errorMessage: json['errorMessage'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UnAuthenticatedImplToJson(
        _$UnAuthenticatedImpl instance) =>
    <String, dynamic>{
      'errorMessage': instance.errorMessage,
      'runtimeType': instance.$type,
    };

_$UserDataImpl _$$UserDataImplFromJson(Map<String, dynamic> json) =>
    _$UserDataImpl(
      docId: json['docId'] as String?,
      email: json['email'] as String?,
      displayName: json['displayName'] as String?,
      uid: json['uid'] as String?,
      photoUrl: json['photoURL'] as String?,
      preferences: json['preferences'] == null
          ? null
          : Preferences.fromJson(json['preferences'] as Map<String, dynamic>),
      fireBaseUID: json['fireBaseUID'] as String?,
      lastLogin: json['lastLogin'] == null
          ? null
          : DateTime.parse(json['lastLogin'] as String),
    );

Map<String, dynamic> _$$UserDataImplToJson(_$UserDataImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'displayName': instance.displayName,
      'uid': instance.uid,
      'photoURL': instance.photoUrl,
      'preferences': instance.preferences?.toJson(),
      'fireBaseUID': instance.fireBaseUID,
      'lastLogin': instance.lastLogin?.toIso8601String(),
    };

_$PreferencesImpl _$$PreferencesImplFromJson(Map<String, dynamic> json) =>
    _$PreferencesImpl(
      isDarkMode: json['isDarkMode'] as bool? ?? false,
    );

Map<String, dynamic> _$$PreferencesImplToJson(_$PreferencesImpl instance) =>
    <String, dynamic>{
      'isDarkMode': instance.isDarkMode,
    };
