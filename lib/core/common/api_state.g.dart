// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiLoadingImpl<T> _$$ApiLoadingImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$ApiLoadingImpl<T>(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ApiLoadingImplToJson<T>(
  _$ApiLoadingImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$ApiLoadedImpl<T> _$$ApiLoadedImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$ApiLoadedImpl<T>(
      fromJsonT(json['data']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ApiLoadedImplToJson<T>(
  _$ApiLoadedImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': toJsonT(instance.data),
      'runtimeType': instance.$type,
    };

_$ApiErrorImpl<T> _$$ApiErrorImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$ApiErrorImpl<T>(
      Failure.fromJson(json['failure'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ApiErrorImplToJson<T>(
  _$ApiErrorImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'failure': instance.failure.toJson(),
      'runtimeType': instance.$type,
    };
