import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isu_chat_system/custom_theme.dart';
import 'package:isu_chat_system/src/authentication/provider/providers.dart';
import 'package:isu_chat_system/src/routes/app_router.gr.dart';

final initializeSettingsProvider = FutureProvider<void>((ref) async {
  final settings = ref.watch(settingsControllerProvider.notifier);
  await settings.loadSettings();
});

class InitializeMyApp extends ConsumerWidget {
  const InitializeMyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(initializeSettingsProvider);
    return MyApp();
  }
}

class MyApp extends ConsumerWidget {
  MyApp({Key? key}) : super(key: key);

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(settingsControllerProvider);

    ref.watch(authUserNotifierProvider.notifier).addListener((state) {
      state.maybeWhen(
        orElse: () {},
        authenticated: () => appRouter.pushAndPopUntil(
          const MainRoute(),
          predicate: (route) => false,
        ),
        unauthenticated: () {
          appRouter.pushAndPopUntil(
            const AuthRoute(),
            predicate: (route) => false,
          );
        },
        initial: () async {
          ref
              .watch(authUserNotifierProvider.notifier)
              .checkAndUpdateAuthStatus();
        },
      );
    });
    return MaterialApp.router(
      title: 'isu_chat_app',
      restorationScopeId: 'app',
      debugShowCheckedModeBanner: false,
      // Provide the generated AppLocalizations to the MaterialApp. This
      // allows descendant Widgets to display the correct translations
      // depending on the user's locale.
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
      ],

      // Use AppLocalizations to configure the correct application title
      // depending on the user's locale.
      //
      // The appTitle is defined in .arb files found in the localization
      // directory.
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,

      theme: CustomTheme.light,
      darkTheme: CustomTheme.dark,
      themeMode: appTheme,

      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: appRouter.delegate(),
    );
  }
}
