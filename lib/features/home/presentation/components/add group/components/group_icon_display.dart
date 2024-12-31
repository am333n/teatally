import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:teatally/core/theme/presentation/app_theme.dart';
import 'package:teatally/features/home/presentation/components/add%20group/components/color_mapper.dart';
import 'package:teatally/features/home/presentation/components/add%20group/components/icon_mapper.dart';

class GroupIconDisplay extends StatelessWidget {
  const GroupIconDisplay({
    super.key,
    required this.iconCode,
  });
  final String? iconCode;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Theme.of(context).appColors.formBackground,
          border: Border.all(
            color: Theme.of(context).appColors.formBorder,
          ),
          borderRadius: BorderRadius.circular(15)),
      height: 49,
      width: 49,
      child: Image.asset(IconMapper.getPathFromCode(iconCode)),
    );
  }
}
