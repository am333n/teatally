part of 'expense_cubit.dart';

@freezed
class ExpenseState with _$ExpenseState {
  const factory ExpenseState(
          {@Default(ApiState.loading()) ApiState<ExpenseFormModel> formData}) =
      _ExpenseState;
  factory ExpenseState.fromJson(Map<String, dynamic> json) =>
      _$ExpenseStateFromJson(json);
}
