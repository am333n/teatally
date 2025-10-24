// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_form_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExpenseFormModel _$ExpenseFormModelFromJson(Map<String, dynamic> json) {
  return _ExpenseFormModel.fromJson(json);
}

/// @nodoc
mixin _$ExpenseFormModel {
  @JsonKey(ignore: true)
  List<UserModel> get members => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  bool get isLoading => throw _privateConstructorUsedError;
  @JsonKey(name: 'total')
  double get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'paidByUserId')
  String? get paidByUserId => throw _privateConstructorUsedError;
  @JsonKey(name: 'uid')
  String? get uid => throw _privateConstructorUsedError;
  @JsonKey(name: 'docId', includeToJson: false)
  String? get docId => throw _privateConstructorUsedError;
  @JsonKey(name: 'groupId')
  String? get groupId => throw _privateConstructorUsedError;
  @JsonKey(name: 'sessionId')
  String? get sessionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'paidByUserName')
  String? get paidByUserName => throw _privateConstructorUsedError;
  @JsonKey(name: 'isPaid')
  bool? get isPaid => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'date')
  DateTime? get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedById')
  String? get updatedById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedByUserName')
  String? get updatedByUserName => throw _privateConstructorUsedError;
  @JsonKey(name: 'userExpense')
  List<ExpenseUserData> get userExpense => throw _privateConstructorUsedError;

  /// Serializes this ExpenseFormModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExpenseFormModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExpenseFormModelCopyWith<ExpenseFormModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseFormModelCopyWith<$Res> {
  factory $ExpenseFormModelCopyWith(
          ExpenseFormModel value, $Res Function(ExpenseFormModel) then) =
      _$ExpenseFormModelCopyWithImpl<$Res, ExpenseFormModel>;
  @useResult
  $Res call(
      {@JsonKey(ignore: true) List<UserModel> members,
      @JsonKey(ignore: true) bool isLoading,
      @JsonKey(name: 'total') double total,
      @JsonKey(name: 'paidByUserId') String? paidByUserId,
      @JsonKey(name: 'uid') String? uid,
      @JsonKey(name: 'docId', includeToJson: false) String? docId,
      @JsonKey(name: 'groupId') String? groupId,
      @JsonKey(name: 'sessionId') String? sessionId,
      @JsonKey(name: 'paidByUserName') String? paidByUserName,
      @JsonKey(name: 'isPaid') bool? isPaid,
      @JsonKey(name: 'updatedAt') DateTime? updatedAt,
      @JsonKey(name: 'date') DateTime? date,
      @JsonKey(name: 'updatedById') String? updatedById,
      @JsonKey(name: 'updatedByUserName') String? updatedByUserName,
      @JsonKey(name: 'userExpense') List<ExpenseUserData> userExpense});
}

/// @nodoc
class _$ExpenseFormModelCopyWithImpl<$Res, $Val extends ExpenseFormModel>
    implements $ExpenseFormModelCopyWith<$Res> {
  _$ExpenseFormModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpenseFormModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? members = null,
    Object? isLoading = null,
    Object? total = null,
    Object? paidByUserId = freezed,
    Object? uid = freezed,
    Object? docId = freezed,
    Object? groupId = freezed,
    Object? sessionId = freezed,
    Object? paidByUserName = freezed,
    Object? isPaid = freezed,
    Object? updatedAt = freezed,
    Object? date = freezed,
    Object? updatedById = freezed,
    Object? updatedByUserName = freezed,
    Object? userExpense = null,
  }) {
    return _then(_value.copyWith(
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      paidByUserId: freezed == paidByUserId
          ? _value.paidByUserId
          : paidByUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      docId: freezed == docId
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String?,
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String?,
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      paidByUserName: freezed == paidByUserName
          ? _value.paidByUserName
          : paidByUserName // ignore: cast_nullable_to_non_nullable
              as String?,
      isPaid: freezed == isPaid
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedById: freezed == updatedById
          ? _value.updatedById
          : updatedById // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedByUserName: freezed == updatedByUserName
          ? _value.updatedByUserName
          : updatedByUserName // ignore: cast_nullable_to_non_nullable
              as String?,
      userExpense: null == userExpense
          ? _value.userExpense
          : userExpense // ignore: cast_nullable_to_non_nullable
              as List<ExpenseUserData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExpenseFormModelImplCopyWith<$Res>
    implements $ExpenseFormModelCopyWith<$Res> {
  factory _$$ExpenseFormModelImplCopyWith(_$ExpenseFormModelImpl value,
          $Res Function(_$ExpenseFormModelImpl) then) =
      __$$ExpenseFormModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(ignore: true) List<UserModel> members,
      @JsonKey(ignore: true) bool isLoading,
      @JsonKey(name: 'total') double total,
      @JsonKey(name: 'paidByUserId') String? paidByUserId,
      @JsonKey(name: 'uid') String? uid,
      @JsonKey(name: 'docId', includeToJson: false) String? docId,
      @JsonKey(name: 'groupId') String? groupId,
      @JsonKey(name: 'sessionId') String? sessionId,
      @JsonKey(name: 'paidByUserName') String? paidByUserName,
      @JsonKey(name: 'isPaid') bool? isPaid,
      @JsonKey(name: 'updatedAt') DateTime? updatedAt,
      @JsonKey(name: 'date') DateTime? date,
      @JsonKey(name: 'updatedById') String? updatedById,
      @JsonKey(name: 'updatedByUserName') String? updatedByUserName,
      @JsonKey(name: 'userExpense') List<ExpenseUserData> userExpense});
}

/// @nodoc
class __$$ExpenseFormModelImplCopyWithImpl<$Res>
    extends _$ExpenseFormModelCopyWithImpl<$Res, _$ExpenseFormModelImpl>
    implements _$$ExpenseFormModelImplCopyWith<$Res> {
  __$$ExpenseFormModelImplCopyWithImpl(_$ExpenseFormModelImpl _value,
      $Res Function(_$ExpenseFormModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseFormModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? members = null,
    Object? isLoading = null,
    Object? total = null,
    Object? paidByUserId = freezed,
    Object? uid = freezed,
    Object? docId = freezed,
    Object? groupId = freezed,
    Object? sessionId = freezed,
    Object? paidByUserName = freezed,
    Object? isPaid = freezed,
    Object? updatedAt = freezed,
    Object? date = freezed,
    Object? updatedById = freezed,
    Object? updatedByUserName = freezed,
    Object? userExpense = null,
  }) {
    return _then(_$ExpenseFormModelImpl(
      members: null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      paidByUserId: freezed == paidByUserId
          ? _value.paidByUserId
          : paidByUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      docId: freezed == docId
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String?,
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String?,
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      paidByUserName: freezed == paidByUserName
          ? _value.paidByUserName
          : paidByUserName // ignore: cast_nullable_to_non_nullable
              as String?,
      isPaid: freezed == isPaid
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedById: freezed == updatedById
          ? _value.updatedById
          : updatedById // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedByUserName: freezed == updatedByUserName
          ? _value.updatedByUserName
          : updatedByUserName // ignore: cast_nullable_to_non_nullable
              as String?,
      userExpense: null == userExpense
          ? _value._userExpense
          : userExpense // ignore: cast_nullable_to_non_nullable
              as List<ExpenseUserData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExpenseFormModelImpl extends _ExpenseFormModel
    with DiagnosticableTreeMixin {
  const _$ExpenseFormModelImpl(
      {@JsonKey(ignore: true) final List<UserModel> members = const [],
      @JsonKey(ignore: true) this.isLoading = false,
      @JsonKey(name: 'total') this.total = 0.0,
      @JsonKey(name: 'paidByUserId') this.paidByUserId,
      @JsonKey(name: 'uid') this.uid,
      @JsonKey(name: 'docId', includeToJson: false) this.docId,
      @JsonKey(name: 'groupId') this.groupId,
      @JsonKey(name: 'sessionId') this.sessionId,
      @JsonKey(name: 'paidByUserName') this.paidByUserName,
      @JsonKey(name: 'isPaid') this.isPaid = false,
      @JsonKey(name: 'updatedAt') this.updatedAt,
      @JsonKey(name: 'date') this.date,
      @JsonKey(name: 'updatedById') this.updatedById,
      @JsonKey(name: 'updatedByUserName') this.updatedByUserName,
      @JsonKey(name: 'userExpense')
      final List<ExpenseUserData> userExpense = const []})
      : _members = members,
        _userExpense = userExpense,
        super._();

  factory _$ExpenseFormModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpenseFormModelImplFromJson(json);

  final List<UserModel> _members;
  @override
  @JsonKey(ignore: true)
  List<UserModel> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  @override
  @JsonKey(ignore: true)
  final bool isLoading;
  @override
  @JsonKey(name: 'total')
  final double total;
  @override
  @JsonKey(name: 'paidByUserId')
  final String? paidByUserId;
  @override
  @JsonKey(name: 'uid')
  final String? uid;
  @override
  @JsonKey(name: 'docId', includeToJson: false)
  final String? docId;
  @override
  @JsonKey(name: 'groupId')
  final String? groupId;
  @override
  @JsonKey(name: 'sessionId')
  final String? sessionId;
  @override
  @JsonKey(name: 'paidByUserName')
  final String? paidByUserName;
  @override
  @JsonKey(name: 'isPaid')
  final bool? isPaid;
  @override
  @JsonKey(name: 'updatedAt')
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'date')
  final DateTime? date;
  @override
  @JsonKey(name: 'updatedById')
  final String? updatedById;
  @override
  @JsonKey(name: 'updatedByUserName')
  final String? updatedByUserName;
  final List<ExpenseUserData> _userExpense;
  @override
  @JsonKey(name: 'userExpense')
  List<ExpenseUserData> get userExpense {
    if (_userExpense is EqualUnmodifiableListView) return _userExpense;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userExpense);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ExpenseFormModel(members: $members, isLoading: $isLoading, total: $total, paidByUserId: $paidByUserId, uid: $uid, docId: $docId, groupId: $groupId, sessionId: $sessionId, paidByUserName: $paidByUserName, isPaid: $isPaid, updatedAt: $updatedAt, date: $date, updatedById: $updatedById, updatedByUserName: $updatedByUserName, userExpense: $userExpense)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ExpenseFormModel'))
      ..add(DiagnosticsProperty('members', members))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('total', total))
      ..add(DiagnosticsProperty('paidByUserId', paidByUserId))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('docId', docId))
      ..add(DiagnosticsProperty('groupId', groupId))
      ..add(DiagnosticsProperty('sessionId', sessionId))
      ..add(DiagnosticsProperty('paidByUserName', paidByUserName))
      ..add(DiagnosticsProperty('isPaid', isPaid))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('updatedById', updatedById))
      ..add(DiagnosticsProperty('updatedByUserName', updatedByUserName))
      ..add(DiagnosticsProperty('userExpense', userExpense));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpenseFormModelImpl &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.paidByUserId, paidByUserId) ||
                other.paidByUserId == paidByUserId) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.docId, docId) || other.docId == docId) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.paidByUserName, paidByUserName) ||
                other.paidByUserName == paidByUserName) &&
            (identical(other.isPaid, isPaid) || other.isPaid == isPaid) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.updatedById, updatedById) ||
                other.updatedById == updatedById) &&
            (identical(other.updatedByUserName, updatedByUserName) ||
                other.updatedByUserName == updatedByUserName) &&
            const DeepCollectionEquality()
                .equals(other._userExpense, _userExpense));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_members),
      isLoading,
      total,
      paidByUserId,
      uid,
      docId,
      groupId,
      sessionId,
      paidByUserName,
      isPaid,
      updatedAt,
      date,
      updatedById,
      updatedByUserName,
      const DeepCollectionEquality().hash(_userExpense));

  /// Create a copy of ExpenseFormModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpenseFormModelImplCopyWith<_$ExpenseFormModelImpl> get copyWith =>
      __$$ExpenseFormModelImplCopyWithImpl<_$ExpenseFormModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpenseFormModelImplToJson(
      this,
    );
  }
}

abstract class _ExpenseFormModel extends ExpenseFormModel {
  const factory _ExpenseFormModel(
      {@JsonKey(ignore: true) final List<UserModel> members,
      @JsonKey(ignore: true) final bool isLoading,
      @JsonKey(name: 'total') final double total,
      @JsonKey(name: 'paidByUserId') final String? paidByUserId,
      @JsonKey(name: 'uid') final String? uid,
      @JsonKey(name: 'docId', includeToJson: false) final String? docId,
      @JsonKey(name: 'groupId') final String? groupId,
      @JsonKey(name: 'sessionId') final String? sessionId,
      @JsonKey(name: 'paidByUserName') final String? paidByUserName,
      @JsonKey(name: 'isPaid') final bool? isPaid,
      @JsonKey(name: 'updatedAt') final DateTime? updatedAt,
      @JsonKey(name: 'date') final DateTime? date,
      @JsonKey(name: 'updatedById') final String? updatedById,
      @JsonKey(name: 'updatedByUserName') final String? updatedByUserName,
      @JsonKey(name: 'userExpense')
      final List<ExpenseUserData> userExpense}) = _$ExpenseFormModelImpl;
  const _ExpenseFormModel._() : super._();

  factory _ExpenseFormModel.fromJson(Map<String, dynamic> json) =
      _$ExpenseFormModelImpl.fromJson;

  @override
  @JsonKey(ignore: true)
  List<UserModel> get members;
  @override
  @JsonKey(ignore: true)
  bool get isLoading;
  @override
  @JsonKey(name: 'total')
  double get total;
  @override
  @JsonKey(name: 'paidByUserId')
  String? get paidByUserId;
  @override
  @JsonKey(name: 'uid')
  String? get uid;
  @override
  @JsonKey(name: 'docId', includeToJson: false)
  String? get docId;
  @override
  @JsonKey(name: 'groupId')
  String? get groupId;
  @override
  @JsonKey(name: 'sessionId')
  String? get sessionId;
  @override
  @JsonKey(name: 'paidByUserName')
  String? get paidByUserName;
  @override
  @JsonKey(name: 'isPaid')
  bool? get isPaid;
  @override
  @JsonKey(name: 'updatedAt')
  DateTime? get updatedAt;
  @override
  @JsonKey(name: 'date')
  DateTime? get date;
  @override
  @JsonKey(name: 'updatedById')
  String? get updatedById;
  @override
  @JsonKey(name: 'updatedByUserName')
  String? get updatedByUserName;
  @override
  @JsonKey(name: 'userExpense')
  List<ExpenseUserData> get userExpense;

  /// Create a copy of ExpenseFormModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpenseFormModelImplCopyWith<_$ExpenseFormModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExpenseUserData _$ExpenseUserDataFromJson(Map<String, dynamic> json) {
  return _ExpenseUserData.fromJson(json);
}

/// @nodoc
mixin _$ExpenseUserData {
  @JsonKey(name: 'uid')
  String get uid => throw _privateConstructorUsedError;
  @JsonKey(name: 'userName')
  String get userName => throw _privateConstructorUsedError;
  @JsonKey(name: 'photoURL')
  String? get photoURL => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount')
  double get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'items')
  List<ExpenseItemModel> get items => throw _privateConstructorUsedError;

  /// Serializes this ExpenseUserData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExpenseUserData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExpenseUserDataCopyWith<ExpenseUserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseUserDataCopyWith<$Res> {
  factory $ExpenseUserDataCopyWith(
          ExpenseUserData value, $Res Function(ExpenseUserData) then) =
      _$ExpenseUserDataCopyWithImpl<$Res, ExpenseUserData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'uid') String uid,
      @JsonKey(name: 'userName') String userName,
      @JsonKey(name: 'photoURL') String? photoURL,
      @JsonKey(name: 'amount') double amount,
      @JsonKey(name: 'items') List<ExpenseItemModel> items});
}

/// @nodoc
class _$ExpenseUserDataCopyWithImpl<$Res, $Val extends ExpenseUserData>
    implements $ExpenseUserDataCopyWith<$Res> {
  _$ExpenseUserDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpenseUserData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? userName = null,
    Object? photoURL = freezed,
    Object? amount = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      photoURL: freezed == photoURL
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ExpenseItemModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExpenseUserDataImplCopyWith<$Res>
    implements $ExpenseUserDataCopyWith<$Res> {
  factory _$$ExpenseUserDataImplCopyWith(_$ExpenseUserDataImpl value,
          $Res Function(_$ExpenseUserDataImpl) then) =
      __$$ExpenseUserDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'uid') String uid,
      @JsonKey(name: 'userName') String userName,
      @JsonKey(name: 'photoURL') String? photoURL,
      @JsonKey(name: 'amount') double amount,
      @JsonKey(name: 'items') List<ExpenseItemModel> items});
}

/// @nodoc
class __$$ExpenseUserDataImplCopyWithImpl<$Res>
    extends _$ExpenseUserDataCopyWithImpl<$Res, _$ExpenseUserDataImpl>
    implements _$$ExpenseUserDataImplCopyWith<$Res> {
  __$$ExpenseUserDataImplCopyWithImpl(
      _$ExpenseUserDataImpl _value, $Res Function(_$ExpenseUserDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseUserData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? userName = null,
    Object? photoURL = freezed,
    Object? amount = null,
    Object? items = null,
  }) {
    return _then(_$ExpenseUserDataImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      photoURL: freezed == photoURL
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ExpenseItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExpenseUserDataImpl
    with DiagnosticableTreeMixin
    implements _ExpenseUserData {
  const _$ExpenseUserDataImpl(
      {@JsonKey(name: 'uid') required this.uid,
      @JsonKey(name: 'userName') required this.userName,
      @JsonKey(name: 'photoURL') this.photoURL,
      @JsonKey(name: 'amount') required this.amount,
      @JsonKey(name: 'items') required final List<ExpenseItemModel> items})
      : _items = items;

  factory _$ExpenseUserDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpenseUserDataImplFromJson(json);

  @override
  @JsonKey(name: 'uid')
  final String uid;
  @override
  @JsonKey(name: 'userName')
  final String userName;
  @override
  @JsonKey(name: 'photoURL')
  final String? photoURL;
  @override
  @JsonKey(name: 'amount')
  final double amount;
  final List<ExpenseItemModel> _items;
  @override
  @JsonKey(name: 'items')
  List<ExpenseItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ExpenseUserData(uid: $uid, userName: $userName, photoURL: $photoURL, amount: $amount, items: $items)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ExpenseUserData'))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('userName', userName))
      ..add(DiagnosticsProperty('photoURL', photoURL))
      ..add(DiagnosticsProperty('amount', amount))
      ..add(DiagnosticsProperty('items', items));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpenseUserDataImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.photoURL, photoURL) ||
                other.photoURL == photoURL) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uid, userName, photoURL, amount,
      const DeepCollectionEquality().hash(_items));

  /// Create a copy of ExpenseUserData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpenseUserDataImplCopyWith<_$ExpenseUserDataImpl> get copyWith =>
      __$$ExpenseUserDataImplCopyWithImpl<_$ExpenseUserDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpenseUserDataImplToJson(
      this,
    );
  }
}

abstract class _ExpenseUserData implements ExpenseUserData {
  const factory _ExpenseUserData(
      {@JsonKey(name: 'uid') required final String uid,
      @JsonKey(name: 'userName') required final String userName,
      @JsonKey(name: 'photoURL') final String? photoURL,
      @JsonKey(name: 'amount') required final double amount,
      @JsonKey(name: 'items')
      required final List<ExpenseItemModel> items}) = _$ExpenseUserDataImpl;

  factory _ExpenseUserData.fromJson(Map<String, dynamic> json) =
      _$ExpenseUserDataImpl.fromJson;

  @override
  @JsonKey(name: 'uid')
  String get uid;
  @override
  @JsonKey(name: 'userName')
  String get userName;
  @override
  @JsonKey(name: 'photoURL')
  String? get photoURL;
  @override
  @JsonKey(name: 'amount')
  double get amount;
  @override
  @JsonKey(name: 'items')
  List<ExpenseItemModel> get items;

  /// Create a copy of ExpenseUserData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpenseUserDataImplCopyWith<_$ExpenseUserDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExpenseItemModel _$ExpenseItemModelFromJson(Map<String, dynamic> json) {
  return _ExpenseItemModel.fromJson(json);
}

/// @nodoc
mixin _$ExpenseItemModel {
  @JsonKey(name: 'uid')
  String get uid => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  double get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'count')
  int get count => throw _privateConstructorUsedError;

  /// Serializes this ExpenseItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExpenseItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExpenseItemModelCopyWith<ExpenseItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseItemModelCopyWith<$Res> {
  factory $ExpenseItemModelCopyWith(
          ExpenseItemModel value, $Res Function(ExpenseItemModel) then) =
      _$ExpenseItemModelCopyWithImpl<$Res, ExpenseItemModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'uid') String uid,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'price') double price,
      @JsonKey(name: 'count') int count});
}

/// @nodoc
class _$ExpenseItemModelCopyWithImpl<$Res, $Val extends ExpenseItemModel>
    implements $ExpenseItemModelCopyWith<$Res> {
  _$ExpenseItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpenseItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? name = null,
    Object? price = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExpenseItemModelImplCopyWith<$Res>
    implements $ExpenseItemModelCopyWith<$Res> {
  factory _$$ExpenseItemModelImplCopyWith(_$ExpenseItemModelImpl value,
          $Res Function(_$ExpenseItemModelImpl) then) =
      __$$ExpenseItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'uid') String uid,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'price') double price,
      @JsonKey(name: 'count') int count});
}

/// @nodoc
class __$$ExpenseItemModelImplCopyWithImpl<$Res>
    extends _$ExpenseItemModelCopyWithImpl<$Res, _$ExpenseItemModelImpl>
    implements _$$ExpenseItemModelImplCopyWith<$Res> {
  __$$ExpenseItemModelImplCopyWithImpl(_$ExpenseItemModelImpl _value,
      $Res Function(_$ExpenseItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? name = null,
    Object? price = null,
    Object? count = null,
  }) {
    return _then(_$ExpenseItemModelImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExpenseItemModelImpl
    with DiagnosticableTreeMixin
    implements _ExpenseItemModel {
  const _$ExpenseItemModelImpl(
      {@JsonKey(name: 'uid') required this.uid,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'price') required this.price,
      @JsonKey(name: 'count') required this.count});

  factory _$ExpenseItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpenseItemModelImplFromJson(json);

  @override
  @JsonKey(name: 'uid')
  final String uid;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'price')
  final double price;
  @override
  @JsonKey(name: 'count')
  final int count;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ExpenseItemModel(uid: $uid, name: $name, price: $price, count: $count)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ExpenseItemModel'))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('count', count));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpenseItemModelImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uid, name, price, count);

  /// Create a copy of ExpenseItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpenseItemModelImplCopyWith<_$ExpenseItemModelImpl> get copyWith =>
      __$$ExpenseItemModelImplCopyWithImpl<_$ExpenseItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpenseItemModelImplToJson(
      this,
    );
  }
}

abstract class _ExpenseItemModel implements ExpenseItemModel {
  const factory _ExpenseItemModel(
          {@JsonKey(name: 'uid') required final String uid,
          @JsonKey(name: 'name') required final String name,
          @JsonKey(name: 'price') required final double price,
          @JsonKey(name: 'count') required final int count}) =
      _$ExpenseItemModelImpl;

  factory _ExpenseItemModel.fromJson(Map<String, dynamic> json) =
      _$ExpenseItemModelImpl.fromJson;

  @override
  @JsonKey(name: 'uid')
  String get uid;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'price')
  double get price;
  @override
  @JsonKey(name: 'count')
  int get count;

  /// Create a copy of ExpenseItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpenseItemModelImplCopyWith<_$ExpenseItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
