import 'package:flutter/material.dart';
import "utils/supabase_utils.dart";
import "routing/router.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeSupabaseClient();

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
