import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:teatally/features/home/presentation/components/add%20group/components/icon_mapper.dart';
import 'package:teatally/features/home/presentation/components/add%20group/components/icon_picker.dart';

class FormBuilderIconPicker extends StatelessWidget {
  const FormBuilderIconPicker({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
        initialValue: IconMapper.defaultIcon,
        builder: (state) {
          return IconPickerWidget(
              onIconSelected: (icon) => state.didChange(icon));
        },
        name: name);
  }
}
