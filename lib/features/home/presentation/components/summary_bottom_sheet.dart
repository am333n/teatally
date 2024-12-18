import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teatally/core/app_colors.dart';
import 'package:teatally/core/styles/text/txt.dart';

import 'package:teatally/features/home/domain/beverages.dart';
import 'package:teatally/features/home/domain/item.dart';

import 'package:flutter/material.dart';

import 'package:teatally/features/home/domain/beverages.dart';
import 'package:teatally/features/home/domain/item.dart';
import 'package:teatally/features/home/presentation/components/custom_expanded_card.dart';

class SummaryBottomSheet extends StatefulWidget {
  const SummaryBottomSheet({
    Key? key,
    required this.selectedBeverages,
    required this.beverageTypes,
  }) : super(key: key);

  final List<ItemCounter> selectedBeverages;
  final List<BeverageType> beverageTypes;

  @override
  _SummaryBottomSheetState createState() => _SummaryBottomSheetState();
}

class _SummaryBottomSheetState extends State<SummaryBottomSheet> {
  late SharedPreferences _prefs;
  bool _isSimplifiedView = false;
  @override
  void initState() {
    _loadPreferences();
    super.initState();
  }

  Future<void> _loadPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _isSimplifiedView = _prefs.getBool('isSimplifiedView') ?? false;
    });
  }

  Future<void> _savePreferences() async {
    await _prefs.setBool('isSimplifiedView', _isSimplifiedView);
  }

  List<BeverageType> _getSelectedBeverageTypes() {
    return widget.beverageTypes.where((type) {
      return type.beverages.any((bev) {
        return widget.selectedBeverages
            .any((selected) => selected.id == bev.id);
      });
    }).toList();
  }

  int _getTotalSelectedItemsForType(BeverageType type) {
    return widget.selectedBeverages.where((selected) {
      return type.beverages.any((bev) => bev.id == selected.id);
    }).fold(0, (sum, item) => sum + item.count);
  }

  @override
  Widget build(BuildContext context) {
    final selectedBeverageTypes = _getSelectedBeverageTypes();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Txt(
                  'Summary',
                  style: TxtStyle.headerSSemiBold,
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                          _isSimplifiedView ? Icons.list : Icons.grid_view),
                      onPressed: () {
                        setState(() {
                          _isSimplifiedView = !_isSimplifiedView;
                        });
                        _savePreferences();
                      },
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(),
          if (_isSimplifiedView)
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.selectedBeverages.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final selectedItem = widget.selectedBeverages[index];
                final beverageItem = widget.beverageTypes
                    .expand((type) => type.beverages)
                    .firstWhere((bev) => bev.id == selectedItem.id);

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            beverageItem.imagePath,
                            width: 50,
                            height: 50,
                          ),
                          const SizedBox(width: 10),
                          Txt(
                            beverageItem.name,
                            style: TxtStyle.bodyLBold,
                          ),
                          const SizedBox(width: 10),
                          if (beverageItem.label != null)
                            Txt(
                              beverageItem.label ?? "-",
                              style: TxtStyle.bodyLBold,
                            ),
                        ],
                      ),
                      Txt(
                        "x ${selectedItem.count.toString()}",
                        style: TxtStyle.bodyLBold,
                      ),
                    ],
                  ),
                );
              },
            )
          else
            ...selectedBeverageTypes.map((type) {
              final selectedItems = widget.selectedBeverages.where((selected) {
                return type.beverages.any((bev) => bev.id == selected.id);
              }).toList();

              final totalSelectedItems = selectedItems.fold<int>(
                0,
                (previousValue, selectedItem) =>
                    previousValue + selectedItem.count,
              );

              return CustomExpandableCard(
                key: ValueKey(type.type),
                title: type.displayName,
                itemCount: _getTotalSelectedItemsForType(type),
                children: selectedItems.map((selectedItem) {
                  final beverageItem = type.beverages
                      .firstWhere((bev) => bev.id == selectedItem.id);

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              beverageItem.imagePath,
                              width: 50,
                              height: 50,
                            ),
                            const SizedBox(width: 10),
                            Txt(
                              beverageItem.name,
                              style: TxtStyle.bodyLBold,
                            ),
                            const SizedBox(width: 10),
                            if (beverageItem.label != null)
                              Txt(
                                beverageItem.label ?? "-",
                                style: TxtStyle.bodyLBold,
                              ),
                          ],
                        ),
                        Txt(
                          "x ${selectedItem.count.toString()}",
                          style: TxtStyle.bodyLBold,
                        ),
                      ],
                    ),
                  );
                }).toList(),
              );
            }),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Txt(
                  "Total Number of Items:",
                  style: TxtStyle.bodyLBold,
                  color: AppColors.black.withOpacity(0.5),
                ),
                Txt(
                  widget.selectedBeverages
                      .fold<int>(
                        0,
                        (previousValue, item) => previousValue + item.count,
                      )
                      .toString(),
                  style: TxtStyle.bodyLBold,
                  color: AppColors.black.withOpacity(0.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
