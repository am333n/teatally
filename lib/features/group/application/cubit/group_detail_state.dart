import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_detail_state.freezed.dart';

@freezed
class GroupDetailState with _$GroupDetailState {
  const factory GroupDetailState.initial() = _Initial;
}
