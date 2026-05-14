import 'package:flutter/material.dart';

import '../../features/auth/presentation/pages/home_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/splash_page.dart';
import '../../features/components/presentation/forms/input_showcase_page.dart';
import '../../features/posts/presentation/pages/post_list_page.dart';
import 'route_names.dart';

class AppRouter {
  const AppRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return _buildRoute(const SplashPage(), settings);
      case RouteNames.login:
        return _buildRoute(const LoginPage(), settings);
      case RouteNames.home:
        return _buildRoute(const HomePage(), settings);
      case RouteNames.posts:
        return _buildRoute(const PostListPage(), settings);
      case RouteNames.inputShowcase:
        return _buildRoute(const InputShowcasePage(), settings);
      default:
        return _buildRoute(
          Scaffold(
            body: Center(child: Text('Route not found: ${settings.name}')),
          ),
          settings,
        );
    }
  }

  static PageRouteBuilder<dynamic> _buildRoute(
    Widget page,
    RouteSettings settings,
  ) {
    return PageRouteBuilder<dynamic>(
      settings: settings,
      pageBuilder: (_, animation, __) => page,
      transitionsBuilder: (_, animation, __, child) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
        );
        return FadeTransition(
          opacity: curved,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.04, 0.025),
              end: Offset.zero,
            ).animate(curved),
            child: child,
          ),
        );
      },
    );
  }
}
