import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teatally/features/home/application/home_page_state.dart';
import 'package:teatally/features/home/domain/beverages.dart';
import 'package:teatally/features/home/domain/group_model.dart';
import 'package:teatally/features/home/domain/item.dart';
import 'package:teatally/features/home/domain/users_model.dart';
import 'package:teatally/features/home/infrastructure/home_repository.dart';

@injectable
class HomePageCubit extends Cubit<HomePageState> {
  final HomeRepository _repository;
  HomePageCubit(this._repository) : super(HomePageState.loading());
  List<ItemCounter> selectedBeverages = [];
  final beverages = BeverageData.beverageTypes;
  int total = 0;

  void addGroup() {}

  Future<List<UserModel?>> getAllUsers() async {
    final response = await _repository.getAllUsersList();
    return response.fold((l) {
      return [];
    }, (r) {
      log(r.toString());
      return r;
    });
  }

  Future<void> createGroup(GroupModel groupDetails) async {
    final response = await _repository.createGroup(groupDetails);
    return response.fold((l) {}, (r) {
      loadGroups();
      log(r.toString());
    });
  }

  Future<void> loadGroups() async {
    final response = await _repository.getAllGroups();
    response.fold((l) {}, (r) {
      emit(HomePageState.loaded(groups: r));
    });
  }
  // void loadBeverages() {
  //   emit(HomePageState.loaded(
  //       beverageTypes: beverages,
  //       selecteditems: selectedBeverages,
  //       total: total));
  // }

  // void addItem(int itemId) {
  //   emit(const HomePageState.loading());

  //   // Find the beverage and its rate
  //   final beverageType = beverages.firstWhere(
  //       (type) => type.beverages.any((beverage) => beverage.id == itemId));
  //   final beverageItem =
  //       beverageType.beverages.firstWhere((beverage) => beverage.id == itemId);
  //   final rate = beverageItem.rate;

  //   // Find the index of the item in the list, if it exists
  //   int existingIndex =
  //       selectedBeverages.indexWhere((item) => item.id == itemId);
  //   if (existingIndex != -1) {
  //     // If item exists, increment its count
  //     selectedBeverages[existingIndex] = ItemCounter(
  //         id: itemId, count: selectedBeverages[existingIndex].count + 1);
  //   } else {
  //     // If item does not exist, add it to the list with count 1
  //     selectedBeverages.add(ItemCounter(id: itemId, count: 1));
  //   }

  //   // Update the total
  //   total += rate;

  //   emit(HomePageState.loaded(
  //       beverageTypes: beverages,
  //       selecteditems: selectedBeverages,
  //       total: total));
  // }

  // void removeItem(int itemId) {
  //   emit(const HomePageState.loading());

  //   // Find the beverage and its rate
  //   final beverageType = beverages.firstWhere(
  //       (type) => type.beverages.any((beverage) => beverage.id == itemId));
  //   final beverageItem =
  //       beverageType.beverages.firstWhere((beverage) => beverage.id == itemId);
  //   final rate = beverageItem.rate;

  //   // Find the index of the item in the list, if it exists
  //   int existingIndex =
  //       selectedBeverages.indexWhere((item) => item.id == itemId);
  //   if (existingIndex != -1) {
  //     if (selectedBeverages[existingIndex].count > 1) {
  //       // If item count is more than 1, decrement its count
  //       selectedBeverages[existingIndex] = ItemCounter(
  //           id: itemId, count: selectedBeverages[existingIndex].count - 1);
  //       // Update the total
  //       total -= rate;
  //     } else {
  //       // If item count is 1, remove the item from the list
  //       selectedBeverages.removeAt(existingIndex);
  //       // Update the total
  //       total -= rate;
  //     }
  //   }

  //   emit(HomePageState.loaded(
  //       beverageTypes: beverages,
  //       selecteditems: selectedBeverages,
  //       total: total));
  // }

  // void reset() {
  //   emit(const HomePageState.loading());
  //   selectedBeverages.clear();
  //   total = 0;
  //   emit(HomePageState.loaded(
  //       beverageTypes: beverages,
  //       selecteditems: selectedBeverages,
  //       total: total));
  // }

  // Future<void> saveSelectedData() async {
  //   try {
  //     if (total != 0) {
  //       final prefs = await SharedPreferences.getInstance();
  //       final now = DateTime.now();
  //       final dateString = '${now.year}-${now.month}-${now.day}';
  //       final hour = now.hour > 12 ? now.hour - 12 : now.hour;
  //       final timeString =
  //           '${hour}:${now.minute} ${now.hour >= 12 ? 'PM' : 'AM'}';
  //       final dateKey = '$dateString $timeString';
  //       final dataToSave = {
  //         'date': dateKey,
  //         'selectedBeverages':
  //             selectedBeverages.map((item) => item.toJson()).toList(),
  //         'total': total,
  //       };
  //       await prefs.setString('selectedData_$dateKey', json.encode(dataToSave));
  //     } else {
  //       Fluttertoast.showToast(
  //         msg: 'Woops! Nothing to Save',
  //       );
  //     }
  //   } catch (e) {
  //     // Handle error
  //     Fluttertoast.showToast(
  //       msg: 'Error saving Data',
  //     );
  //     print("Error saving data: $e");
  //   }
  // }

  // Future<void> loadSelectedData(String dateKey) async {
  //   try {
  //     final prefs = await SharedPreferences.getInstance();
  //     final savedData = prefs.getString(dateKey);
  //     if (savedData != null) {
  //       final parsedData = json.decode(savedData);
  //       final savedSelectedBeveragesList =
  //           (parsedData['selectedBeverages'] as List)
  //               .map((itemJson) => ItemCounter.fromJson(itemJson))
  //               .toList();
  //       final savedTotal = parsedData['total'] ?? 0;
  //       selectedBeverages = savedSelectedBeveragesList;
  //       total = savedTotal;
  //       Fluttertoast.showToast(
  //         msg: 'Data From: ${extractDate(dateKey)}',
  //       );
  //       emit(HomePageState.loaded(
  //         beverageTypes: beverages,
  //         selecteditems: selectedBeverages,
  //         total: total,
  //       ));
  //     }
  //   } catch (e) {
  //     // Handle error
  //     Fluttertoast.showToast(
  //       msg: 'Error Loading Data',
  //     );
  //   }
  // }

  // Future<List<String>> getSavedDates() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final keys = prefs.getKeys();
  //   final dateKeys = keys.where((key) => key.startsWith('selectedData_'));
  //   return dateKeys.toList();
  // }

  // Future<void> deleteSavedData(String dateKey) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.remove(dateKey);
  // }
}

String extractDate(String key) {
  // Assuming the key format is 'selectedData_YYYY-MM-DD'
  final parts = key.split('_');
  if (parts.length == 2) {
    return parts[1];
  }
  return key; // Return the key as is if format is unexpected
}
