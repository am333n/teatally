import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teatally/core/styles/text/txt.dart';
import 'package:teatally/core/theme/presentation/app_theme.dart';
import 'package:teatally/core/widgets/common_widgets.dart';
import 'package:teatally/features/group/application/cubit/group_detail_cubit.dart';
import 'package:teatally/features/group/application/cubit/group_detail_state.dart';
import 'package:teatally/features/group/domain/categories_model.dart';
import 'package:teatally/features/group/domain/group_details_state_model.dart';
import 'package:teatally/features/group/presentation/components/add_catgeory_dialog.dart';

class CategoriesSelector extends StatelessWidget {
  const CategoriesSelector({super.key, required this.groupId});
  // final GroupDetailsLoadedStateModel loadedStateData;
  final String groupId;

  void handleCategoriesAdd(
      {required BuildContext context,
      bool isEdit = false,
      CategoriesModel? categoriesDetail}) {
    showDialog(
        context: context,
        builder: (context) {
          return AddCategoryDialog(
            groupId: groupId,
            isEdit: isEdit,
            categoriesDetail: categoriesDetail,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // final categories = loadedStateData.categories;
    // final selectedCategoryId = loadedStateData.selectedCategory;
    return SizedBox(
      height: kToolbarHeight,
      child: BlocBuilder<GroupDetailCubit, GroupDetailState>(
        builder: (context, state) {
          return state.categoriesState.when(
            loading: () => ListView.builder(
                itemCount: 5, // Add +1 for the "Add" button
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: ChoiceChip(
                      backgroundColor: context.theme.appColors.formBackground,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      padding: const EdgeInsets.all(5),
                      onSelected: (value) => {},
                      label: SizedBox(
                          height: 25,
                          width: 25,
                          child: const Center(
                              child: const CircularProgressIndicator())),
                      selected: false,
                    ),
                  );
                }),
            loaded: (categories) {
              if (categories?.isEmpty ?? true) {
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: ChoiceChip(
                      backgroundColor: context.theme.appColors.formBackground,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      padding: const EdgeInsets.all(5),
                      label: const Txt('Add Categories +'),
                      selected: false,
                      onSelected: (value) =>
                          handleCategoriesAdd(context: context),
                    ),
                  ),
                );
              } else {
                return SizedBox(
                  height: kToolbarHeight,
                  child: ListView.builder(
                    itemCount: (categories?.length ?? 0) +
                        1, // Add +1 for the "Add" button
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      if (index == categories?.length) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: ChoiceChip(
                            backgroundColor:
                                context.theme.appColors.formBackground,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            padding: const EdgeInsets.all(5),
                            label: const Icon(Icons.add),
                            selected: false,
                            onSelected: (value) =>
                                handleCategoriesAdd(context: context),
                          ),
                        );
                      } else {
                        final categoryItem = categories?[index];
                        final isSelected =
                            state.selectedCategory == categoryItem?.uid;

                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: CupertinoContextMenu(
                            actions: [
                              CupertinoContextMenuAction(
                                child: const Txt('Edit'),
                                onPressed: () {
                                  Navigator.pop(context);
                                  handleCategoriesAdd(
                                      context: context,
                                      isEdit: true,
                                      categoriesDetail: categoryItem);
                                },
                              ),
                              CupertinoContextMenuAction(
                                  child: const Txt('Delete'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    context
                                        .read<GroupDetailCubit>()
                                        .deleteCategory(
                                            categoryItem?.uid,
                                            categoryItem?.docId,
                                            categoryItem?.groupId);
                                  }),
                            ],
                            child: Material(
                              shadowColor: context.theme.appColors.primary,
                              color: Colors.transparent,
                              borderOnForeground: false,
                              child: ChoiceChip(
                                backgroundColor:
                                    context.theme.appColors.formBackground,
                                selectedColor:
                                    context.theme.appColors.fontPrimary,
                                onSelected: (value) {
                                  context
                                      .read<GroupDetailCubit>()
                                      .setSelectedCategory(isSelected
                                          ? null
                                          : categoryItem?.uid);
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                padding: const EdgeInsets.all(10),
                                label: Txt(
                                  categoryItem?.name ?? '-',
                                  color: isSelected
                                      ? context.theme.appColors.formBackground
                                      : context.theme.appColors.fontPrimary,
                                ),
                                selected: isSelected,
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                );
              }
            },
            error: (failure) {
              return Txt(failure.toString());
            },
          );
        },
      ),
    );
    // );
    // Display button if no categories exist
  }
}
