import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:isu_chat_system/main.dart';

class SettingsService {
  /// Loads the User's preferred ThemeMode from local or remote storage.
  Future<ThemeMode> themeMode() async {
    bool isDark = Hive.box(darkModeBox).get('darkMode', defaultValue: false);
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }

  /// Persists the user's preferred ThemeMode to local or remote storage.
  Future<void> updateThemeMode(bool isDark) async {
    Hive.box(darkModeBox).put('darkMode', isDark);
    // Use the shared_preferences package to persist settings locally or the
    // http package to persist settings over the network.
  }
}
