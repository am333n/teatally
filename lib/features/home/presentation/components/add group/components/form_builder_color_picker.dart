import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:teatally/core/theme/presentation/app_theme.dart';
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
    final size = MediaQuery.sizeOf(context);
    return FormBuilderField(
        initialValue: ColorMapper.defaultColorCode,
        builder: (state) {
          return Stack(
            children: [
              SizedBox(
                height: kToolbarHeight,
                child: ColorPickerWidget(onColorSelected: (colorCode, color) {
                  state.didChange(colorCode);
                  onColorChanged?.call(color);
                }),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: IgnorePointer(
                  child: Container(
                    height: kToolbarHeight,
                    width: size.width * 0.3,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Colors.white.withOpacity(0.0),
                      context.theme.appColors.backgroundPrimary
                    ])),
                  ),
                ),
              )
            ],
          );
        },
        name: name);
  }
}
