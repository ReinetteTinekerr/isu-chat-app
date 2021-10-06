// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

import '../authentication/create_user/create_user_page.dart' as _i8;
import '../home/home_page.dart' as _i2;
import '../home/sample_item_details_page.dart' as _i7;
import '../side_drawer/grades/grades_page.dart' as _i4;
import '../side_drawer/notes/notes_page.dart' as _i5;
import '../side_drawer/schedule/schedule_page.dart' as _i3;
import '../side_drawer/settings/settings_page.dart' as _i6;
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
    HomeRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomePage());
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
    SampleItemDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<SampleItemDetailsRouteArgs>();
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.SampleItemDetailsPage(key: args.key, id: args.id));
    },
    CreateUserRoute.name: (routeData) {
      final args = routeData.argsAs<CreateUserRouteArgs>(
          orElse: () => const CreateUserRouteArgs());
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: _i8.CreateUserPage(key: args.key));
    }
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(SplashRoute.name, path: '/'),
        _i9.RouteConfig(HomeRoute.name, path: '/home'),
        _i9.RouteConfig(ScheduleRoute.name, path: '/schedule'),
        _i9.RouteConfig(GradesRoute.name, path: '/grades'),
        _i9.RouteConfig(NotesRoute.name, path: '/notes'),
        _i9.RouteConfig(SettingsRoute.name, path: '/settings'),
        _i9.RouteConfig(SampleItemDetailsRoute.name, path: '/details'),
        _i9.RouteConfig(CreateUserRoute.name, path: '/signup')
      ];
}

/// generated route for [_i1.SplashPage]
class SplashRoute extends _i9.PageRouteInfo<void> {
  const SplashRoute() : super(name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for [_i2.HomePage]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute() : super(name, path: '/home');

  static const String name = 'HomeRoute';
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

/// generated route for [_i7.SampleItemDetailsPage]
class SampleItemDetailsRoute
    extends _i9.PageRouteInfo<SampleItemDetailsRouteArgs> {
  SampleItemDetailsRoute({_i10.Key? key, required int id})
      : super(name,
            path: '/details',
            args: SampleItemDetailsRouteArgs(key: key, id: id));

  static const String name = 'SampleItemDetailsRoute';
}

class SampleItemDetailsRouteArgs {
  const SampleItemDetailsRouteArgs({this.key, required this.id});

  final _i10.Key? key;

  final int id;
}

/// generated route for [_i8.CreateUserPage]
class CreateUserRoute extends _i9.PageRouteInfo<CreateUserRouteArgs> {
  CreateUserRoute({_i10.Key? key})
      : super(name, path: '/signup', args: CreateUserRouteArgs(key: key));

  static const String name = 'CreateUserRoute';
}

class CreateUserRouteArgs {
  const CreateUserRouteArgs({this.key});

  final _i10.Key? key;
}
