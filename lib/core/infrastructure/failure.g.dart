// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'failure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServerErrorImpl _$$ServerErrorImplFromJson(Map<String, dynamic> json) =>
    _$ServerErrorImpl(
      message: json['message'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ServerErrorImplToJson(_$ServerErrorImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'runtimeType': instance.$type,
    };

_$ClientErrorImpl _$$ClientErrorImplFromJson(Map<String, dynamic> json) =>
    _$ClientErrorImpl(
      message: json['message'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ClientErrorImplToJson(_$ClientErrorImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'runtimeType': instance.$type,
    };

_$NoInternetImpl _$$NoInternetImplFromJson(Map<String, dynamic> json) =>
    _$NoInternetImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NoInternetImplToJson(_$NoInternetImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$NoPermissionImpl _$$NoPermissionImplFromJson(Map<String, dynamic> json) =>
    _$NoPermissionImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NoPermissionImplToJson(_$NoPermissionImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$FirebaseAuthErrorImpl _$$FirebaseAuthErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$FirebaseAuthErrorImpl(
      message: json['message'] as String,
      code: json['code'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$FirebaseAuthErrorImplToJson(
        _$FirebaseAuthErrorImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'runtimeType': instance.$type,
    };

_$FirebaseNetworkErrorImpl _$$FirebaseNetworkErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$FirebaseNetworkErrorImpl(
      message: json['message'] as String,
      code: json['code'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$FirebaseNetworkErrorImplToJson(
        _$FirebaseNetworkErrorImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'runtimeType': instance.$type,
    };

_$FirebaseUnknownErrorImpl _$$FirebaseUnknownErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$FirebaseUnknownErrorImpl(
      message: json['message'] as String,
      code: json['code'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$FirebaseUnknownErrorImplToJson(
        _$FirebaseUnknownErrorImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'runtimeType': instance.$type,
    };
