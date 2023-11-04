import 'package:flutter/material.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import "package:supabase_flutter/supabase_flutter.dart";
import "package:flutter_dotenv/flutter_dotenv.dart";
import 'routing/authState.dart';
import "routing/router.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
    url: dotenv.env["SUPABASE_URL"]!,
    anonKey: dotenv.env["SUPABASE_ANON_KEY"]!,
  );

  runApp(const OhelShareApplication());
}

class OhelShareApplication extends StatelessWidget {
  const OhelShareApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'Ohel Share',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        routerConfig: routerConfig,
    );

  }
}
