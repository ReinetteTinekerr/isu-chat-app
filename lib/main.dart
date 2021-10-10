import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'src/app.dart';

const darkModeBox = 'darkMode';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(darkModeBox);

  runApp(const ProviderScope(child: InitializeMyApp()));
}
