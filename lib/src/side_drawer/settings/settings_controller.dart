import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'settings_service.dart';

class SettingsControllerState extends StateNotifier<ThemeMode> {
  SettingsControllerState(this._settingsService) : super(ThemeMode.system);
  final SettingsService _settingsService;

  ThemeMode get themeMode => state;

  /// Load the user's settings from the SettingsService. It may load from a
  /// local database or the internet. The controller only knows it can load the
  /// settings from the service.
  Future<void> loadSettings() async {
    state = await _settingsService.themeMode();
  }

  bool isUsingDarkTheme() {
    return state == ThemeMode.dark;
  }

  /// Update and persist the ThemeMode based on the user's selection.
  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;

    // Dot not perform any work if new and old ThemeMode are identical
    if (newThemeMode == state) return;

    // Otherwise, store the new theme mode in memory
    state = newThemeMode;

    // Persist the changes to a local database or the internet using the
    // SettingService.
    await _settingsService.updateThemeMode(isUsingDarkTheme());
  }
}
