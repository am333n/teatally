import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:teatally/features/home/presentation/components/add%20group/components/color_mapper.dart';
import 'package:teatally/features/home/presentation/components/add%20group/components/color_picker.dart';
import 'package:teatally/features/home/presentation/components/add%20group/components/icon_mapper.dart';

class FormBuilderColorPicker extends StatelessWidget {
  const FormBuilderColorPicker(
      {super.key, required this.name, this.onColorChanged});
  final String name;
  final Function(Color)? onColorChanged;
  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
        initialValue: ColorMapper.defaultColorCode,
        builder: (state) {
          return ColorPickerWidget(onColorSelected: (colorCode, color) {
            state.didChange(colorCode);
            onColorChanged?.call(color);
          });
        },
        name: name);
  }
}
