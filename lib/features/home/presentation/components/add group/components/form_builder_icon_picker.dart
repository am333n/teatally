import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:teatally/core/theme/presentation/app_theme.dart';
import 'package:teatally/features/home/presentation/components/add%20group/components/icon_mapper.dart';
import 'package:teatally/features/home/presentation/components/add%20group/components/icon_picker.dart';

class FormBuilderIconPicker extends StatelessWidget {
  const FormBuilderIconPicker(
      {super.key, required this.name, required this.onIconSelected});
  final String name;
  final dynamic Function(String) onIconSelected;
  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
        initialValue: IconMapper.defaultIcon,
        builder: (state) {
          return Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
                border:
                    Border.all(color: Theme.of(context).appColors.formBorder)),
            child: IconPickerWidget(onIconSelected: (icon) {
              onIconSelected.call(icon);
              state.didChange(icon);
            }),
          );
        },
        name: name);
  }
}
