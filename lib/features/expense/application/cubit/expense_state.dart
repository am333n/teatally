part of 'expense_cubit.dart';

@freezed
class ExpenseState with _$ExpenseState {
  const factory ExpenseState({
    @Default(ApiState.loading()) ApiState<ExpenseFormModel> formData,
    @Default(ApiState.loading())
    ApiState<List<ExpenseFormModel>> expenseListStatus,
    @Default(ApiState.loading())
    ApiState<ExpenseFormModel> expenseDetailsStatus,
  }) = _ExpenseState;
  factory ExpenseState.fromJson(Map<String, dynamic> json) =>
      _$ExpenseStateFromJson(json);
}
