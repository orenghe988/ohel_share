import "dart:async";
import "package:flutter/cupertino.dart";
import "package:go_router/go_router.dart";
import "../utils/supabase_utils.dart";
import "routes/home/home.dart" show MyHomePage;


final GlobalKey<NavigatorState> _rootNavigatorKey =
  GlobalKey<NavigatorState>();

final routerConfig = GoRouter(
  // TODO add onboarding page group and redirect function
  // TODO mark completed_onboarding in auth state
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: "/",
      redirect: (_, __) =>
        supabaseClient().auth.currentSession == null ? "/login/enter-phone-number" : null,
      builder: (BuildContext context, GoRouterState state) =>
          const MyHomePage(title: "My home page"),
      routes: [],
    ),
    GoRoute(
      path: "/login",
      redirect: (_, __) =>
        supabaseClient().auth.currentSession != null ? "/" : null,
      routes: [
        GoRoute(
          path: "/enter-phone-number",
        //   TODO builder
        ),
      ],
    )
  ],
);
