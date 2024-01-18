import "package:supabase_flutter/supabase_flutter.dart";
import "package:flutter_dotenv/flutter_dotenv.dart";

Future<void> initializeSupabaseClient() async {
  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
    url: dotenv.env["SUPABASE_URL"]!,
    anonKey: dotenv.env["SUPABASE_ANON_KEY"]!,
  );
}

SupabaseClient supabaseClient() {
  return Supabase.instance.client;
}