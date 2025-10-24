import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:teatally/core/styles/text/txt.dart';
import 'package:teatally/core/widgets/common_widgets.dart';
import 'package:teatally/core/widgets/form_components.dart';
import 'package:teatally/features/group/application/cubit/group_detail_cubit.dart';
import 'package:teatally/features/group/domain/categories_model.dart';
import 'package:uuid/uuid.dart';

class AddCategoryDialog extends StatelessWidget {
  AddCategoryDialog({
    super.key,
    required this.groupId,
    this.isEdit = false,
    this.categoriesDetail,
  });
  final String groupId;
  final bool isEdit;
  final CategoriesModel? categoriesDetail;
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Txt(
        '${isEdit ? 'Edit' : 'Add'} Category',
        style: TxtStyle.headerSSemiBold,
      ),
      content: FormBuilder(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FormComponents.formBuilderTextField(context,
                fieldName: 'name',
                label: 'Category Name',
                hintText: 'Enter Categories Name',
                initialValue: categoriesDetail?.name,
                isRequired: true),
            VerticalSpacing(15),
            CommonWidgets.coloredTextButton(context,
                text: isEdit ? 'Update' : 'Save', onPressed: () {
              final formState = _formKey.currentState;
              if (formState?.validate() ?? false) {
                if (isEdit) {
                  final updatedCategyDetails = categoriesDetail?.copyWith(
                    name: formState?.fields['name']?.value ?? '',
                  );
                  context
                      .read<GroupDetailCubit>()
                      .updateCategory(updatedCategyDetails);
                } else {
                  final categoryDetail = CategoriesModel(
                      uid: const Uuid().v4(),
                      name: formState?.fields['name']?.value ?? '',
                      groupId: groupId,
                      createdAt: DateTime.now());
                  context
                      .read<GroupDetailCubit>()
                      .addCategory(groupId, categoryDetail);
                  Navigator.of(context).pop();
                }
              }
            })
          ],
        ),
      ),
    );
  }
}
