import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'create_user_notifier.freezed.dart';

@freezed
class CreateUserState with _$CreateUserState {
  const CreateUserState._();
  const factory CreateUserState.initial() = _Initial;
  const factory CreateUserState.authenticated() = _Authenticated;
  const factory CreateUserState.unauthenticated() = _UnAuthenticated;
  const factory CreateUserState.failure() = _Failure;
}

class CreateUserNotifier extends StateNotifier<CreateUserState> {
  CreateUserNotifier() : super(const CreateUserState.initial());

  bool signedIn = false;

  Future<void> checkAndUpdateAuthStatus() async {
    Future.delayed(
      const Duration(seconds: 1),
      () => state = signedIn
          ? const CreateUserState.authenticated()
          : const CreateUserState.unauthenticated(),
    );
  }

  Future<void> signIn() async {
    signedIn = true;
    state = const CreateUserState.authenticated();
  }
}
