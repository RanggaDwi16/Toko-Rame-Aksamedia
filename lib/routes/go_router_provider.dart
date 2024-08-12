import 'package:aksamedia/features/home/pages/home_screen.dart';
import 'package:aksamedia/features/product/data/product_data.dart';
import 'package:aksamedia/features/product/pages/product_screen.dart';
import 'package:aksamedia/routes/router_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'go_router_provider.g.dart';

@Riverpod(keepAlive: true)
Raw<GoRouter> router(RouterRef ref) {
  return GoRouter(
    initialLocation: RouteName.home,
    debugLogDiagnostics: false,
    routes: [
      GoRoute(
        path: '/',
        name: RouteName.home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/product',
        name: RouteName.product,
        builder: (context, state) {
          // Pastikan state.extra tidak null
          if (state.extra == null || state.extra is! ProductData) {
            return const Scaffold(
              body: Center(child: Text("Product data is missing or invalid")),
            );
          }
          final data = state.extra as ProductData;
          return ProductPage(data: data);
        },
      ),
    ],
  );
}
