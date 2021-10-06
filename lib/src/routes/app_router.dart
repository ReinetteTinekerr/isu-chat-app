import 'package:auto_route/annotations.dart';
import 'package:isu_chat_system/src/authentication/create_user/create_user_page.dart';
import 'package:isu_chat_system/src/home/home_page.dart';
import 'package:isu_chat_system/src/home/sample_item_details_page.dart';
import 'package:isu_chat_system/src/side_drawer/grades/grades_page.dart';
import 'package:isu_chat_system/src/side_drawer/notes/notes_page.dart';
import 'package:isu_chat_system/src/side_drawer/schedule/schedule_page.dart';
import 'package:isu_chat_system/src/side_drawer/settings/settings_page.dart';
import 'package:isu_chat_system/src/splash_page.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: HomePage, path: '/home'),
    MaterialRoute(page: SchedulePage, path: '/schedule'),
    MaterialRoute(page: GradesPage, path: '/grades'),
    MaterialRoute(page: NotesPage, path: '/notes'),
    MaterialRoute(page: SettingsPage, path: '/settings'),
    MaterialRoute(page: SampleItemDetailsPage, path: '/details'),
    MaterialRoute(page: CreateUserPage, path: '/signup'),
  ],
  replaceInRouteName: 'Page,Route',
)
class $AppRouter {}
