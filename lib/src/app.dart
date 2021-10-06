import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isu_chat_system/custom_theme.dart';
import 'package:isu_chat_system/src/authentication/provider/providers.dart';
import 'package:isu_chat_system/src/routes/app_router.gr.dart';

final initializeSettings = FutureProvider<void>((ref) async {
  final settings = ref.read(settingsControllerProvider.notifier);
  await settings.loadSettings();
});

class MyApp extends ConsumerWidget {
  MyApp({
    Key? key,
  }) : super(key: key);

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    watch(initializeSettings);
    final appTheme = watch(settingsControllerProvider);

    watch(createUserNotifierProvider.notifier).addListener((state) {
      state.maybeMap(
        orElse: () {},
        authenticated: (_) => appRouter.pushAndPopUntil(
          const HomeRoute(),
          predicate: (route) => false,
        ),
        unauthenticated: (_) => appRouter.pushAndPopUntil(
          CreateUserRoute(),
          predicate: (route) => false,
        ),
        initial: (_) => context
            .read(createUserNotifierProvider.notifier)
            .checkAndUpdateAuthStatus(),
      );
    });

    return MaterialApp.router(
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
