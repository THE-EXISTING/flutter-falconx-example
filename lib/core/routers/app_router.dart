import 'package:flutter_falconx_example/src/home/home.dart';
import 'package:flutter_falconx_example/src/product_detail/views/product_detail_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String home = 'home';
  static const String detail = 'detail';

  static final GoRouter router = GoRouter(
    routes: _routes,
  );

  static final List<GoRoute> _routes = [
    GoRoute(
      path: '/',
      name: home,
      builder: (context, state) => HomeMainPage.create(),
      routes: [
        GoRoute(
          path: 'product/:id',
          name: detail,
          builder: (context, state) => ProductDetailPage.create(
            id: state.params['id'] ?? '',
          ),
        ),
      ],
    ),
  ];
}
