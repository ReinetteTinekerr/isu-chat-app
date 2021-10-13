import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:isu_chat_system/src/authentication/login/auth_page.dart';
import 'package:isu_chat_system/src/authentication/profile/profile_page.dart';
import 'package:isu_chat_system/src/core/pages/chats/chats_page.dart';
import 'package:isu_chat_system/src/core/pages/courses/courses_page.dart';
import 'package:isu_chat_system/src/core/pages/departments/departments_page.dart';
import 'package:isu_chat_system/src/core/pages/global/global_page.dart';
import 'package:isu_chat_system/src/core/pages/home/home_page.dart';
import 'package:isu_chat_system/src/core/pages/main_page.dart';
import 'package:isu_chat_system/src/core/side_drawer/grades/grades_page.dart';
import 'package:isu_chat_system/src/core/side_drawer/notes/notes_page.dart';
import 'package:isu_chat_system/src/core/side_drawer/schedule/schedule_page.dart';
import 'package:isu_chat_system/src/core/side_drawer/settings/settings_page.dart';
import 'package:isu_chat_system/src/splash_page.dart';

@MaterialAutoRouter(
  routes: [
    AutoRoute(page: SplashPage, initial: true),
    CustomRoute(
      path: '/',
      name: 'MainRoute',
      page: MainPage,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      children: [
        AutoRoute(page: HomePage, path: 'home'),
        AutoRoute(page: ChatsPage, path: 'chats'),
        AutoRoute(page: DepartmentsPage, path: 'departments'),
        AutoRoute(page: CoursesPage, path: 'courses'),
        AutoRoute(page: GlobalPage, path: 'global'),
      ],
    ),
    AutoRoute(page: SchedulePage, path: '/schedule'),
    AutoRoute(page: GradesPage, path: '/grades'),
    AutoRoute(page: NotesPage, path: '/notes'),
    AutoRoute(page: SettingsPage, path: '/settings'),
    AutoRoute(page: AuthPage, path: '/login'),
    CustomRoute(
      page: ProfilePage,
      path: '/profile',
      transitionsBuilder: TransitionsBuilders.slideTop,
    )
  ],
  replaceInRouteName: 'Page,Route',
)
class $AppRouter {}
