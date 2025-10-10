// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_form_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpenseFormModelImpl _$$ExpenseFormModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ExpenseFormModelImpl(
      total: (json['total'] as num?)?.toDouble() ?? 0.0,
      remainingAmount: (json['remainingAmount'] as num?)?.toDouble() ?? 0.0,
      paidByUserId: json['paidByUserId'] as String?,
      paidByUserName: json['paidByUserName'] as String?,
      status: json['status'] as String?,
      userExpense: (json['userExpense'] as List<dynamic>?)
              ?.map((e) => ExpenseUserData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ExpenseFormModelImplToJson(
        _$ExpenseFormModelImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'remainingAmount': instance.remainingAmount,
      'paidByUserId': instance.paidByUserId,
      'paidByUserName': instance.paidByUserName,
      'status': instance.status,
      'userExpense': instance.userExpense.map((e) => e.toJson()).toList(),
    };

_$ExpenseUserDataImpl _$$ExpenseUserDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ExpenseUserDataImpl(
      uid: json['uid'] as String,
      userName: json['userName'] as String,
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
