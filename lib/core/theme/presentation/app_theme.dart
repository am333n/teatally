// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teatally/core/theme/presentation/app_color_extension.dart';
import 'package:teatally/core/theme/presentation/color%20themes/default_theme.dart';

// Project imports:

enum AppThemeType {
  defaultTheme,
}

class AppTheme {
  static final Map<AppThemeType, ThemeData> _lightThemes = {
    AppThemeType.defaultTheme: DefaultTheme.light,
    // AppThemeType.greenTheme: GreenTheme.light,
    // AppThemeType.purpleTheme: PurpleTheme.light,
    // AppThemeType.blueTheme: BlueTheme.light,
  };
  static final Map<AppThemeType, ThemeData> _darkThemes = {
    AppThemeType.defaultTheme: DefaultTheme.dark,
    // AppThemeType.greenTheme: GreenTheme.dark,
    // AppThemeType.purpleTheme: PurpleTheme.dark,
    // AppThemeType.blueTheme: BlueTheme.dark,
  };

  static final Map<AppThemeType, SystemUiOverlayStyle> _systemUiStylesLight = {
    // AppThemeType.purpleTheme: PurpleTheme.getLightSystemUiOverlayStyle(),
    // AppThemeType.greenTheme: GreenTheme.getLightSystemUiOverlayStyle(),
    // AppThemeType.blueTheme: BlueTheme.getLightSystemUiOverlayStyle(),
    AppThemeType.defaultTheme: DefaultTheme.getLightSystemUiOverlayStyle(),
  };
  static final Map<AppThemeType, SystemUiOverlayStyle> _systemUiStylesDark = {
    // AppThemeType.purpleTheme: PurpleTheme.getDarkSystemUiOverlayStyle(),
    // AppThemeType.greenTheme: GreenTheme.getDarkSystemUiOverlayStyle(),
    // AppThemeType.blueTheme: BlueTheme.getDarkSystemUiOverlayStyle(),
    AppThemeType.defaultTheme: DefaultTheme.getDarkSystemUiOverlayStyle(),
  };

  static ThemeData getThemeData(AppThemeType themeType, bool isDarkMode) {
    ThemeData themeData = isDarkMode
        ? _darkThemes[themeType] ?? _darkThemes[AppThemeType.defaultTheme]!
        : _lightThemes[themeType] ?? _lightThemes[AppThemeType.defaultTheme]!;

    SystemUiOverlayStyle systemUiStyle = isDarkMode
        ? _systemUiStylesDark[themeType] ??
            _systemUiStylesDark[AppThemeType.defaultTheme]!
        : _systemUiStylesLight[themeType] ??
            _systemUiStylesLight[AppThemeType.defaultTheme]!;

    SystemChrome.setSystemUIOverlayStyle(systemUiStyle);

    return themeData;
  }
}

extension AppThemeExtension on ThemeData {
  /// Usage example: Theme.of(context).appColors;
  AppColorExtension get appColors {
    final AppColorExtension? currentExtension = extension<AppColorExtension>();

    // Return the found extension or the default one from DefaultTheme
    return currentExtension ??
        DefaultTheme.light.extension<AppColorExtension>()!;
  }
}

extension ThemeGetter on BuildContext {
  // Usage example: `context.theme`
  ThemeData get theme => Theme.of(this);
}
