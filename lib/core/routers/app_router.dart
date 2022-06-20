import 'package:flutter_falconx_example/src/home/home.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String home = '/';

  static final GoRouter router = GoRouter(
    routes: _routes,
  );

  static final List<GoRoute> _routes = [
    GoRoute(
      path: home,
      builder: (context, state) => const HomePage(),
    ),
  ];
}
