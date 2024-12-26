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

/// @nodoc
mixin _$GroupDetailState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(GroupDetailsLoadedStateModel loadedStateData)
        loadedState,
    required TResult Function() loadingState,
    required TResult Function(Failure failure) errorState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(GroupDetailsLoadedStateModel loadedStateData)?
        loadedState,
    TResult? Function()? loadingState,
    TResult? Function(Failure failure)? errorState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GroupDetailsLoadedStateModel loadedStateData)? loadedState,
    TResult Function()? loadingState,
    TResult Function(Failure failure)? errorState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadedState value) loadedState,
    required TResult Function(_LoadingState value) loadingState,
    required TResult Function(_ErrorState value) errorState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadedState value)? loadedState,
    TResult? Function(_LoadingState value)? loadingState,
    TResult? Function(_ErrorState value)? errorState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadedState value)? loadedState,
    TResult Function(_LoadingState value)? loadingState,
    TResult Function(_ErrorState value)? errorState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupDetailStateCopyWith<$Res> {
  factory $GroupDetailStateCopyWith(
          GroupDetailState value, $Res Function(GroupDetailState) then) =
      _$GroupDetailStateCopyWithImpl<$Res, GroupDetailState>;
}

/// @nodoc
class _$GroupDetailStateCopyWithImpl<$Res, $Val extends GroupDetailState>
    implements $GroupDetailStateCopyWith<$Res> {
  _$GroupDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadedStateImplCopyWith<$Res> {
  factory _$$LoadedStateImplCopyWith(
          _$LoadedStateImpl value, $Res Function(_$LoadedStateImpl) then) =
      __$$LoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({GroupDetailsLoadedStateModel loadedStateData});

  $GroupDetailsLoadedStateModelCopyWith<$Res> get loadedStateData;
}

/// @nodoc
class __$$LoadedStateImplCopyWithImpl<$Res>
    extends _$GroupDetailStateCopyWithImpl<$Res, _$LoadedStateImpl>
    implements _$$LoadedStateImplCopyWith<$Res> {
  __$$LoadedStateImplCopyWithImpl(
      _$LoadedStateImpl _value, $Res Function(_$LoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadedStateData = null,
  }) {
    return _then(_$LoadedStateImpl(
      null == loadedStateData
          ? _value.loadedStateData
          : loadedStateData // ignore: cast_nullable_to_non_nullable
              as GroupDetailsLoadedStateModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $GroupDetailsLoadedStateModelCopyWith<$Res> get loadedStateData {
    return $GroupDetailsLoadedStateModelCopyWith<$Res>(_value.loadedStateData,
        (value) {
      return _then(_value.copyWith(loadedStateData: value));
    });
  }
}

/// @nodoc

class _$LoadedStateImpl implements _LoadedState {
  const _$LoadedStateImpl(this.loadedStateData);

  @override
  final GroupDetailsLoadedStateModel loadedStateData;

  @override
  String toString() {
    return 'GroupDetailState.loadedState(loadedStateData: $loadedStateData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedStateImpl &&
            (identical(other.loadedStateData, loadedStateData) ||
                other.loadedStateData == loadedStateData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loadedStateData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedStateImplCopyWith<_$LoadedStateImpl> get copyWith =>
      __$$LoadedStateImplCopyWithImpl<_$LoadedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(GroupDetailsLoadedStateModel loadedStateData)
        loadedState,
    required TResult Function() loadingState,
    required TResult Function(Failure failure) errorState,
  }) {
    return loadedState(loadedStateData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(GroupDetailsLoadedStateModel loadedStateData)?
        loadedState,
    TResult? Function()? loadingState,
    TResult? Function(Failure failure)? errorState,
  }) {
    return loadedState?.call(loadedStateData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GroupDetailsLoadedStateModel loadedStateData)? loadedState,
    TResult Function()? loadingState,
    TResult Function(Failure failure)? errorState,
    required TResult orElse(),
  }) {
    if (loadedState != null) {
      return loadedState(loadedStateData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadedState value) loadedState,
    required TResult Function(_LoadingState value) loadingState,
    required TResult Function(_ErrorState value) errorState,
  }) {
    return loadedState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadedState value)? loadedState,
    TResult? Function(_LoadingState value)? loadingState,
    TResult? Function(_ErrorState value)? errorState,
  }) {
    return loadedState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadedState value)? loadedState,
    TResult Function(_LoadingState value)? loadingState,
    TResult Function(_ErrorState value)? errorState,
    required TResult orElse(),
  }) {
    if (loadedState != null) {
      return loadedState(this);
    }
    return orElse();
  }
}

abstract class _LoadedState implements GroupDetailState {
  const factory _LoadedState(
      final GroupDetailsLoadedStateModel loadedStateData) = _$LoadedStateImpl;

  GroupDetailsLoadedStateModel get loadedStateData;
  @JsonKey(ignore: true)
  _$$LoadedStateImplCopyWith<_$LoadedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingStateImplCopyWith<$Res> {
  factory _$$LoadingStateImplCopyWith(
          _$LoadingStateImpl value, $Res Function(_$LoadingStateImpl) then) =
      __$$LoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingStateImplCopyWithImpl<$Res>
    extends _$GroupDetailStateCopyWithImpl<$Res, _$LoadingStateImpl>
    implements _$$LoadingStateImplCopyWith<$Res> {
  __$$LoadingStateImplCopyWithImpl(
      _$LoadingStateImpl _value, $Res Function(_$LoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingStateImpl implements _LoadingState {
  const _$LoadingStateImpl();

  @override
  String toString() {
    return 'GroupDetailState.loadingState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(GroupDetailsLoadedStateModel loadedStateData)
        loadedState,
    required TResult Function() loadingState,
    required TResult Function(Failure failure) errorState,
  }) {
    return loadingState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(GroupDetailsLoadedStateModel loadedStateData)?
        loadedState,
    TResult? Function()? loadingState,
    TResult? Function(Failure failure)? errorState,
  }) {
    return loadingState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GroupDetailsLoadedStateModel loadedStateData)? loadedState,
    TResult Function()? loadingState,
    TResult Function(Failure failure)? errorState,
    required TResult orElse(),
  }) {
    if (loadingState != null) {
      return loadingState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadedState value) loadedState,
    required TResult Function(_LoadingState value) loadingState,
    required TResult Function(_ErrorState value) errorState,
  }) {
    return loadingState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadedState value)? loadedState,
    TResult? Function(_LoadingState value)? loadingState,
    TResult? Function(_ErrorState value)? errorState,
  }) {
    return loadingState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadedState value)? loadedState,
    TResult Function(_LoadingState value)? loadingState,
    TResult Function(_ErrorState value)? errorState,
    required TResult orElse(),
  }) {
    if (loadingState != null) {
      return loadingState(this);
    }
    return orElse();
  }
}

abstract class _LoadingState implements GroupDetailState {
  const factory _LoadingState() = _$LoadingStateImpl;
}

/// @nodoc
abstract class _$$ErrorStateImplCopyWith<$Res> {
  factory _$$ErrorStateImplCopyWith(
          _$ErrorStateImpl value, $Res Function(_$ErrorStateImpl) then) =
      __$$ErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});

  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$ErrorStateImplCopyWithImpl<$Res>
    extends _$GroupDetailStateCopyWithImpl<$Res, _$ErrorStateImpl>
    implements _$$ErrorStateImplCopyWith<$Res> {
  __$$ErrorStateImplCopyWithImpl(
      _$ErrorStateImpl _value, $Res Function(_$ErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$ErrorStateImpl(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res> get failure {
    return $FailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$ErrorStateImpl implements _ErrorState {
  const _$ErrorStateImpl(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'GroupDetailState.errorState(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorStateImpl &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorStateImplCopyWith<_$ErrorStateImpl> get copyWith =>
      __$$ErrorStateImplCopyWithImpl<_$ErrorStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(GroupDetailsLoadedStateModel loadedStateData)
        loadedState,
    required TResult Function() loadingState,
    required TResult Function(Failure failure) errorState,
  }) {
    return errorState(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(GroupDetailsLoadedStateModel loadedStateData)?
        loadedState,
    TResult? Function()? loadingState,
    TResult? Function(Failure failure)? errorState,
  }) {
    return errorState?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GroupDetailsLoadedStateModel loadedStateData)? loadedState,
    TResult Function()? loadingState,
    TResult Function(Failure failure)? errorState,
    required TResult orElse(),
  }) {
    if (errorState != null) {
      return errorState(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadedState value) loadedState,
    required TResult Function(_LoadingState value) loadingState,
    required TResult Function(_ErrorState value) errorState,
  }) {
    return errorState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadedState value)? loadedState,
    TResult? Function(_LoadingState value)? loadingState,
    TResult? Function(_ErrorState value)? errorState,
  }) {
    return errorState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadedState value)? loadedState,
    TResult Function(_LoadingState value)? loadingState,
    TResult Function(_ErrorState value)? errorState,
    required TResult orElse(),
  }) {
    if (errorState != null) {
      return errorState(this);
    }
    return orElse();
  }
}

abstract class _ErrorState implements GroupDetailState {
  const factory _ErrorState(final Failure failure) = _$ErrorStateImpl;

  Failure get failure;
  @JsonKey(ignore: true)
  _$$ErrorStateImplCopyWith<_$ErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
