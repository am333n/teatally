import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:teatally/features/home/presentation/components/add%20group/components/color_mapper.dart';
import 'package:teatally/features/home/presentation/components/add%20group/components/icon_mapper.dart';

class GroupIconDisplay extends StatefulWidget {
  const GroupIconDisplay(
      {super.key,
      required this.formKey,
      required this.colorFieldName,
      required this.iconFieldName});
  final GlobalKey<FormBuilderState> formKey;
  final String colorFieldName;
  final String iconFieldName;
  @override
  State<GroupIconDisplay> createState() => _GroupIconDisplayState();
}

class _GroupIconDisplayState extends State<GroupIconDisplay> {
  Color backgroundColor = ColorMapper.defaultColor;
  String icon = IconMapper.defaultIcon;
  @override
  void didChangeDependencies() {
    backgroundColor = ColorMapper.hexToColor(
        widget.formKey.currentState?.fields[widget.colorFieldName]?.value ??
            ColorMapper.defaultColorCode);
    icon = widget.formKey.currentState?.fields[widget.iconFieldName]?.value ??
        IconMapper.defaultIcon;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: backgroundColor,
      child: Image.asset(IconMapper.getPathFromCode(icon)),
    );
  }
}
