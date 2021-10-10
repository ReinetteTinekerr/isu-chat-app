import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class MenuItem {
  const MenuItem(this.title, this.icon, this.route);
  final String title;
  final IconData icon;
  final String route;
}
