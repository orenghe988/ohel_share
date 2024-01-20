import 'package:flutter/material.dart';
import "package:flutter_localizations/flutter_localizations.dart";
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
      title: 'Ohel-Share',
      theme: ThemeData(
        // TODO disable ugly android click sound for the entire app
        // TODO make color change when click instant
        fontFamily: "IBM Plex Sans Hebrew",
        splashFactory: NoSplash.splashFactory,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('he', 'IL'),
      ],
      routerConfig: routerConfig,
    );
  }
}
