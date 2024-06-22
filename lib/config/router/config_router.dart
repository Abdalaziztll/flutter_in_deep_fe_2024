import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_in_deep/main.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
        routes: [
          GoRoute(
              path: 'details',
              builder: (context, state) {
                return DetailsScreen();
              },
              routes: [
                GoRoute(
                  path: 'hello',
                  builder: (context, state) {
                    return ExamplePage();
                  },
                )
              ])
        ]),
  ],
);


class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}