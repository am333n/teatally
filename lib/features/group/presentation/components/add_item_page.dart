import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:teatally/core/styles/text/txt.dart';
import 'package:teatally/core/widgets/common_widgets.dart';
import 'package:teatally/core/widgets/form_components.dart';
import 'package:teatally/features/group/application/cubit/group_detail_cubit.dart';
import 'package:teatally/features/group/domain/categories_model.dart';
import 'package:teatally/features/group/domain/item_model.dart';
import 'package:teatally/features/home/domain/group_model.dart';
import 'package:teatally/features/home/presentation/components/add%20group/components/form_builder_color_picker.dart';
import 'package:uuid/uuid.dart';

@RoutePage()
class AddItemPage extends StatelessWidget {
  AddItemPage(
      {super.key, required this.categoryDetail, required this.groupDetails});
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final CategoriesModel? categoryDetail;
  final GroupModel? groupDetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: FormBuilder(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    children: [
                      CommonWidgets.backButton(context),
                      const Txt(
                        'Add Items',
                        style: TxtStyle.headerSSemiBold,
                      )
                    ],
                  ),
                  FormComponents.formBuilderTextField(context,
                      fieldName: 'name',
                      label: 'Item Name',
                      hintText: 'Enter Item Name Eg: Hotdog '),
                  FormComponents.formBuilderTextField(context,
                      fieldName: 'price',
                      label: 'Price',
                      hintText: 'Enter Price Eg: 40.0',
                      textInputType: TextInputType.number),
                  FormComponents.formBuilderTextField(
                    context,
                    fieldName: 'tags',
                    label: 'Tags',
                    hintText: 'Enter Tags Seperated By Comma  Eg: Spicy, Sweet',
                  ),
                  const VerticalSpacing(15),
                  const FormBuilderColorPicker(name: 'color'),
                  const VerticalSpacing(15),
                  CommonWidgets.coloredTextButton(context, text: 'Save',
                      onPressed: () {
                    final formState = _formKey.currentState;
                    if (formState?.validate() ?? false) {
                      final List<String> tags = formState?.fields['tags']?.value
                              ?.toString()
                              .split(',')
                              .map((tag) => tag.trim())
                              .where((tag) => tag.isNotEmpty)
                              .toList() ??
                          [];
                      final itemDetails = ItemModel(
                          uid: const Uuid().v4(),
                          name: formState?.fields['name']?.value ?? '',
                          createdAt: DateTime.now(),
                          groupId: groupDetails?.uid,
                          categoryId: categoryDetail?.uid,
                          tags: tags,
                          price: double.tryParse(
                                  formState?.fields['price']?.value) ??
                              0,
                          color: formState?.fields['color']?.value,
                          updatedAt: DateTime.now());
                      context
                          .read<GroupDetailCubit>()
                          .addItemForCategory(groupDetails?.uid, itemDetails);
                    }
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
