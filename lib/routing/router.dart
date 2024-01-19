import "package:flutter/cupertino.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";
import "package:supabase_flutter/supabase_flutter.dart";
import "routes/onboarding/phone_number_entry_page.dart";
import "../states/auth_state.dart";
import "../utils/supabase_utils.dart";
import 'routes/home.dart' show MyHomePage;

void handleAuthStateChange(BuildContext context, OurAuthState state) {
  if (state is SignedOut) {
    context.go("/login/enter-phone-number");
  }
}

final appRoutes = [
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

final shellRoute = ShellRoute(
  builder: (BuildContext context, GoRouterState state, Widget child) {
    return RepositoryProvider(
      create: (_) => Supabase.instance.client,
      child: BlocProvider(
        create: (BuildContext context) =>
            AuthCubit(supabase: context.read<SupabaseClient>()),
        child: BlocListener<AuthCubit, OurAuthState>(
          listener: handleAuthStateChange,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: child,
          ),
        ),
      ),
    );
  },
  routes: appRoutes,
);

final routerConfig = GoRouter(
  // TODO add onboarding page group and redirect function
  // TODO mark completed_onboarding in auth state
  initialLocation: "/",
  routes: [
    shellRoute,
  ],
);
