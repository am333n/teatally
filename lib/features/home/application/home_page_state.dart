import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teatally/core/common/api_state.dart';
import 'package:teatally/core/infrastructure/failure.dart';
import 'package:teatally/features/home/domain/beverages.dart';
import 'package:teatally/features/home/domain/group_model.dart';
import 'package:teatally/features/home/domain/home_page_loaded_state_model.dart';
import 'package:teatally/features/home/domain/item.dart';
import 'package:teatally/features/home/domain/users_model.dart';

part 'home_page_state.freezed.dart';
part 'home_page_state.g.dart';

@freezed
abstract class HomePageState with _$HomePageState {
  const factory HomePageState({
    List<GroupModel>? groups,
    @Default(ApiLoading()) ApiState<List<GroupModel>> groupsStatus,
    @Default(ApiLoaded([])) ApiState<List<UserModel>> usersStatus,
  }) = _HomePageState;
  factory HomePageState.fromJson(Map<String, dynamic> json) =>
      _$HomePageStateFromJson(json);
}
