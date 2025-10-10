// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_page_loaded_state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HomePageLoadedStateModel _$HomePageLoadedStateModelFromJson(
    Map<String, dynamic> json) {
  return _HomePageLoadedStateModel.fromJson(json);
}

/// @nodoc
mixin _$HomePageLoadedStateModel {
  List<GroupModel>? get groups => throw _privateConstructorUsedError;
  bool? get isButtonLoading => throw _privateConstructorUsedError;

  /// Serializes this HomePageLoadedStateModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HomePageLoadedStateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomePageLoadedStateModelCopyWith<HomePageLoadedStateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageLoadedStateModelCopyWith<$Res> {
  factory $HomePageLoadedStateModelCopyWith(HomePageLoadedStateModel value,
          $Res Function(HomePageLoadedStateModel) then) =
      _$HomePageLoadedStateModelCopyWithImpl<$Res, HomePageLoadedStateModel>;
  @useResult
  $Res call({List<GroupModel>? groups, bool? isButtonLoading});
}

/// @nodoc
class _$HomePageLoadedStateModelCopyWithImpl<$Res,
        $Val extends HomePageLoadedStateModel>
    implements $HomePageLoadedStateModelCopyWith<$Res> {
  _$HomePageLoadedStateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomePageLoadedStateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groups = freezed,
    Object? isButtonLoading = freezed,
  }) {
    return _then(_value.copyWith(
      groups: freezed == groups
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<GroupModel>?,
      isButtonLoading: freezed == isButtonLoading
          ? _value.isButtonLoading
          : isButtonLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomePageLoadedStateModelImplCopyWith<$Res>
    implements $HomePageLoadedStateModelCopyWith<$Res> {
  factory _$$HomePageLoadedStateModelImplCopyWith(
          _$HomePageLoadedStateModelImpl value,
          $Res Function(_$HomePageLoadedStateModelImpl) then) =
      __$$HomePageLoadedStateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<GroupModel>? groups, bool? isButtonLoading});
}

/// @nodoc
class __$$HomePageLoadedStateModelImplCopyWithImpl<$Res>
    extends _$HomePageLoadedStateModelCopyWithImpl<$Res,
        _$HomePageLoadedStateModelImpl>
    implements _$$HomePageLoadedStateModelImplCopyWith<$Res> {
  __$$HomePageLoadedStateModelImplCopyWithImpl(
      _$HomePageLoadedStateModelImpl _value,
      $Res Function(_$HomePageLoadedStateModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomePageLoadedStateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groups = freezed,
    Object? isButtonLoading = freezed,
  }) {
    return _then(_$HomePageLoadedStateModelImpl(
      groups: freezed == groups
          ? _value._groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<GroupModel>?,
      isButtonLoading: freezed == isButtonLoading
          ? _value.isButtonLoading
          : isButtonLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomePageLoadedStateModelImpl
    with DiagnosticableTreeMixin
    implements _HomePageLoadedStateModel {
  const _$HomePageLoadedStateModelImpl(
      {final List<GroupModel>? groups, this.isButtonLoading})
      : _groups = groups;

  factory _$HomePageLoadedStateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomePageLoadedStateModelImplFromJson(json);

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
  final bool? isButtonLoading;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomePageLoadedStateModel(groups: $groups, isButtonLoading: $isButtonLoading)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomePageLoadedStateModel'))
      ..add(DiagnosticsProperty('groups', groups))
      ..add(DiagnosticsProperty('isButtonLoading', isButtonLoading));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomePageLoadedStateModelImpl &&
            const DeepCollectionEquality().equals(other._groups, _groups) &&
            (identical(other.isButtonLoading, isButtonLoading) ||
                other.isButtonLoading == isButtonLoading));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_groups), isButtonLoading);

  /// Create a copy of HomePageLoadedStateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomePageLoadedStateModelImplCopyWith<_$HomePageLoadedStateModelImpl>
      get copyWith => __$$HomePageLoadedStateModelImplCopyWithImpl<
          _$HomePageLoadedStateModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomePageLoadedStateModelImplToJson(
      this,
    );
  }
}

abstract class _HomePageLoadedStateModel implements HomePageLoadedStateModel {
  const factory _HomePageLoadedStateModel(
      {final List<GroupModel>? groups,
      final bool? isButtonLoading}) = _$HomePageLoadedStateModelImpl;

  factory _HomePageLoadedStateModel.fromJson(Map<String, dynamic> json) =
      _$HomePageLoadedStateModelImpl.fromJson;

  @override
  List<GroupModel>? get groups;
  @override
  bool? get isButtonLoading;

  /// Create a copy of HomePageLoadedStateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomePageLoadedStateModelImplCopyWith<_$HomePageLoadedStateModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
