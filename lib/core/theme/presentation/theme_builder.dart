import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:teatally/core/theme/application/cubit/theme_cubit.dart';
import 'package:teatally/core/theme/presentation/app_theme.dart';

typedef ThemeWidgetBuilder = Widget Function(BuildContext context);

class ThemeBuilder extends StatelessWidget {
  final ThemeWidgetBuilder defaultTheme;
  final ThemeWidgetBuilder? greenTheme;
  final ThemeWidgetBuilder? blueTheme;
  final ThemeWidgetBuilder? purpleTheme;

  const ThemeBuilder({
    super.key,
    required this.defaultTheme,
    this.greenTheme,
    this.blueTheme,
    this.purpleTheme,
  });

  @override
  Widget build(BuildContext context) {
    final themeCubit = GetIt.I<ThemeCubit>();
    final currentTheme = themeCubit.state.themeType;

    // Select the appropriate theme builder or fall back to default
    final ThemeWidgetBuilder themeBuilder;
    switch (currentTheme) {
      case AppThemeType.defaultTheme:
      default:
        themeBuilder = defaultTheme;
        break;
    }

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500), // Adjust duration as desired
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOut,
      child: Builder(
        key: ValueKey(currentTheme),
        builder: (context) => themeBuilder(context),
      ),
    );
  }
}
