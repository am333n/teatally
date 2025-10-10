import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teatally/core/common/api_state.dart';
import 'package:teatally/core/infrastructure/failure.dart';
import 'package:teatally/features/group/domain/categories_model.dart';
import 'package:teatally/features/group/domain/group_details_state_model.dart';
import 'package:teatally/features/group/domain/item_model.dart';
import 'package:teatally/features/group/domain/session_model.dart';
import 'package:teatally/features/home/domain/users_model.dart';

part 'group_detail_state.freezed.dart';
part 'group_detail_state.g.dart';
// @freezed
// class GroupDetailState with _$GroupDetailState {
//   const factory GroupDetailState.loadedState(
//       GroupDetailsLoadedStateModel loadedStateData) = _LoadedState;
//   const factory GroupDetailState.loadingState() = _LoadingState;
//   const factory GroupDetailState.errorState(Failure failure) = _ErrorState;
// }

@freezed
class GroupDetailState with _$GroupDetailState {
  const factory GroupDetailState({
    @Default(ApiState.loading()) ApiState<List<UserModel>> membersState,
    @Default(ApiState.loading())
    ApiState<List<CategoriesModel>> categoriesState,
    @Default(ApiState.loading()) ApiState<List<ItemModel>> itemsState,
    @Default([]) List<ItemModel> allItems,
    @Default(ApiState.loading()) ApiState<SessionModel?> sessionState,
    String? selectedCategory,
  }) = _GroupDetailState;
  factory GroupDetailState.fromJson(Map<String, dynamic> json) =>
      _$GroupDetailStateFromJson(json);
}
