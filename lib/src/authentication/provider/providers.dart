import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isu_chat_system/src/authentication/login/auth_user_notifier.dart';
import 'package:isu_chat_system/src/core/side_drawer/settings/settings_controller.dart';
import 'package:isu_chat_system/src/core/side_drawer/settings/settings_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// final supabaseClientProvider = Provider((ref) => Supabase.instance.client);
final supabase = Supabase.instance.client;

final authUserNotifierProvider =
    StateNotifierProvider<AuthUserNotifier, AuthUserState>(
  (ref) => AuthUserNotifier(supabase),
);

// final settingsServiceProvider = Provider((ref) => SettingsService());

final settingsControllerProvider =
    StateNotifierProvider<SettingsControllerState, ThemeMode>(
  (ref) => SettingsControllerState(SettingsService()),
);
