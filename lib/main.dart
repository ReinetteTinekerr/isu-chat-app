import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'src/app.dart';

const darkModeBox = 'darkMode';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(darkModeBox);

  await Supabase.initialize(
    url: 'https://tojzjiffyfqefezjaflj.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYzMzU2OTk1MiwiZXhwIjoxOTQ5MTQ1OTUyfQ.MA42dgpS7kgBNWwEMZrpweHL87tghK2bBMarWac3kUE',
  );

  runApp(const ProviderScope(child: InitializeMyApp()));
}
