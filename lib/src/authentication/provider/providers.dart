import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isu_chat_system/src/authentication/create_user/create_user_notifier.dart';
import 'package:isu_chat_system/src/side_drawer/settings/settings_controller.dart';
import 'package:isu_chat_system/src/side_drawer/settings/settings_service.dart';

final createUserNotifierProvider =
    StateNotifierProvider<CreateUserNotifier, CreateUserState>(
  (ref) => CreateUserNotifier(),
);

// final settingsServiceProvider = Provider((ref) => SettingsService());

final settingsControllerProvider =
    StateNotifierProvider<SettingsControllerState, ThemeMode>(
  (ref) => SettingsControllerState(SettingsService()),
);
