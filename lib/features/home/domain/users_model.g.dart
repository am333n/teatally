// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      email: json['email'] as String,
      displayName: json['displayName'] as String?,
      uid: json['uid'] as String,
      docId: json['docId'] as String?,
      photoURL: json['photoURL'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'displayName': instance.displayName,
      'uid': instance.uid,
      'docId': instance.docId,
      'photoURL': instance.photoURL,
    };
