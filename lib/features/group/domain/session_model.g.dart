// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SessionModelImpl _$$SessionModelImplFromJson(Map<String, dynamic> json) =>
    _$SessionModelImpl(
      uid: json['uid'] as String?,
      isCreatedByCurrentUser: json['isCreatedByCurrentUser'] as bool?,
      docId: json['docId'] as String?,
      groupId: json['groupId'] as String?,
      startedBy: json['startedBy'] as String?,
      startedByName: json['startedByName'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedBy: json['updatedBy'] as String?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      stoppedAt: json['stoppedAt'] == null
          ? null
          : DateTime.parse(json['stoppedAt'] as String),
      isActive: json['isActive'] as bool?,
      selectedItems: (json['selectedItems'] as List<dynamic>?)
          ?.map((e) => SelectedItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      transferRequest: json['transferRequest'] == null
          ? null
          : TransferRequest.fromJson(
              json['transferRequest'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SessionModelImplToJson(_$SessionModelImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'isCreatedByCurrentUser': instance.isCreatedByCurrentUser,
      'groupId': instance.groupId,
      'startedBy': instance.startedBy,
      'startedByName': instance.startedByName,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedBy': instance.updatedBy,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'stoppedAt': instance.stoppedAt?.toIso8601String(),
      'isActive': instance.isActive,
      'selectedItems': instance.selectedItems?.map((e) => e.toJson()).toList(),
      'transferRequest': instance.transferRequest?.toJson(),
    };

_$SelectedItemImpl _$$SelectedItemImplFromJson(Map<String, dynamic> json) =>
    _$SelectedItemImpl(
      itemUid: json['itemUid'] as String?,
      itemName: json['itemName'] as String?,
      categoryId: json['categoryId'] as String?,
      totalCount: (json['totalCount'] as num?)?.toInt(),
      itemPrice: (json['itemPrice'] as num?)?.toDouble(),
      selections: (json['selections'] as List<dynamic>?)
          ?.map((e) => Selection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SelectedItemImplToJson(_$SelectedItemImpl instance) =>
    <String, dynamic>{
      'itemUid': instance.itemUid,
      'itemName': instance.itemName,
      'categoryId': instance.categoryId,
      'totalCount': instance.totalCount,
      'itemPrice': instance.itemPrice,
      'selections': instance.selections?.map((e) => e.toJson()).toList(),
    };

_$SelectionImpl _$$SelectionImplFromJson(Map<String, dynamic> json) =>
    _$SelectionImpl(
      userUid: json['userUid'] as String?,
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SelectionImplToJson(_$SelectionImpl instance) =>
    <String, dynamic>{
      'userUid': instance.userUid,
      'count': instance.count,
    };

_$TransferRequestImpl _$$TransferRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$TransferRequestImpl(
      requesterUid: json['requesterUid'] as String?,
      requesterName: json['requesterName'] as String?,
      orginalOwner: json['orginalOwner'] as String?,
      orginalOwnerName: json['orginalOwnerName'] as String?,
      accepted: json['accepted'] as bool?,
      time: json['requestTime'] == null
          ? null
          : DateTime.parse(json['requestTime'] as String),
    );

Map<String, dynamic> _$$TransferRequestImplToJson(
        _$TransferRequestImpl instance) =>
    <String, dynamic>{
      'requesterUid': instance.requesterUid,
      'requesterName': instance.requesterName,
      'orginalOwner': instance.orginalOwner,
      'orginalOwnerName': instance.orginalOwnerName,
      'accepted': instance.accepted,
      'requestTime': instance.time?.toIso8601String(),
    };
