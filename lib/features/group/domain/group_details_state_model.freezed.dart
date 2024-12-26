// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_details_state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GroupDetailsLoadedStateModel _$GroupDetailsLoadedStateModelFromJson(
    Map<String, dynamic> json) {
  return _GroupDetailsLoadedStateModel.fromJson(json);
}

/// @nodoc
mixin _$GroupDetailsLoadedStateModel {
  List<CategoriesModel>? get categories => throw _privateConstructorUsedError;
  List<ItemModel>? get items => throw _privateConstructorUsedError;
  String? get selectedCategory => throw _privateConstructorUsedError;
  List<UserModel>? get members => throw _privateConstructorUsedError;
  SessionModel? get session => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GroupDetailsLoadedStateModelCopyWith<GroupDetailsLoadedStateModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupDetailsLoadedStateModelCopyWith<$Res> {
  factory $GroupDetailsLoadedStateModelCopyWith(
          GroupDetailsLoadedStateModel value,
          $Res Function(GroupDetailsLoadedStateModel) then) =
      _$GroupDetailsLoadedStateModelCopyWithImpl<$Res,
          GroupDetailsLoadedStateModel>;
  @useResult
  $Res call(
      {List<CategoriesModel>? categories,
      List<ItemModel>? items,
      String? selectedCategory,
      List<UserModel>? members,
      SessionModel? session});

  $SessionModelCopyWith<$Res>? get session;
}

/// @nodoc
class _$GroupDetailsLoadedStateModelCopyWithImpl<$Res,
        $Val extends GroupDetailsLoadedStateModel>
    implements $GroupDetailsLoadedStateModelCopyWith<$Res> {
  _$GroupDetailsLoadedStateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = freezed,
    Object? items = freezed,
    Object? selectedCategory = freezed,
    Object? members = freezed,
    Object? session = freezed,
  }) {
    return _then(_value.copyWith(
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoriesModel>?,
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemModel>?,
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      members: freezed == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<UserModel>?,
      session: freezed == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as SessionModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SessionModelCopyWith<$Res>? get session {
    if (_value.session == null) {
      return null;
    }

    return $SessionModelCopyWith<$Res>(_value.session!, (value) {
      return _then(_value.copyWith(session: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GroupDetailsLoadedStateModelImplCopyWith<$Res>
    implements $GroupDetailsLoadedStateModelCopyWith<$Res> {
  factory _$$GroupDetailsLoadedStateModelImplCopyWith(
          _$GroupDetailsLoadedStateModelImpl value,
          $Res Function(_$GroupDetailsLoadedStateModelImpl) then) =
      __$$GroupDetailsLoadedStateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CategoriesModel>? categories,
      List<ItemModel>? items,
      String? selectedCategory,
      List<UserModel>? members,
      SessionModel? session});

  @override
  $SessionModelCopyWith<$Res>? get session;
}

/// @nodoc
class __$$GroupDetailsLoadedStateModelImplCopyWithImpl<$Res>
    extends _$GroupDetailsLoadedStateModelCopyWithImpl<$Res,
        _$GroupDetailsLoadedStateModelImpl>
    implements _$$GroupDetailsLoadedStateModelImplCopyWith<$Res> {
  __$$GroupDetailsLoadedStateModelImplCopyWithImpl(
      _$GroupDetailsLoadedStateModelImpl _value,
      $Res Function(_$GroupDetailsLoadedStateModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = freezed,
    Object? items = freezed,
    Object? selectedCategory = freezed,
    Object? members = freezed,
    Object? session = freezed,
  }) {
    return _then(_$GroupDetailsLoadedStateModelImpl(
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoriesModel>?,
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemModel>?,
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      members: freezed == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<UserModel>?,
      session: freezed == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as SessionModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupDetailsLoadedStateModelImpl
    with DiagnosticableTreeMixin
    implements _GroupDetailsLoadedStateModel {
  const _$GroupDetailsLoadedStateModelImpl(
      {final List<CategoriesModel>? categories,
      final List<ItemModel>? items,
      this.selectedCategory,
      final List<UserModel>? members,
      this.session})
      : _categories = categories,
        _items = items,
        _members = members;

  factory _$GroupDetailsLoadedStateModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$GroupDetailsLoadedStateModelImplFromJson(json);

  final List<CategoriesModel>? _categories;
  @override
  List<CategoriesModel>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ItemModel>? _items;
  @override
  List<ItemModel>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? selectedCategory;
  final List<UserModel>? _members;
  @override
  List<UserModel>? get members {
    final value = _members;
    if (value == null) return null;
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final SessionModel? session;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GroupDetailsLoadedStateModel(categories: $categories, items: $items, selectedCategory: $selectedCategory, members: $members, session: $session)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GroupDetailsLoadedStateModel'))
      ..add(DiagnosticsProperty('categories', categories))
      ..add(DiagnosticsProperty('items', items))
      ..add(DiagnosticsProperty('selectedCategory', selectedCategory))
      ..add(DiagnosticsProperty('members', members))
      ..add(DiagnosticsProperty('session', session));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupDetailsLoadedStateModelImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            (identical(other.session, session) || other.session == session));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_items),
      selectedCategory,
      const DeepCollectionEquality().hash(_members),
      session);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupDetailsLoadedStateModelImplCopyWith<
          _$GroupDetailsLoadedStateModelImpl>
      get copyWith => __$$GroupDetailsLoadedStateModelImplCopyWithImpl<
          _$GroupDetailsLoadedStateModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupDetailsLoadedStateModelImplToJson(
      this,
    );
  }
}

abstract class _GroupDetailsLoadedStateModel
    implements GroupDetailsLoadedStateModel {
  const factory _GroupDetailsLoadedStateModel(
      {final List<CategoriesModel>? categories,
      final List<ItemModel>? items,
      final String? selectedCategory,
      final List<UserModel>? members,
      final SessionModel? session}) = _$GroupDetailsLoadedStateModelImpl;

  factory _GroupDetailsLoadedStateModel.fromJson(Map<String, dynamic> json) =
      _$GroupDetailsLoadedStateModelImpl.fromJson;

  @override
  List<CategoriesModel>? get categories;
  @override
  List<ItemModel>? get items;
  @override
  String? get selectedCategory;
  @override
  List<UserModel>? get members;
  @override
  SessionModel? get session;
  @override
  @JsonKey(ignore: true)
  _$$GroupDetailsLoadedStateModelImplCopyWith<
          _$GroupDetailsLoadedStateModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
