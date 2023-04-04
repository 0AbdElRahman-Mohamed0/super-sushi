import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:super_sushi/utils/constants/app_constants.dart';

export 'package:provider/provider.dart';

/// App provider for settings of the app
class AppProvider extends ChangeNotifier {
  bool _darkTheme = false;

  /// Get if dark theme enabled or not
  bool get darkTheme => _darkTheme;

  /// Load the theme in start of the app
  AppProvider() {
    _loadCurrentTheme();
  }

  /// Change app theme
  Future<void> toggleTheme() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    _darkTheme = !_darkTheme;
    await sharedPreferences.setBool(AppConstants.theme, _darkTheme);
    notifyListeners();
  }

  /// Load the app theme
  Future<void> _loadCurrentTheme() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    _darkTheme = sharedPreferences.getBool(AppConstants.theme) ?? false;
    notifyListeners();
  }
}
