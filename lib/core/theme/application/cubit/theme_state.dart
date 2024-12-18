import 'package:teatally/core/theme/presentation/app_theme.dart';

class ThemeState {
  final AppThemeType themeType;
  final bool isDarkMode;
  final bool isUpdating;

  ThemeState({
    required this.themeType,
    required this.isDarkMode,
    required this.isUpdating,
  });
}
