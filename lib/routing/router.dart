import "package:flutter/cupertino.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";
import "package:supabase_flutter/supabase_flutter.dart";
import "routes/onboarding/phoneNumberEntryPage.dart";
import "../states/authState.dart";
import "../utils/supabase_utils.dart";
import 'routes/home.dart' show MyHomePage;

final routes = [
  GoRoute(
    path: "/",
    redirect: (_, __) => supabaseClient().auth.currentUser == null
        ? "/login/enter-phone-number"
        : null,
    builder: (_, __) => const MyHomePage(title: "My home page"),
    routes: [],
  ),
  GoRoute(
    path: "/login",
    redirect: (_, __) => supabaseClient().auth.currentUser != null ? "/" : null,
    routes: [
      GoRoute(
        path: "enter-phone-number",
        builder: (_, __) => PhoneNumberEntryPage(),
      ),
    ],
  )
];

void handleAuthStateChange(BuildContext context, OurAuthState state) {
  if (state is SignedOut) {
    context.go("/login/enter-phone-number");
  }
}

final routerConfig = GoRouter(
  // TODO add onboarding page group and redirect function
  // TODO mark completed_onboarding in auth state
  initialLocation: "/",
  routes: [
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return RepositoryProvider(
          create: (_) => Supabase.instance.client,
          child: BlocProvider(
            create: (BuildContext context) =>
                AuthCubit(supabase: context.read<SupabaseClient>()),
            child: BlocListener<AuthCubit, OurAuthState>(
              listener: handleAuthStateChange,
              child: child,
            ),
          ),
        );
      },
      routes: routes,
    ),
  ],
);
