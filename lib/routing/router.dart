import "package:flutter/cupertino.dart";
import "package:go_router/go_router.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "authState.dart";
import "routes/home/home.dart" show MyHomePage;



final GlobalKey<NavigatorState> _rootNavigatorKey =
  GlobalKey<NavigatorState>();

final routerConfig = GoRouter(
  // TODO AuthCubit provider
  // TODO redirect
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: "/",
      builder: (BuildContext context, GoRouterState state) =>
          const MyHomePage(title: "My home page"),
      routes: [],
    )
  ],
);
