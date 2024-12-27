import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:teatally/features/home/domain/group_model.dart';

part 'home_page_loaded_state_model.freezed.dart';
part 'home_page_loaded_state_model.g.dart';

@freezed
class HomePageLoadedStateModel with _$HomePageLoadedStateModel {
  const factory HomePageLoadedStateModel(
      {List<GroupModel>? groups,
      bool? isButtonLoading}) = _HomePageLoadedStateModel;
  factory HomePageLoadedStateModel.fromJson(Map<String, dynamic> json) =>
      _$HomePageLoadedStateModelFromJson(json);
}
