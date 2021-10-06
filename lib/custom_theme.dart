import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get light => ThemeData(
        primaryColor: Colors.green[300],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green[300],
          titleTextStyle: const TextStyle(fontSize: 20),
        ),
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color?>(
              Colors.green[300],
            ),
            // fixedSize: MaterialStateProperty.all(const Size(120, 40)),
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedIconTheme: IconThemeData(
            color: Colors.green[300],
          ),
          selectedItemColor: Colors.green[300],
        ),
      );

  static ThemeData get dark => ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color.fromRGBO(32, 35, 42, 1),
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(97, 218, 251, 1),
        ),
        scaffoldBackgroundColor: const Color.fromRGBO(40, 44, 52, 1),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(32, 35, 42, 1),
          titleTextStyle: TextStyle(
            fontSize: 20,
            color: Color.fromRGBO(97, 218, 251, 1),
          ),
        ),
        canvasColor: const Color.fromRGBO(40, 44, 52, 1),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color.fromRGBO(40, 44, 52, 1),
          selectedIconTheme: IconThemeData(
            color: Color.fromRGBO(97, 218, 251, 1),
          ),
          selectedItemColor: Color.fromRGBO(97, 218, 251, 1),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color?>(
              Colors.green[300],
            ),
            fixedSize: MaterialStateProperty.all(const Size(120, 40)),
          ),
        ),
      );
}
