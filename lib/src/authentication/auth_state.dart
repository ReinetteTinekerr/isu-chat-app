import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:isu_chat_system/src/constants.dart';
import 'package:isu_chat_system/src/routes/app_router.gr.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthState<T extends StatefulWidget> extends SupabaseAuthState<T> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (Supabase.instance.client.auth.currentSession == null) {
        // super.recoverSupabaseSession();
      } else {
        onAuthenticated(Supabase.instance.client.auth.currentSession!);
      }
    });
  }

  @override
  void onUnauthenticated() {
    if (mounted) {
      // Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
      AutoRouter.of(context).pushAndPopUntil(
        const AuthRoute(),
        predicate: (route) => false,
      );
    }
  }

  @override
  void onAuthenticated(Session session) {
    if (mounted) {
      // Navigator.of(context)
      //     .pushNamedAndRemoveUntil('/account', (route) => false);
      AutoRouter.of(context).pushAndPopUntil(
        const MainRoute(),
        predicate: (route) => false,
      );
    }
  }

  // @override
  // void onReceivedAuthDeeplink(Uri uri) {
  //   Supabase.instance.log('onReceivedAuthDeeplink uri: $uri');
  // }

  @override
  void onPasswordRecovery(Session session) {}

  @override
  void onErrorAuthenticating(String message) {
    context.showErrorSnackBar(message: message);
  }
}
