// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GroupDetailState _$GroupDetailStateFromJson(Map<String, dynamic> json) {
  return _GroupDetailState.fromJson(json);
}

/// @nodoc
mixin _$GroupDetailState {
  ApiState<List<UserModel>> get membersState =>
      throw _privateConstructorUsedError;
  ApiState<List<CategoriesModel>> get categoriesState =>
      throw _privateConstructorUsedError;
  ApiState<List<ItemModel>> get itemsState =>
      throw _privateConstructorUsedError;
  List<ItemModel> get allItems => throw _privateConstructorUsedError;
  ApiState<SessionModel?> get sessionState =>
      throw _privateConstructorUsedError;
  String? get selectedCategory => throw _privateConstructorUsedError;

  /// Serializes this GroupDetailState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GroupDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupDetailStateCopyWith<GroupDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupDetailStateCopyWith<$Res> {
  factory $GroupDetailStateCopyWith(
          GroupDetailState value, $Res Function(GroupDetailState) then) =
      _$GroupDetailStateCopyWithImpl<$Res, GroupDetailState>;
  @useResult
  $Res call(
      {ApiState<List<UserModel>> membersState,
      ApiState<List<CategoriesModel>> categoriesState,
      ApiState<List<ItemModel>> itemsState,
      List<ItemModel> allItems,
      ApiState<SessionModel?> sessionState,
      String? selectedCategory});

  $ApiStateCopyWith<List<UserModel>, $Res> get membersState;
  $ApiStateCopyWith<List<CategoriesModel>, $Res> get categoriesState;
  $ApiStateCopyWith<List<ItemModel>, $Res> get itemsState;
  $ApiStateCopyWith<SessionModel?, $Res> get sessionState;
}

/// @nodoc
class _$GroupDetailStateCopyWithImpl<$Res, $Val extends GroupDetailState>
    implements $GroupDetailStateCopyWith<$Res> {
  _$GroupDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? membersState = null,
    Object? categoriesState = null,
    Object? itemsState = null,
    Object? allItems = null,
    Object? sessionState = null,
    Object? selectedCategory = freezed,
  }) {
    return _then(_value.copyWith(
      membersState: null == membersState
          ? _value.membersState
          : membersState // ignore: cast_nullable_to_non_nullable
              as ApiState<List<UserModel>>,
      categoriesState: null == categoriesState
          ? _value.categoriesState
          : categoriesState // ignore: cast_nullable_to_non_nullable
              as ApiState<List<CategoriesModel>>,
      itemsState: null == itemsState
          ? _value.itemsState
          : itemsState // ignore: cast_nullable_to_non_nullable
              as ApiState<List<ItemModel>>,
      allItems: null == allItems
          ? _value.allItems
          : allItems // ignore: cast_nullable_to_non_nullable
              as List<ItemModel>,
      sessionState: null == sessionState
          ? _value.sessionState
          : sessionState // ignore: cast_nullable_to_non_nullable
              as ApiState<SessionModel?>,
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of GroupDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiStateCopyWith<List<UserModel>, $Res> get membersState {
    return $ApiStateCopyWith<List<UserModel>, $Res>(_value.membersState,
        (value) {
      return _then(_value.copyWith(membersState: value) as $Val);
    });
  }

  /// Create a copy of GroupDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiStateCopyWith<List<CategoriesModel>, $Res> get categoriesState {
    return $ApiStateCopyWith<List<CategoriesModel>, $Res>(
        _value.categoriesState, (value) {
      return _then(_value.copyWith(categoriesState: value) as $Val);
    });
  }

  /// Create a copy of GroupDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiStateCopyWith<List<ItemModel>, $Res> get itemsState {
    return $ApiStateCopyWith<List<ItemModel>, $Res>(_value.itemsState, (value) {
      return _then(_value.copyWith(itemsState: value) as $Val);
    });
  }

  /// Create a copy of GroupDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiStateCopyWith<SessionModel?, $Res> get sessionState {
    return $ApiStateCopyWith<SessionModel?, $Res>(_value.sessionState, (value) {
      return _then(_value.copyWith(sessionState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GroupDetailStateImplCopyWith<$Res>
    implements $GroupDetailStateCopyWith<$Res> {
  factory _$$GroupDetailStateImplCopyWith(_$GroupDetailStateImpl value,
          $Res Function(_$GroupDetailStateImpl) then) =
      __$$GroupDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ApiState<List<UserModel>> membersState,
      ApiState<List<CategoriesModel>> categoriesState,
      ApiState<List<ItemModel>> itemsState,
      List<ItemModel> allItems,
      ApiState<SessionModel?> sessionState,
      String? selectedCategory});

  @override
  $ApiStateCopyWith<List<UserModel>, $Res> get membersState;
  @override
  $ApiStateCopyWith<List<CategoriesModel>, $Res> get categoriesState;
  @override
  $ApiStateCopyWith<List<ItemModel>, $Res> get itemsState;
  @override
  $ApiStateCopyWith<SessionModel?, $Res> get sessionState;
}

/// @nodoc
class __$$GroupDetailStateImplCopyWithImpl<$Res>
    extends _$GroupDetailStateCopyWithImpl<$Res, _$GroupDetailStateImpl>
    implements _$$GroupDetailStateImplCopyWith<$Res> {
  __$$GroupDetailStateImplCopyWithImpl(_$GroupDetailStateImpl _value,
      $Res Function(_$GroupDetailStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? membersState = null,
    Object? categoriesState = null,
    Object? itemsState = null,
    Object? allItems = null,
    Object? sessionState = null,
    Object? selectedCategory = freezed,
  }) {
    return _then(_$GroupDetailStateImpl(
      membersState: null == membersState
          ? _value.membersState
          : membersState // ignore: cast_nullable_to_non_nullable
              as ApiState<List<UserModel>>,
      categoriesState: null == categoriesState
          ? _value.categoriesState
          : categoriesState // ignore: cast_nullable_to_non_nullable
              as ApiState<List<CategoriesModel>>,
      itemsState: null == itemsState
          ? _value.itemsState
          : itemsState // ignore: cast_nullable_to_non_nullable
              as ApiState<List<ItemModel>>,
      allItems: null == allItems
          ? _value._allItems
          : allItems // ignore: cast_nullable_to_non_nullable
              as List<ItemModel>,
      sessionState: null == sessionState
          ? _value.sessionState
          : sessionState // ignore: cast_nullable_to_non_nullable
              as ApiState<SessionModel?>,
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupDetailStateImpl implements _GroupDetailState {
  const _$GroupDetailStateImpl(
      {this.membersState = const ApiState.loading(),
      this.categoriesState = const ApiState.loading(),
      this.itemsState = const ApiState.loading(),
      final List<ItemModel> allItems = const [],
      this.sessionState = const ApiState.loading(),
      this.selectedCategory})
      : _allItems = allItems;

  factory _$GroupDetailStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupDetailStateImplFromJson(json);

  @override
  @JsonKey()
  final ApiState<List<UserModel>> membersState;
  @override
  @JsonKey()
  final ApiState<List<CategoriesModel>> categoriesState;
  @override
  @JsonKey()
  final ApiState<List<ItemModel>> itemsState;
  final List<ItemModel> _allItems;
  @override
  @JsonKey()
  List<ItemModel> get allItems {
    if (_allItems is EqualUnmodifiableListView) return _allItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allItems);
  }

  @override
  @JsonKey()
  final ApiState<SessionModel?> sessionState;
  @override
  final String? selectedCategory;

  @override
  String toString() {
    return 'GroupDetailState(membersState: $membersState, categoriesState: $categoriesState, itemsState: $itemsState, allItems: $allItems, sessionState: $sessionState, selectedCategory: $selectedCategory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupDetailStateImpl &&
            (identical(other.membersState, membersState) ||
                other.membersState == membersState) &&
            (identical(other.categoriesState, categoriesState) ||
                other.categoriesState == categoriesState) &&
            (identical(other.itemsState, itemsState) ||
                other.itemsState == itemsState) &&
            const DeepCollectionEquality().equals(other._allItems, _allItems) &&
            (identical(other.sessionState, sessionState) ||
                other.sessionState == sessionState) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      membersState,
      categoriesState,
      itemsState,
      const DeepCollectionEquality().hash(_allItems),
      sessionState,
      selectedCategory);

  /// Create a copy of GroupDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupDetailStateImplCopyWith<_$GroupDetailStateImpl> get copyWith =>
      __$$GroupDetailStateImplCopyWithImpl<_$GroupDetailStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupDetailStateImplToJson(
      this,
    );
  }
}

abstract class _GroupDetailState implements GroupDetailState {
  const factory _GroupDetailState(
      {final ApiState<List<UserModel>> membersState,
      final ApiState<List<CategoriesModel>> categoriesState,
      final ApiState<List<ItemModel>> itemsState,
      final List<ItemModel> allItems,
      final ApiState<SessionModel?> sessionState,
      final String? selectedCategory}) = _$GroupDetailStateImpl;

  factory _GroupDetailState.fromJson(Map<String, dynamic> json) =
      _$GroupDetailStateImpl.fromJson;

  @override
  ApiState<List<UserModel>> get membersState;
  @override
  ApiState<List<CategoriesModel>> get categoriesState;
  @override
  ApiState<List<ItemModel>> get itemsState;
  @override
  List<ItemModel> get allItems;
  @override
  ApiState<SessionModel?> get sessionState;
  @override
  String? get selectedCategory;

  /// Create a copy of GroupDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupDetailStateImplCopyWith<_$GroupDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
