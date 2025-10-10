// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HomePageState _$HomePageStateFromJson(Map<String, dynamic> json) {
  return _HomePageState.fromJson(json);
}

/// @nodoc
mixin _$HomePageState {
  List<GroupModel>? get groups => throw _privateConstructorUsedError;
  ApiState<List<GroupModel>> get groupsStatus =>
      throw _privateConstructorUsedError;
  ApiState<List<UserModel>> get usersStatus =>
      throw _privateConstructorUsedError;

  /// Serializes this HomePageState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HomePageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomePageStateCopyWith<HomePageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageStateCopyWith<$Res> {
  factory $HomePageStateCopyWith(
          HomePageState value, $Res Function(HomePageState) then) =
      _$HomePageStateCopyWithImpl<$Res, HomePageState>;
  @useResult
  $Res call(
      {List<GroupModel>? groups,
      ApiState<List<GroupModel>> groupsStatus,
      ApiState<List<UserModel>> usersStatus});

  $ApiStateCopyWith<List<GroupModel>, $Res> get groupsStatus;
  $ApiStateCopyWith<List<UserModel>, $Res> get usersStatus;
}

/// @nodoc
class _$HomePageStateCopyWithImpl<$Res, $Val extends HomePageState>
    implements $HomePageStateCopyWith<$Res> {
  _$HomePageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomePageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groups = freezed,
    Object? groupsStatus = null,
    Object? usersStatus = null,
  }) {
    return _then(_value.copyWith(
      groups: freezed == groups
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<GroupModel>?,
      groupsStatus: null == groupsStatus
          ? _value.groupsStatus
          : groupsStatus // ignore: cast_nullable_to_non_nullable
              as ApiState<List<GroupModel>>,
      usersStatus: null == usersStatus
          ? _value.usersStatus
          : usersStatus // ignore: cast_nullable_to_non_nullable
              as ApiState<List<UserModel>>,
    ) as $Val);
  }

  /// Create a copy of HomePageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiStateCopyWith<List<GroupModel>, $Res> get groupsStatus {
    return $ApiStateCopyWith<List<GroupModel>, $Res>(_value.groupsStatus,
        (value) {
      return _then(_value.copyWith(groupsStatus: value) as $Val);
    });
  }

  /// Create a copy of HomePageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiStateCopyWith<List<UserModel>, $Res> get usersStatus {
    return $ApiStateCopyWith<List<UserModel>, $Res>(_value.usersStatus,
        (value) {
      return _then(_value.copyWith(usersStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HomePageStateImplCopyWith<$Res>
    implements $HomePageStateCopyWith<$Res> {
  factory _$$HomePageStateImplCopyWith(
          _$HomePageStateImpl value, $Res Function(_$HomePageStateImpl) then) =
      __$$HomePageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<GroupModel>? groups,
      ApiState<List<GroupModel>> groupsStatus,
      ApiState<List<UserModel>> usersStatus});

  @override
  $ApiStateCopyWith<List<GroupModel>, $Res> get groupsStatus;
  @override
  $ApiStateCopyWith<List<UserModel>, $Res> get usersStatus;
}

/// @nodoc
class __$$HomePageStateImplCopyWithImpl<$Res>
    extends _$HomePageStateCopyWithImpl<$Res, _$HomePageStateImpl>
    implements _$$HomePageStateImplCopyWith<$Res> {
  __$$HomePageStateImplCopyWithImpl(
      _$HomePageStateImpl _value, $Res Function(_$HomePageStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomePageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groups = freezed,
    Object? groupsStatus = null,
    Object? usersStatus = null,
  }) {
    return _then(_$HomePageStateImpl(
      groups: freezed == groups
          ? _value._groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<GroupModel>?,
      groupsStatus: null == groupsStatus
          ? _value.groupsStatus
          : groupsStatus // ignore: cast_nullable_to_non_nullable
              as ApiState<List<GroupModel>>,
      usersStatus: null == usersStatus
          ? _value.usersStatus
          : usersStatus // ignore: cast_nullable_to_non_nullable
              as ApiState<List<UserModel>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomePageStateImpl implements _HomePageState {
  const _$HomePageStateImpl(
      {final List<GroupModel>? groups,
      this.groupsStatus = const ApiLoading(),
      this.usersStatus = const ApiLoaded([])})
      : _groups = groups;

  factory _$HomePageStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomePageStateImplFromJson(json);

  final List<GroupModel>? _groups;
  @override
  List<GroupModel>? get groups {
    final value = _groups;
    if (value == null) return null;
    if (_groups is EqualUnmodifiableListView) return _groups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final ApiState<List<GroupModel>> groupsStatus;
  @override
  @JsonKey()
  final ApiState<List<UserModel>> usersStatus;

  @override
  String toString() {
    return 'HomePageState(groups: $groups, groupsStatus: $groupsStatus, usersStatus: $usersStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomePageStateImpl &&
            const DeepCollectionEquality().equals(other._groups, _groups) &&
            (identical(other.groupsStatus, groupsStatus) ||
                other.groupsStatus == groupsStatus) &&
            (identical(other.usersStatus, usersStatus) ||
                other.usersStatus == usersStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_groups), groupsStatus, usersStatus);

  /// Create a copy of HomePageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomePageStateImplCopyWith<_$HomePageStateImpl> get copyWith =>
      __$$HomePageStateImplCopyWithImpl<_$HomePageStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomePageStateImplToJson(
      this,
    );
  }
}

abstract class _HomePageState implements HomePageState {
  const factory _HomePageState(
      {final List<GroupModel>? groups,
      final ApiState<List<GroupModel>> groupsStatus,
      final ApiState<List<UserModel>> usersStatus}) = _$HomePageStateImpl;

  factory _HomePageState.fromJson(Map<String, dynamic> json) =
      _$HomePageStateImpl.fromJson;

  @override
  List<GroupModel>? get groups;
  @override
  ApiState<List<GroupModel>> get groupsStatus;
  @override
  ApiState<List<UserModel>> get usersStatus;

  /// Create a copy of HomePageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomePageStateImplCopyWith<_$HomePageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
