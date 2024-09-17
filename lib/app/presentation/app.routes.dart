import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app.exports.dart';

final GoRouter appRoutes = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MainScreen();
      },
      // routes: <RouteBase>[
      //   GoRoute(
      //     path: MainScreen.tag,
      //     builder: (BuildContext context, GoRouterState state) {
      //       return const MainScreen();
      //     },
      //   ),
      // ],
    ),
  ],
);
