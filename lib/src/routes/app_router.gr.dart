// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

import '../authentication/login/auth_page.dart' as _i7;
import '../authentication/profile/profile_page.dart' as _i8;
import '../core/pages/main_page.dart' as _i2;
import '../core/side_drawer/grades/grades_page.dart' as _i4;
import '../core/side_drawer/notes/notes_page.dart' as _i5;
import '../core/side_drawer/schedule/schedule_page.dart' as _i3;
import '../core/side_drawer/settings/settings_page.dart' as _i6;
import '../splash_page.dart' as _i1;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    MainRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.MainPage());
    },
    ScheduleRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SchedulePage());
    },
    GradesRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.GradesPage());
    },
    NotesRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.NotesPage());
    },
    SettingsRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.SettingsPage());
    },
    AuthRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.AuthPage());
    },
    ProfileRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.ProfilePage());
    }
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(SplashRoute.name, path: '/'),
        _i9.RouteConfig(MainRoute.name, path: '/'),
        _i9.RouteConfig(ScheduleRoute.name, path: '/schedule'),
        _i9.RouteConfig(GradesRoute.name, path: '/grades'),
        _i9.RouteConfig(NotesRoute.name, path: '/notes'),
        _i9.RouteConfig(SettingsRoute.name, path: '/settings'),
        _i9.RouteConfig(AuthRoute.name, path: '/login'),
        _i9.RouteConfig(ProfileRoute.name, path: '/profile')
      ];
}

/// generated route for [_i1.SplashPage]
class SplashRoute extends _i9.PageRouteInfo<void> {
  const SplashRoute() : super(name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for [_i2.MainPage]
class MainRoute extends _i9.PageRouteInfo<void> {
  const MainRoute() : super(name, path: '/');

  static const String name = 'MainRoute';
}

/// generated route for [_i3.SchedulePage]
class ScheduleRoute extends _i9.PageRouteInfo<void> {
  const ScheduleRoute() : super(name, path: '/schedule');

  static const String name = 'ScheduleRoute';
}

/// generated route for [_i4.GradesPage]
class GradesRoute extends _i9.PageRouteInfo<void> {
  const GradesRoute() : super(name, path: '/grades');

  static const String name = 'GradesRoute';
}

/// generated route for [_i5.NotesPage]
class NotesRoute extends _i9.PageRouteInfo<void> {
  const NotesRoute() : super(name, path: '/notes');

  static const String name = 'NotesRoute';
}

/// generated route for [_i6.SettingsPage]
class SettingsRoute extends _i9.PageRouteInfo<void> {
  const SettingsRoute() : super(name, path: '/settings');

  static const String name = 'SettingsRoute';
}

/// generated route for [_i7.AuthPage]
class AuthRoute extends _i9.PageRouteInfo<void> {
  const AuthRoute() : super(name, path: '/login');

  static const String name = 'AuthRoute';
}

/// generated route for [_i8.ProfilePage]
class ProfileRoute extends _i9.PageRouteInfo<void> {
  const ProfileRoute() : super(name, path: '/profile');

  static const String name = 'ProfileRoute';
}
