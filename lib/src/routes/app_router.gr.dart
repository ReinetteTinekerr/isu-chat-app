// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i15;

import '../authentication/login/auth_page.dart' as _i7;
import '../authentication/profile/profile_page.dart' as _i8;
import '../core/pages/chats/chats_page.dart' as _i10;
import '../core/pages/courses/courses_page.dart' as _i12;
import '../core/pages/departments/departments_page.dart' as _i11;
import '../core/pages/global/global_page.dart' as _i13;
import '../core/pages/home/home_page.dart' as _i9;
import '../core/pages/main_page.dart' as _i2;
import '../core/side_drawer/grades/grades_page.dart' as _i4;
import '../core/side_drawer/notes/notes_page.dart' as _i5;
import '../core/side_drawer/schedule/schedule_page.dart' as _i3;
import '../core/side_drawer/settings/settings_page.dart' as _i6;
import '../splash_page.dart' as _i1;

class AppRouter extends _i14.RootStackRouter {
  AppRouter([_i15.GlobalKey<_i15.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    MainRoute.name: (routeData) {
      return _i14.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i2.MainPage(),
          transitionsBuilder: _i14.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    ScheduleRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SchedulePage());
    },
    GradesRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.GradesPage());
    },
    NotesRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.NotesPage());
    },
    SettingsRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.SettingsPage());
    },
    AuthRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.AuthPage());
    },
    ProfileRoute.name: (routeData) {
      return _i14.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i8.ProfilePage(),
          transitionsBuilder: _i14.TransitionsBuilders.slideTop,
          opaque: true,
          barrierDismissible: false);
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: _i9.HomePage(key: args.key));
    },
    ChatsRoute.name: (routeData) {
      final args = routeData.argsAs<ChatsRouteArgs>(
          orElse: () => const ChatsRouteArgs());
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: _i10.ChatsPage(key: args.key));
    },
    DepartmentsRoute.name: (routeData) {
      final args = routeData.argsAs<DepartmentsRouteArgs>(
          orElse: () => const DepartmentsRouteArgs());
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: _i11.DepartmentsPage(key: args.key));
    },
    CoursesRoute.name: (routeData) {
      final args = routeData.argsAs<CoursesRouteArgs>(
          orElse: () => const CoursesRouteArgs());
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: _i12.CoursesPage(key: args.key));
    },
    GlobalRoute.name: (routeData) {
      final args = routeData.argsAs<GlobalRouteArgs>(
          orElse: () => const GlobalRouteArgs());
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: _i13.GlobalPage(key: args.key));
    }
  };

  @override
  List<_i14.RouteConfig> get routes => [
        _i14.RouteConfig(SplashRoute.name, path: '/'),
        _i14.RouteConfig(MainRoute.name, path: '/', children: [
          _i14.RouteConfig(HomeRoute.name, path: 'home'),
          _i14.RouteConfig(ChatsRoute.name, path: 'chats'),
          _i14.RouteConfig(DepartmentsRoute.name, path: 'departments'),
          _i14.RouteConfig(CoursesRoute.name, path: 'courses'),
          _i14.RouteConfig(GlobalRoute.name, path: 'global')
        ]),
        _i14.RouteConfig(ScheduleRoute.name, path: '/schedule'),
        _i14.RouteConfig(GradesRoute.name, path: '/grades'),
        _i14.RouteConfig(NotesRoute.name, path: '/notes'),
        _i14.RouteConfig(SettingsRoute.name, path: '/settings'),
        _i14.RouteConfig(AuthRoute.name, path: '/login'),
        _i14.RouteConfig(ProfileRoute.name, path: '/profile')
      ];
}

/// generated route for [_i1.SplashPage]
class SplashRoute extends _i14.PageRouteInfo<void> {
  const SplashRoute() : super(name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for [_i2.MainPage]
class MainRoute extends _i14.PageRouteInfo<void> {
  const MainRoute({List<_i14.PageRouteInfo>? children})
      : super(name, path: '/', initialChildren: children);

  static const String name = 'MainRoute';
}

/// generated route for [_i3.SchedulePage]
class ScheduleRoute extends _i14.PageRouteInfo<void> {
  const ScheduleRoute() : super(name, path: '/schedule');

  static const String name = 'ScheduleRoute';
}

/// generated route for [_i4.GradesPage]
class GradesRoute extends _i14.PageRouteInfo<void> {
  const GradesRoute() : super(name, path: '/grades');

  static const String name = 'GradesRoute';
}

/// generated route for [_i5.NotesPage]
class NotesRoute extends _i14.PageRouteInfo<void> {
  const NotesRoute() : super(name, path: '/notes');

  static const String name = 'NotesRoute';
}

/// generated route for [_i6.SettingsPage]
class SettingsRoute extends _i14.PageRouteInfo<void> {
  const SettingsRoute() : super(name, path: '/settings');

  static const String name = 'SettingsRoute';
}

/// generated route for [_i7.AuthPage]
class AuthRoute extends _i14.PageRouteInfo<void> {
  const AuthRoute() : super(name, path: '/login');

  static const String name = 'AuthRoute';
}

/// generated route for [_i8.ProfilePage]
class ProfileRoute extends _i14.PageRouteInfo<void> {
  const ProfileRoute() : super(name, path: '/profile');

  static const String name = 'ProfileRoute';
}

/// generated route for [_i9.HomePage]
class HomeRoute extends _i14.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i15.Key? key})
      : super(name, path: 'home', args: HomeRouteArgs(key: key));

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i15.Key? key;
}

/// generated route for [_i10.ChatsPage]
class ChatsRoute extends _i14.PageRouteInfo<ChatsRouteArgs> {
  ChatsRoute({_i15.Key? key})
      : super(name, path: 'chats', args: ChatsRouteArgs(key: key));

  static const String name = 'ChatsRoute';
}

class ChatsRouteArgs {
  const ChatsRouteArgs({this.key});

  final _i15.Key? key;
}

/// generated route for [_i11.DepartmentsPage]
class DepartmentsRoute extends _i14.PageRouteInfo<DepartmentsRouteArgs> {
  DepartmentsRoute({_i15.Key? key})
      : super(name, path: 'departments', args: DepartmentsRouteArgs(key: key));

  static const String name = 'DepartmentsRoute';
}

class DepartmentsRouteArgs {
  const DepartmentsRouteArgs({this.key});

  final _i15.Key? key;
}

/// generated route for [_i12.CoursesPage]
class CoursesRoute extends _i14.PageRouteInfo<CoursesRouteArgs> {
  CoursesRoute({_i15.Key? key})
      : super(name, path: 'courses', args: CoursesRouteArgs(key: key));

  static const String name = 'CoursesRoute';
}

class CoursesRouteArgs {
  const CoursesRouteArgs({this.key});

  final _i15.Key? key;
}

/// generated route for [_i13.GlobalPage]
class GlobalRoute extends _i14.PageRouteInfo<GlobalRouteArgs> {
  GlobalRoute({_i15.Key? key})
      : super(name, path: 'global', args: GlobalRouteArgs(key: key));

  static const String name = 'GlobalRoute';
}

class GlobalRouteArgs {
  const GlobalRouteArgs({this.key});

  final _i15.Key? key;
}
