// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SessionModel _$SessionModelFromJson(Map<String, dynamic> json) {
  return _SessionModel.fromJson(json);
}

/// @nodoc
mixin _$SessionModel {
  @JsonKey(name: 'uid')
  String? get uid => throw _privateConstructorUsedError;
  @JsonKey(name: 'isCreatedByCurrentUser')
  bool? get isCreatedByCurrentUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'docId', includeToJson: false)
  String? get docId => throw _privateConstructorUsedError;
  @JsonKey(name: 'groupId')
  String? get groupId => throw _privateConstructorUsedError;
  @JsonKey(name: 'startedBy')
  String? get startedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'startedByName')
  String? get startedByName => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedBy')
  String? get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'stoppedAt')
  DateTime? get stoppedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'isActive')
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'selectedItems')
  List<SelectedItem>? get selectedItems => throw _privateConstructorUsedError;

  /// Serializes this SessionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SessionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SessionModelCopyWith<SessionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionModelCopyWith<$Res> {
  factory $SessionModelCopyWith(
          SessionModel value, $Res Function(SessionModel) then) =
      _$SessionModelCopyWithImpl<$Res, SessionModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'uid') String? uid,
      @JsonKey(name: 'isCreatedByCurrentUser') bool? isCreatedByCurrentUser,
      @JsonKey(name: 'docId', includeToJson: false) String? docId,
      @JsonKey(name: 'groupId') String? groupId,
      @JsonKey(name: 'startedBy') String? startedBy,
      @JsonKey(name: 'startedByName') String? startedByName,
      @JsonKey(name: 'createdAt') DateTime? createdAt,
      @JsonKey(name: 'updatedBy') String? updatedBy,
      @JsonKey(name: 'updatedAt') DateTime? updatedAt,
      @JsonKey(name: 'stoppedAt') DateTime? stoppedAt,
      @JsonKey(name: 'isActive') bool? isActive,
      @JsonKey(name: 'selectedItems') List<SelectedItem>? selectedItems});
}

/// @nodoc
class _$SessionModelCopyWithImpl<$Res, $Val extends SessionModel>
    implements $SessionModelCopyWith<$Res> {
  _$SessionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SessionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? isCreatedByCurrentUser = freezed,
    Object? docId = freezed,
    Object? groupId = freezed,
    Object? startedBy = freezed,
    Object? startedByName = freezed,
    Object? createdAt = freezed,
    Object? updatedBy = freezed,
    Object? updatedAt = freezed,
    Object? stoppedAt = freezed,
    Object? isActive = freezed,
    Object? selectedItems = freezed,
  }) {
    return _then(_value.copyWith(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      isCreatedByCurrentUser: freezed == isCreatedByCurrentUser
          ? _value.isCreatedByCurrentUser
          : isCreatedByCurrentUser // ignore: cast_nullable_to_non_nullable
              as bool?,
      docId: freezed == docId
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String?,
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String?,
      startedBy: freezed == startedBy
          ? _value.startedBy
          : startedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      startedByName: freezed == startedByName
          ? _value.startedByName
          : startedByName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      stoppedAt: freezed == stoppedAt
          ? _value.stoppedAt
          : stoppedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      selectedItems: freezed == selectedItems
          ? _value.selectedItems
          : selectedItems // ignore: cast_nullable_to_non_nullable
              as List<SelectedItem>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SessionModelImplCopyWith<$Res>
    implements $SessionModelCopyWith<$Res> {
  factory _$$SessionModelImplCopyWith(
          _$SessionModelImpl value, $Res Function(_$SessionModelImpl) then) =
      __$$SessionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'uid') String? uid,
      @JsonKey(name: 'isCreatedByCurrentUser') bool? isCreatedByCurrentUser,
      @JsonKey(name: 'docId', includeToJson: false) String? docId,
      @JsonKey(name: 'groupId') String? groupId,
      @JsonKey(name: 'startedBy') String? startedBy,
      @JsonKey(name: 'startedByName') String? startedByName,
      @JsonKey(name: 'createdAt') DateTime? createdAt,
      @JsonKey(name: 'updatedBy') String? updatedBy,
      @JsonKey(name: 'updatedAt') DateTime? updatedAt,
      @JsonKey(name: 'stoppedAt') DateTime? stoppedAt,
      @JsonKey(name: 'isActive') bool? isActive,
      @JsonKey(name: 'selectedItems') List<SelectedItem>? selectedItems});
}

/// @nodoc
class __$$SessionModelImplCopyWithImpl<$Res>
    extends _$SessionModelCopyWithImpl<$Res, _$SessionModelImpl>
    implements _$$SessionModelImplCopyWith<$Res> {
  __$$SessionModelImplCopyWithImpl(
      _$SessionModelImpl _value, $Res Function(_$SessionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? isCreatedByCurrentUser = freezed,
    Object? docId = freezed,
    Object? groupId = freezed,
    Object? startedBy = freezed,
    Object? startedByName = freezed,
    Object? createdAt = freezed,
    Object? updatedBy = freezed,
    Object? updatedAt = freezed,
    Object? stoppedAt = freezed,
    Object? isActive = freezed,
    Object? selectedItems = freezed,
  }) {
    return _then(_$SessionModelImpl(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      isCreatedByCurrentUser: freezed == isCreatedByCurrentUser
          ? _value.isCreatedByCurrentUser
          : isCreatedByCurrentUser // ignore: cast_nullable_to_non_nullable
              as bool?,
      docId: freezed == docId
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String?,
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String?,
      startedBy: freezed == startedBy
          ? _value.startedBy
          : startedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      startedByName: freezed == startedByName
          ? _value.startedByName
          : startedByName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      stoppedAt: freezed == stoppedAt
          ? _value.stoppedAt
          : stoppedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      selectedItems: freezed == selectedItems
          ? _value._selectedItems
          : selectedItems // ignore: cast_nullable_to_non_nullable
              as List<SelectedItem>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionModelImpl implements _SessionModel {
  const _$SessionModelImpl(
      {@JsonKey(name: 'uid') this.uid,
      @JsonKey(name: 'isCreatedByCurrentUser') this.isCreatedByCurrentUser,
      @JsonKey(name: 'docId', includeToJson: false) this.docId,
      @JsonKey(name: 'groupId') this.groupId,
      @JsonKey(name: 'startedBy') this.startedBy,
      @JsonKey(name: 'startedByName') this.startedByName,
      @JsonKey(name: 'createdAt') this.createdAt,
      @JsonKey(name: 'updatedBy') this.updatedBy,
      @JsonKey(name: 'updatedAt') this.updatedAt,
      @JsonKey(name: 'stoppedAt') this.stoppedAt,
      @JsonKey(name: 'isActive') this.isActive,
      @JsonKey(name: 'selectedItems') final List<SelectedItem>? selectedItems})
      : _selectedItems = selectedItems;

  factory _$SessionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionModelImplFromJson(json);

  @override
  @JsonKey(name: 'uid')
  final String? uid;
  @override
  @JsonKey(name: 'isCreatedByCurrentUser')
  final bool? isCreatedByCurrentUser;
  @override
  @JsonKey(name: 'docId', includeToJson: false)
  final String? docId;
  @override
  @JsonKey(name: 'groupId')
  final String? groupId;
  @override
  @JsonKey(name: 'startedBy')
  final String? startedBy;
  @override
  @JsonKey(name: 'startedByName')
  final String? startedByName;
  @override
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updatedBy')
  final String? updatedBy;
  @override
  @JsonKey(name: 'updatedAt')
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'stoppedAt')
  final DateTime? stoppedAt;
  @override
  @JsonKey(name: 'isActive')
  final bool? isActive;
  final List<SelectedItem>? _selectedItems;
  @override
  @JsonKey(name: 'selectedItems')
  List<SelectedItem>? get selectedItems {
    final value = _selectedItems;
    if (value == null) return null;
    if (_selectedItems is EqualUnmodifiableListView) return _selectedItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SessionModel(uid: $uid, isCreatedByCurrentUser: $isCreatedByCurrentUser, docId: $docId, groupId: $groupId, startedBy: $startedBy, startedByName: $startedByName, createdAt: $createdAt, updatedBy: $updatedBy, updatedAt: $updatedAt, stoppedAt: $stoppedAt, isActive: $isActive, selectedItems: $selectedItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionModelImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.isCreatedByCurrentUser, isCreatedByCurrentUser) ||
                other.isCreatedByCurrentUser == isCreatedByCurrentUser) &&
            (identical(other.docId, docId) || other.docId == docId) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.startedBy, startedBy) ||
                other.startedBy == startedBy) &&
            (identical(other.startedByName, startedByName) ||
                other.startedByName == startedByName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.stoppedAt, stoppedAt) ||
                other.stoppedAt == stoppedAt) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality()
                .equals(other._selectedItems, _selectedItems));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uid,
      isCreatedByCurrentUser,
      docId,
      groupId,
      startedBy,
      startedByName,
      createdAt,
      updatedBy,
      updatedAt,
      stoppedAt,
      isActive,
      const DeepCollectionEquality().hash(_selectedItems));

  /// Create a copy of SessionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionModelImplCopyWith<_$SessionModelImpl> get copyWith =>
      __$$SessionModelImplCopyWithImpl<_$SessionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionModelImplToJson(
      this,
    );
  }
}

abstract class _SessionModel implements SessionModel {
  const factory _SessionModel(
      {@JsonKey(name: 'uid') final String? uid,
      @JsonKey(name: 'isCreatedByCurrentUser')
      final bool? isCreatedByCurrentUser,
      @JsonKey(name: 'docId', includeToJson: false) final String? docId,
      @JsonKey(name: 'groupId') final String? groupId,
      @JsonKey(name: 'startedBy') final String? startedBy,
      @JsonKey(name: 'startedByName') final String? startedByName,
      @JsonKey(name: 'createdAt') final DateTime? createdAt,
      @JsonKey(name: 'updatedBy') final String? updatedBy,
      @JsonKey(name: 'updatedAt') final DateTime? updatedAt,
      @JsonKey(name: 'stoppedAt') final DateTime? stoppedAt,
      @JsonKey(name: 'isActive') final bool? isActive,
      @JsonKey(name: 'selectedItems')
      final List<SelectedItem>? selectedItems}) = _$SessionModelImpl;

  factory _SessionModel.fromJson(Map<String, dynamic> json) =
      _$SessionModelImpl.fromJson;

  @override
  @JsonKey(name: 'uid')
  String? get uid;
  @override
  @JsonKey(name: 'isCreatedByCurrentUser')
  bool? get isCreatedByCurrentUser;
  @override
  @JsonKey(name: 'docId', includeToJson: false)
  String? get docId;
  @override
  @JsonKey(name: 'groupId')
  String? get groupId;
  @override
  @JsonKey(name: 'startedBy')
  String? get startedBy;
  @override
  @JsonKey(name: 'startedByName')
  String? get startedByName;
  @override
  @JsonKey(name: 'createdAt')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updatedBy')
  String? get updatedBy;
  @override
  @JsonKey(name: 'updatedAt')
  DateTime? get updatedAt;
  @override
  @JsonKey(name: 'stoppedAt')
  DateTime? get stoppedAt;
  @override
  @JsonKey(name: 'isActive')
  bool? get isActive;
  @override
  @JsonKey(name: 'selectedItems')
  List<SelectedItem>? get selectedItems;

  /// Create a copy of SessionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionModelImplCopyWith<_$SessionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SelectedItem _$SelectedItemFromJson(Map<String, dynamic> json) {
  return _SelectedItem.fromJson(json);
}

/// @nodoc
mixin _$SelectedItem {
  @JsonKey(name: 'itemUid')
  String? get itemUid => throw _privateConstructorUsedError;
  @JsonKey(name: 'itemName')
  String? get itemName => throw _privateConstructorUsedError;
  @JsonKey(name: 'categoryId')
  String? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalCount')
  int? get totalCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'itemPrice')
  double? get itemPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'selections')
  List<Selection>? get selections => throw _privateConstructorUsedError;

  /// Serializes this SelectedItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SelectedItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SelectedItemCopyWith<SelectedItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectedItemCopyWith<$Res> {
  factory $SelectedItemCopyWith(
          SelectedItem value, $Res Function(SelectedItem) then) =
      _$SelectedItemCopyWithImpl<$Res, SelectedItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'itemUid') String? itemUid,
      @JsonKey(name: 'itemName') String? itemName,
      @JsonKey(name: 'categoryId') String? categoryId,
      @JsonKey(name: 'totalCount') int? totalCount,
      @JsonKey(name: 'itemPrice') double? itemPrice,
      @JsonKey(name: 'selections') List<Selection>? selections});
}

/// @nodoc
class _$SelectedItemCopyWithImpl<$Res, $Val extends SelectedItem>
    implements $SelectedItemCopyWith<$Res> {
  _$SelectedItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SelectedItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemUid = freezed,
    Object? itemName = freezed,
    Object? categoryId = freezed,
    Object? totalCount = freezed,
    Object? itemPrice = freezed,
    Object? selections = freezed,
  }) {
    return _then(_value.copyWith(
      itemUid: freezed == itemUid
          ? _value.itemUid
          : itemUid // ignore: cast_nullable_to_non_nullable
              as String?,
      itemName: freezed == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
      itemPrice: freezed == itemPrice
          ? _value.itemPrice
          : itemPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      selections: freezed == selections
          ? _value.selections
          : selections // ignore: cast_nullable_to_non_nullable
              as List<Selection>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectedItemImplCopyWith<$Res>
    implements $SelectedItemCopyWith<$Res> {
  factory _$$SelectedItemImplCopyWith(
          _$SelectedItemImpl value, $Res Function(_$SelectedItemImpl) then) =
      __$$SelectedItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'itemUid') String? itemUid,
      @JsonKey(name: 'itemName') String? itemName,
      @JsonKey(name: 'categoryId') String? categoryId,
      @JsonKey(name: 'totalCount') int? totalCount,
      @JsonKey(name: 'itemPrice') double? itemPrice,
      @JsonKey(name: 'selections') List<Selection>? selections});
}

/// @nodoc
class __$$SelectedItemImplCopyWithImpl<$Res>
    extends _$SelectedItemCopyWithImpl<$Res, _$SelectedItemImpl>
    implements _$$SelectedItemImplCopyWith<$Res> {
  __$$SelectedItemImplCopyWithImpl(
      _$SelectedItemImpl _value, $Res Function(_$SelectedItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of SelectedItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemUid = freezed,
    Object? itemName = freezed,
    Object? categoryId = freezed,
    Object? totalCount = freezed,
    Object? itemPrice = freezed,
    Object? selections = freezed,
  }) {
    return _then(_$SelectedItemImpl(
      itemUid: freezed == itemUid
          ? _value.itemUid
          : itemUid // ignore: cast_nullable_to_non_nullable
              as String?,
      itemName: freezed == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
      itemPrice: freezed == itemPrice
          ? _value.itemPrice
          : itemPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      selections: freezed == selections
          ? _value._selections
          : selections // ignore: cast_nullable_to_non_nullable
              as List<Selection>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SelectedItemImpl implements _SelectedItem {
  const _$SelectedItemImpl(
      {@JsonKey(name: 'itemUid') this.itemUid,
      @JsonKey(name: 'itemName') this.itemName,
      @JsonKey(name: 'categoryId') this.categoryId,
      @JsonKey(name: 'totalCount') this.totalCount,
      @JsonKey(name: 'itemPrice') this.itemPrice,
      @JsonKey(name: 'selections') final List<Selection>? selections})
      : _selections = selections;

  factory _$SelectedItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SelectedItemImplFromJson(json);

  @override
  @JsonKey(name: 'itemUid')
  final String? itemUid;
  @override
  @JsonKey(name: 'itemName')
  final String? itemName;
  @override
  @JsonKey(name: 'categoryId')
  final String? categoryId;
  @override
  @JsonKey(name: 'totalCount')
  final int? totalCount;
  @override
  @JsonKey(name: 'itemPrice')
  final double? itemPrice;
  final List<Selection>? _selections;
  @override
  @JsonKey(name: 'selections')
  List<Selection>? get selections {
    final value = _selections;
    if (value == null) return null;
    if (_selections is EqualUnmodifiableListView) return _selections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SelectedItem(itemUid: $itemUid, itemName: $itemName, categoryId: $categoryId, totalCount: $totalCount, itemPrice: $itemPrice, selections: $selections)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedItemImpl &&
            (identical(other.itemUid, itemUid) || other.itemUid == itemUid) &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.itemPrice, itemPrice) ||
                other.itemPrice == itemPrice) &&
            const DeepCollectionEquality()
                .equals(other._selections, _selections));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, itemUid, itemName, categoryId,
      totalCount, itemPrice, const DeepCollectionEquality().hash(_selections));

  /// Create a copy of SelectedItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedItemImplCopyWith<_$SelectedItemImpl> get copyWith =>
      __$$SelectedItemImplCopyWithImpl<_$SelectedItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SelectedItemImplToJson(
      this,
    );
  }
}

abstract class _SelectedItem implements SelectedItem {
  const factory _SelectedItem(
          {@JsonKey(name: 'itemUid') final String? itemUid,
          @JsonKey(name: 'itemName') final String? itemName,
          @JsonKey(name: 'categoryId') final String? categoryId,
          @JsonKey(name: 'totalCount') final int? totalCount,
          @JsonKey(name: 'itemPrice') final double? itemPrice,
          @JsonKey(name: 'selections') final List<Selection>? selections}) =
      _$SelectedItemImpl;

  factory _SelectedItem.fromJson(Map<String, dynamic> json) =
      _$SelectedItemImpl.fromJson;

  @override
  @JsonKey(name: 'itemUid')
  String? get itemUid;
  @override
  @JsonKey(name: 'itemName')
  String? get itemName;
  @override
  @JsonKey(name: 'categoryId')
  String? get categoryId;
  @override
  @JsonKey(name: 'totalCount')
  int? get totalCount;
  @override
  @JsonKey(name: 'itemPrice')
  double? get itemPrice;
  @override
  @JsonKey(name: 'selections')
  List<Selection>? get selections;

  /// Create a copy of SelectedItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectedItemImplCopyWith<_$SelectedItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Selection _$SelectionFromJson(Map<String, dynamic> json) {
  return _Selection.fromJson(json);
}

/// @nodoc
mixin _$Selection {
  @JsonKey(name: 'userUid')
  String? get userUid => throw _privateConstructorUsedError;
  @JsonKey(name: 'count')
  int? get count => throw _privateConstructorUsedError;

  /// Serializes this Selection to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Selection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SelectionCopyWith<Selection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectionCopyWith<$Res> {
  factory $SelectionCopyWith(Selection value, $Res Function(Selection) then) =
      _$SelectionCopyWithImpl<$Res, Selection>;
  @useResult
  $Res call(
      {@JsonKey(name: 'userUid') String? userUid,
      @JsonKey(name: 'count') int? count});
}

/// @nodoc
class _$SelectionCopyWithImpl<$Res, $Val extends Selection>
    implements $SelectionCopyWith<$Res> {
  _$SelectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Selection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userUid = freezed,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      userUid: freezed == userUid
          ? _value.userUid
          : userUid // ignore: cast_nullable_to_non_nullable
              as String?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectionImplCopyWith<$Res>
    implements $SelectionCopyWith<$Res> {
  factory _$$SelectionImplCopyWith(
          _$SelectionImpl value, $Res Function(_$SelectionImpl) then) =
      __$$SelectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'userUid') String? userUid,
      @JsonKey(name: 'count') int? count});
}

/// @nodoc
class __$$SelectionImplCopyWithImpl<$Res>
    extends _$SelectionCopyWithImpl<$Res, _$SelectionImpl>
    implements _$$SelectionImplCopyWith<$Res> {
  __$$SelectionImplCopyWithImpl(
      _$SelectionImpl _value, $Res Function(_$SelectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Selection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userUid = freezed,
    Object? count = freezed,
  }) {
    return _then(_$SelectionImpl(
      userUid: freezed == userUid
          ? _value.userUid
          : userUid // ignore: cast_nullable_to_non_nullable
              as String?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SelectionImpl implements _Selection {
  const _$SelectionImpl(
      {@JsonKey(name: 'userUid') this.userUid,
      @JsonKey(name: 'count') this.count});

  factory _$SelectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SelectionImplFromJson(json);

  @override
  @JsonKey(name: 'userUid')
  final String? userUid;
  @override
  @JsonKey(name: 'count')
  final int? count;

  @override
  String toString() {
    return 'Selection(userUid: $userUid, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectionImpl &&
            (identical(other.userUid, userUid) || other.userUid == userUid) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userUid, count);

  /// Create a copy of Selection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectionImplCopyWith<_$SelectionImpl> get copyWith =>
      __$$SelectionImplCopyWithImpl<_$SelectionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SelectionImplToJson(
      this,
    );
  }
}

abstract class _Selection implements Selection {
  const factory _Selection(
      {@JsonKey(name: 'userUid') final String? userUid,
      @JsonKey(name: 'count') final int? count}) = _$SelectionImpl;

  factory _Selection.fromJson(Map<String, dynamic> json) =
      _$SelectionImpl.fromJson;

  @override
  @JsonKey(name: 'userUid')
  String? get userUid;
  @override
  @JsonKey(name: 'count')
  int? get count;

  /// Create a copy of Selection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectionImplCopyWith<_$SelectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
