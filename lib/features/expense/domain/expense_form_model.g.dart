// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_form_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpenseFormModelImpl _$$ExpenseFormModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ExpenseFormModelImpl(
      total: (json['total'] as num?)?.toDouble() ?? 0.0,
      paidByUserId: json['paidByUserId'] as String?,
      uid: json['uid'] as String?,
      docId: json['docId'] as String?,
      groupId: json['groupId'] as String?,
      sessionId: json['sessionId'] as String?,
      paidByUserName: json['paidByUserName'] as String?,
      isPaid: json['isPaid'] as bool? ?? false,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      updatedById: json['updatedById'] as String?,
      updatedByUserName: json['updatedByUserName'] as String?,
      userExpense: (json['userExpense'] as List<dynamic>?)
              ?.map((e) => ExpenseUserData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ExpenseFormModelImplToJson(
        _$ExpenseFormModelImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'paidByUserId': instance.paidByUserId,
      'uid': instance.uid,
      'groupId': instance.groupId,
      'sessionId': instance.sessionId,
      'paidByUserName': instance.paidByUserName,
      'isPaid': instance.isPaid,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'date': instance.date?.toIso8601String(),
      'updatedById': instance.updatedById,
      'updatedByUserName': instance.updatedByUserName,
      'userExpense': instance.userExpense.map((e) => e.toJson()).toList(),
    };

_$ExpenseUserDataImpl _$$ExpenseUserDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ExpenseUserDataImpl(
      uid: json['uid'] as String,
      userName: json['userName'] as String,
      photoURL: json['photoURL'] as String?,
      amount: (json['amount'] as num).toDouble(),
      items: (json['items'] as List<dynamic>)
          .map((e) => ExpenseItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ExpenseUserDataImplToJson(
        _$ExpenseUserDataImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'userName': instance.userName,
      'photoURL': instance.photoURL,
      'amount': instance.amount,
      'items': instance.items.map((e) => e.toJson()).toList(),
    };

_$ExpenseItemModelImpl _$$ExpenseItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ExpenseItemModelImpl(
      uid: json['uid'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$$ExpenseItemModelImplToJson(
        _$ExpenseItemModelImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'price': instance.price,
      'count': instance.count,
    };
