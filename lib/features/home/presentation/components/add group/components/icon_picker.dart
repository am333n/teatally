import 'package:flutter/material.dart';
import 'package:teatally/core/theme/presentation/app_theme.dart';
import 'package:teatally/features/home/presentation/components/add%20group/components/icon_mapper.dart';

class IconPickerWidget extends StatefulWidget {
  final Function(String) onIconSelected;

  const IconPickerWidget({Key? key, required this.onIconSelected})
      : super(key: key);

  @override
  _IconPickerWidgetState createState() => _IconPickerWidgetState();
}

class _IconPickerWidgetState extends State<IconPickerWidget> {
  final List<String> _icon = IconMapper.getAllPaths();
  String? _selectedIcon;
  @override
  void initState() {
    _selectedIcon = IconMapper.defaultIconPath;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: _icon.map((icon) {
          final isSelected = _selectedIcon == icon;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIcon = icon;
              });
              widget.onIconSelected(IconMapper.getCodeFromPath(icon));
            },
            child: Container(
              width: 40,
              height: 40,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? context.theme.appColors.fontPrimary
                    : context.theme.appColors.backgroundPrimary,
                // border: isSelected
                //     ? Border.all(color: Colors.black, width: 2.0)
                //     : null,
              ),
              child: Image.asset(
                icon,
                color: isSelected
                    ? context.theme.appColors.backgroundPrimary
                    : context.theme.appColors.fontPrimary,
                cacheHeight: 40,
                cacheWidth: 40,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
