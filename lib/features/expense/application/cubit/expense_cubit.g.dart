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
    );

Map<String, dynamic> _$$ExpenseStateImplToJson(_$ExpenseStateImpl instance) =>
    <String, dynamic>{
      'formData': instance.formData.toJson(
        (value) => value.toJson(),
      ),
    };
