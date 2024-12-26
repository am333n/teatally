import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teatally/core/infrastructure/failure.dart';
import 'package:teatally/features/home/domain/beverages.dart';
import 'package:teatally/features/home/domain/group_model.dart';
import 'package:teatally/features/home/domain/item.dart';

part 'home_page_state.freezed.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState.loading() = _Loading;
  const factory HomePageState.loaded({List<GroupModel>? groups}) = _Loaded;
  const factory HomePageState.error({Failure? failure}) = _Error;
}
