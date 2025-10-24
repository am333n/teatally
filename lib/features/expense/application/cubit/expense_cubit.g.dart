// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpenseStateImpl _$$ExpenseStateImplFromJson(Map<String, dynamic> json) =>
    _$ExpenseStateImpl(
      formData: json['formData'] == null
          ? const ApiState.loading()
          : ApiState<ExpenseFormModel>.fromJson(
              json['formData'] as Map<String, dynamic>,
              (value) =>
                  ExpenseFormModel.fromJson(value as Map<String, dynamic>)),
      expenseListStatus: json['expenseListStatus'] == null
          ? const ApiState.loading()
          : ApiState<List<ExpenseFormModel>>.fromJson(
              json['expenseListStatus'] as Map<String, dynamic>,
              (value) => (value as List<dynamic>)
                  .map((e) =>
                      ExpenseFormModel.fromJson(e as Map<String, dynamic>))
                  .toList()),
      expenseDetailsStatus: json['expenseDetailsStatus'] == null
          ? const ApiState.loading()
          : ApiState<ExpenseFormModel>.fromJson(
              json['expenseDetailsStatus'] as Map<String, dynamic>,
              (value) =>
                  ExpenseFormModel.fromJson(value as Map<String, dynamic>)),
    );

Map<String, dynamic> _$$ExpenseStateImplToJson(_$ExpenseStateImpl instance) =>
    <String, dynamic>{
      'formData': instance.formData.toJson(
        (value) => value.toJson(),
      ),
      'expenseListStatus': instance.expenseListStatus.toJson(
        (value) => value.map((e) => e.toJson()).toList(),
      ),
      'expenseDetailsStatus': instance.expenseDetailsStatus.toJson(
        (value) => value.toJson(),
      ),
    };
