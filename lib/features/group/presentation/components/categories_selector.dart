import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teatally/core/styles/text/txt.dart';
import 'package:teatally/core/widgets/common_widgets.dart';
import 'package:teatally/core/widgets/form_components.dart';
import 'package:teatally/features/group/application/cubit/group_detail_cubit.dart';
import 'package:teatally/features/group/domain/group_details_state_model.dart';
import 'package:teatally/features/group/presentation/components/add_catgeory_dialog.dart';

class CategoriesSelector extends StatefulWidget {
  const CategoriesSelector(
      {super.key, required this.loadedStateData, required this.groupId});
  final GroupDetailsLoadedStateModel loadedStateData;
  final String groupId;

  @override
  State<CategoriesSelector> createState() => _CategoriesSelectorState();
}

class _CategoriesSelectorState extends State<CategoriesSelector> {
  String? _selectedCategoryId =
      null; // Ensure _selectedCategoryId is initially null

  void handleCategoriesAdd() {
    showDialog(
        context: context,
        builder: (context) {
          return AddCategoryDialog(groupId: widget.groupId);
        });
  }

  @override
  Widget build(BuildContext context) {
    final categories = widget.loadedStateData.categories;

    // Display button if no categories exist
    if (categories?.isEmpty ?? true) {
      return CommonWidgets.coloredTextButton(context,
          text: 'Add Categories', onPressed: handleCategoriesAdd);
    } else {
      return SizedBox(
        height: kToolbarHeight,
        child: ListView.builder(
          itemCount:
              (categories?.length ?? 0) + 1, // Add +1 for the "Add" button
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            if (index == categories?.length) {
              // "Add" button at the end of the list
              return CommonWidgets.iconButton(
                onPressed: handleCategoriesAdd,
                icon: const Icon(Icons.add),
              );
            } else {
              final categoryItem = categories?[index];
              return ChoiceChip(
                onSelected: (value) {
                  setState(() {
                    if (_selectedCategoryId != categoryItem?.uid) {
                      _selectedCategoryId = categoryItem?.uid;
                    } else {
                      _selectedCategoryId = null;
                    }
                  });
                  context
                      .read<GroupDetailCubit>()
                      .setSelectedCategory(_selectedCategoryId);
                },
                label: Txt(categoryItem?.name ?? '-'),
                selected: _selectedCategoryId == categoryItem?.uid,
              );
            }
          },
        ),
      );
    }
  }
}
