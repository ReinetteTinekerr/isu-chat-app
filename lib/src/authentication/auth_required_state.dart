import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:isu_chat_system/src/routes/app_router.gr.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRequiredState<T extends StatefulWidget>
    extends SupabaseAuthRequiredState<T> {
  @override
  void onUnauthenticated() {
    /// Users will be sent back to the LoginPage if they sign out.
    // Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
    AutoRouter.of(context).pushAndPopUntil(
      const AuthRoute(),
      predicate: (route) => false,
    );
  }
}
