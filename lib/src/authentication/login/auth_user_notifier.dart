import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isu_chat_system/src/constants.dart';
import 'package:supabase/supabase.dart';

part 'auth_user_notifier.freezed.dart';

@freezed
class AuthUserState with _$AuthUserState {
  const AuthUserState._();
  const factory AuthUserState.initial() = _Initial;
  const factory AuthUserState.authenticated() = _Authenticated;
  const factory AuthUserState.unauthenticated() = _UnAuthenticated;
  const factory AuthUserState.failure() = _Failure;
}

class AuthUserNotifier extends StateNotifier<AuthUserState> {
  AuthUserNotifier(this.supabase) : super(const AuthUserState.initial());
  final SupabaseClient supabase;
  bool get isSignedIn => supabase.auth.currentUser != null;

  Future<void> checkAndUpdateAuthStatus() async {
    state = isSignedIn
        ? const AuthUserState.authenticated()
        : const AuthUserState.unauthenticated();
  }

  Future<void> signIn(BuildContext context, TextEditingController email) async {
    final response = await supabase.auth.signUp(
      email.text,
      'test123',
      options: AuthOptions(
        redirectTo:
            kIsWeb ? null : 'io.supabase.flutterquickstart://login-callback/',
      ),
    );
    final error = response.error;
    if (error != null) {
      context.showErrorSnackBar(message: error.message);
    } else {
      context.showSnackBar(message: 'Check your email for login link!');
      email.clear();
    }
  }
}
