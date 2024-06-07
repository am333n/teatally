import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teatally/home/domain/beverages.dart';
import 'package:teatally/home/domain/item.dart';

part 'home_page_state.freezed.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState.loading() = _Loading;
  const factory HomePageState.loaded(
      {required List<BeverageType> beverageTypes,
      required List<ItemCounter> selecteditems,
      required int total}) = _Loaded;
}
