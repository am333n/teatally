import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teatally/core/infrastructure/failure.dart';
import 'package:teatally/features/group/domain/group_details_state_model.dart';

part 'group_detail_state.freezed.dart';

@freezed
class GroupDetailState with _$GroupDetailState {
  const factory GroupDetailState.loadedState(
      GroupDetailsLoadedStateModel loadedStateData) = _LoadedState;
  const factory GroupDetailState.loadingState() = _LoadingState;
  const factory GroupDetailState.errorState(Failure failure) = _ErrorState;
}
