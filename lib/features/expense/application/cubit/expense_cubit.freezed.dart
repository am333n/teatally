// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExpenseState _$ExpenseStateFromJson(Map<String, dynamic> json) {
  return _ExpenseState.fromJson(json);
}

/// @nodoc
mixin _$ExpenseState {
  ApiState<ExpenseFormModel> get formData => throw _privateConstructorUsedError;
  ApiState<List<ExpenseFormModel>> get expenseListStatus =>
      throw _privateConstructorUsedError;
  ApiState<ExpenseFormModel> get expenseDetailsStatus =>
      throw _privateConstructorUsedError;

  /// Serializes this ExpenseState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExpenseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExpenseStateCopyWith<ExpenseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseStateCopyWith<$Res> {
  factory $ExpenseStateCopyWith(
          ExpenseState value, $Res Function(ExpenseState) then) =
      _$ExpenseStateCopyWithImpl<$Res, ExpenseState>;
  @useResult
  $Res call(
      {ApiState<ExpenseFormModel> formData,
      ApiState<List<ExpenseFormModel>> expenseListStatus,
      ApiState<ExpenseFormModel> expenseDetailsStatus});

  $ApiStateCopyWith<ExpenseFormModel, $Res> get formData;
  $ApiStateCopyWith<List<ExpenseFormModel>, $Res> get expenseListStatus;
  $ApiStateCopyWith<ExpenseFormModel, $Res> get expenseDetailsStatus;
}

/// @nodoc
class _$ExpenseStateCopyWithImpl<$Res, $Val extends ExpenseState>
    implements $ExpenseStateCopyWith<$Res> {
  _$ExpenseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpenseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formData = null,
    Object? expenseListStatus = null,
    Object? expenseDetailsStatus = null,
  }) {
    return _then(_value.copyWith(
      formData: null == formData
          ? _value.formData
          : formData // ignore: cast_nullable_to_non_nullable
              as ApiState<ExpenseFormModel>,
      expenseListStatus: null == expenseListStatus
          ? _value.expenseListStatus
          : expenseListStatus // ignore: cast_nullable_to_non_nullable
              as ApiState<List<ExpenseFormModel>>,
      expenseDetailsStatus: null == expenseDetailsStatus
          ? _value.expenseDetailsStatus
          : expenseDetailsStatus // ignore: cast_nullable_to_non_nullable
              as ApiState<ExpenseFormModel>,
    ) as $Val);
  }

  /// Create a copy of ExpenseState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiStateCopyWith<ExpenseFormModel, $Res> get formData {
    return $ApiStateCopyWith<ExpenseFormModel, $Res>(_value.formData, (value) {
      return _then(_value.copyWith(formData: value) as $Val);
    });
  }

  /// Create a copy of ExpenseState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiStateCopyWith<List<ExpenseFormModel>, $Res> get expenseListStatus {
    return $ApiStateCopyWith<List<ExpenseFormModel>, $Res>(
        _value.expenseListStatus, (value) {
      return _then(_value.copyWith(expenseListStatus: value) as $Val);
    });
  }

  /// Create a copy of ExpenseState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiStateCopyWith<ExpenseFormModel, $Res> get expenseDetailsStatus {
    return $ApiStateCopyWith<ExpenseFormModel, $Res>(
        _value.expenseDetailsStatus, (value) {
      return _then(_value.copyWith(expenseDetailsStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ExpenseStateImplCopyWith<$Res>
    implements $ExpenseStateCopyWith<$Res> {
  factory _$$ExpenseStateImplCopyWith(
          _$ExpenseStateImpl value, $Res Function(_$ExpenseStateImpl) then) =
      __$$ExpenseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ApiState<ExpenseFormModel> formData,
      ApiState<List<ExpenseFormModel>> expenseListStatus,
      ApiState<ExpenseFormModel> expenseDetailsStatus});

  @override
  $ApiStateCopyWith<ExpenseFormModel, $Res> get formData;
  @override
  $ApiStateCopyWith<List<ExpenseFormModel>, $Res> get expenseListStatus;
  @override
  $ApiStateCopyWith<ExpenseFormModel, $Res> get expenseDetailsStatus;
}

/// @nodoc
class __$$ExpenseStateImplCopyWithImpl<$Res>
    extends _$ExpenseStateCopyWithImpl<$Res, _$ExpenseStateImpl>
    implements _$$ExpenseStateImplCopyWith<$Res> {
  __$$ExpenseStateImplCopyWithImpl(
      _$ExpenseStateImpl _value, $Res Function(_$ExpenseStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formData = null,
    Object? expenseListStatus = null,
    Object? expenseDetailsStatus = null,
  }) {
    return _then(_$ExpenseStateImpl(
      formData: null == formData
          ? _value.formData
          : formData // ignore: cast_nullable_to_non_nullable
              as ApiState<ExpenseFormModel>,
      expenseListStatus: null == expenseListStatus
          ? _value.expenseListStatus
          : expenseListStatus // ignore: cast_nullable_to_non_nullable
              as ApiState<List<ExpenseFormModel>>,
      expenseDetailsStatus: null == expenseDetailsStatus
          ? _value.expenseDetailsStatus
          : expenseDetailsStatus // ignore: cast_nullable_to_non_nullable
              as ApiState<ExpenseFormModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExpenseStateImpl implements _ExpenseState {
  const _$ExpenseStateImpl(
      {this.formData = const ApiState.loading(),
      this.expenseListStatus = const ApiState.loading(),
      this.expenseDetailsStatus = const ApiState.loading()});

  factory _$ExpenseStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpenseStateImplFromJson(json);

  @override
  @JsonKey()
  final ApiState<ExpenseFormModel> formData;
  @override
  @JsonKey()
  final ApiState<List<ExpenseFormModel>> expenseListStatus;
  @override
  @JsonKey()
  final ApiState<ExpenseFormModel> expenseDetailsStatus;

  @override
  String toString() {
    return 'ExpenseState(formData: $formData, expenseListStatus: $expenseListStatus, expenseDetailsStatus: $expenseDetailsStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpenseStateImpl &&
            (identical(other.formData, formData) ||
                other.formData == formData) &&
            (identical(other.expenseListStatus, expenseListStatus) ||
                other.expenseListStatus == expenseListStatus) &&
            (identical(other.expenseDetailsStatus, expenseDetailsStatus) ||
                other.expenseDetailsStatus == expenseDetailsStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, formData, expenseListStatus, expenseDetailsStatus);

  /// Create a copy of ExpenseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpenseStateImplCopyWith<_$ExpenseStateImpl> get copyWith =>
      __$$ExpenseStateImplCopyWithImpl<_$ExpenseStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpenseStateImplToJson(
      this,
    );
  }
}

abstract class _ExpenseState implements ExpenseState {
  const factory _ExpenseState(
          {final ApiState<ExpenseFormModel> formData,
          final ApiState<List<ExpenseFormModel>> expenseListStatus,
          final ApiState<ExpenseFormModel> expenseDetailsStatus}) =
      _$ExpenseStateImpl;

  factory _ExpenseState.fromJson(Map<String, dynamic> json) =
      _$ExpenseStateImpl.fromJson;

  @override
  ApiState<ExpenseFormModel> get formData;
  @override
  ApiState<List<ExpenseFormModel>> get expenseListStatus;
  @override
  ApiState<ExpenseFormModel> get expenseDetailsStatus;

  /// Create a copy of ExpenseState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpenseStateImplCopyWith<_$ExpenseStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
