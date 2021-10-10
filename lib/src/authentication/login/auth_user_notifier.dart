import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
  AuthUserNotifier() : super(const AuthUserState.initial());

  bool signedIn = false;

  Future<void> checkAndUpdateAuthStatus() async {
    Future.delayed(
      const Duration(seconds: 0),
      () => state = signedIn
          ? const AuthUserState.authenticated()
          : const AuthUserState.unauthenticated(),
    );
  }

  Future<void> signIn() async {
    signedIn = true;
    state = const AuthUserState.authenticated();
  }
}
