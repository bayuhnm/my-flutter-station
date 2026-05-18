import 'package:flutter/material.dart';
import 'package:my_flutter_station/features/design_system/presentation/pages/design_system_page.dart';
import 'package:my_flutter_station/features/design_system/presentation/pages/text_animated_preview_page.dart';

import '../../features/auth/presentation/pages/auth_luxury_page.dart';
import '../../features/auth/presentation/pages/auth_minimal_crypto_page.dart';
import '../../features/auth/presentation/pages/auth_neon_card_page.dart';
import '../../features/auth/presentation/pages/auth_preview_page.dart';
import '../../features/design_system/presentation/pages/button_animated_preview_page.dart';
import '../../features/design_system/presentation/pages/image_card_preview_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import 'route_names.dart';

class AppRouter {
  const AppRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return _fade(const SplashPage(), settings);
      case RouteNames.home:
        return _fade(const HomePage(), settings);
      case RouteNames.authPreview:
        return _slide(const AuthPreviewPage(), settings);
      case RouteNames.authLuxury:
        return _slide(const AuthLuxuryPage(), settings);
      case RouteNames.authNeonCard:
        return _slide(const AuthNeonCardPage(), settings);
      case RouteNames.authMinimal:
        return _slide(const AuthMinimalCryptoPage(), settings);

      case RouteNames.designSystem:
        return _slide(const DesignSystemPage(), settings);
      case RouteNames.textAnimatedPreview:
        return _slide(const TextAnimatedPreviewPage(), settings);
      case RouteNames.buttonAnimatedPreview:
        return _slide(const ButtonAnimatedPreviewPage(), settings);
      case RouteNames.imageCardPreview:
        return _slide(const ImageCardPreviewPage(), settings);

      default:
        return _fade(const _RouteNotFoundPage(), settings);
    }
  }

  static PageRouteBuilder<dynamic> _fade(Widget page, RouteSettings settings) {
    return PageRouteBuilder<dynamic>(
      settings: settings,
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, animation, __, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }

  static PageRouteBuilder<dynamic> _slide(Widget page, RouteSettings settings) {
    return PageRouteBuilder<dynamic>(
      settings: settings,
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, animation, __, child) {
        final tween = Tween<Offset>(
          begin: const Offset(0.08, 0),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.easeOutCubic));
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: animation.drive(tween),
            child: child,
          ),
        );
      },
    );
  }
}

class _RouteNotFoundPage extends StatelessWidget {
  const _RouteNotFoundPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Route not found',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
