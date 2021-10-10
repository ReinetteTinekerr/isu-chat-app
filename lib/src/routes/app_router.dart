import 'package:auto_route/annotations.dart';
import 'package:isu_chat_system/src/authentication/login/auth_page.dart';
import 'package:isu_chat_system/src/authentication/profile/profile_page.dart';
import 'package:isu_chat_system/src/core/pages/main_page.dart';
import 'package:isu_chat_system/src/core/side_drawer/grades/grades_page.dart';
import 'package:isu_chat_system/src/core/side_drawer/notes/notes_page.dart';
import 'package:isu_chat_system/src/core/side_drawer/schedule/schedule_page.dart';
import 'package:isu_chat_system/src/core/side_drawer/settings/settings_page.dart';
import 'package:isu_chat_system/src/splash_page.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: MainPage, path: '/'),
    MaterialRoute(page: SchedulePage, path: '/schedule'),
    MaterialRoute(page: GradesPage, path: '/grades'),
    MaterialRoute(page: NotesPage, path: '/notes'),
    MaterialRoute(page: SettingsPage, path: '/settings'),
    MaterialRoute(page: AuthPage, path: '/login'),
    MaterialRoute(page: ProfilePage, path: '/profile'),
  ],
  replaceInRouteName: 'Page,Route',
)
class $AppRouter {}
