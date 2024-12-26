class IconMapper {
  static const Map<String, String> _iconData = {
    'assets/group_icons/book-alt.png': 'education',
    'assets/group_icons/briefcase.png': 'work',
    'assets/group_icons/bulb.png': 'idea',
    'assets/group_icons/gamepad.png': 'games',
    'assets/group_icons/hamburger-soda.png': 'food',
    'assets/group_icons/heart.png': 'hear',
    'assets/group_icons/home.png': 'home',
    'assets/group_icons/plane-alt.png': 'travel',
    'assets/group_icons/shop.png': 'shop',
    'assets/group_icons/star.png': 'star',
  };

  // Reverse mapping for code to path
  static final Map<String, String> _codeToPath = {
    for (var entry in _iconData.entries) entry.value: entry.key,
  };
  static final defaultIconPath = getPathFromCode(defaultIcon);
  static const defaultIcon = 'home';

  /// Gets the code for a given icon path
  static String getCodeFromPath(String path) {
    return _iconData[path] ?? '';
  }

  /// Gets the path for a given icon code
  static String getPathFromCode(String? code) {
    if (code != null && code.isNotEmpty) {
      return _codeToPath[code] ?? defaultIconPath;
    }
    return defaultIconPath;
  }

  /// Gets all icon paths as a list
  static List<String> getAllPaths() {
    return _iconData.keys.toList();
  }

  /// Gets all icon codes as a list
  static List<String> getAllCodes() {
    return _iconData.values.toList();
  }
}
