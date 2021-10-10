import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isu_chat_system/src/authentication/login/auth_user_notifier.dart';
import 'package:isu_chat_system/src/core/side_drawer/settings/settings_controller.dart';
import 'package:isu_chat_system/src/core/side_drawer/settings/settings_service.dart';

final authUserNotifierProvider =
    StateNotifierProvider<AuthUserNotifier, AuthUserState>(
  (ref) => AuthUserNotifier(),
);

// final settingsServiceProvider = Provider((ref) => SettingsService());

final settingsControllerProvider =
    StateNotifierProvider<SettingsControllerState, ThemeMode>(
  (ref) => SettingsControllerState(SettingsService()),
);
