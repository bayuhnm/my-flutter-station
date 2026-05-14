import 'package:flutter/material.dart';

import '../../features/auth/presentation/pages/home_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/splash_page.dart';
import '../../features/components/presentation/appbars/app_bar_showcase_page.dart';
import '../../features/components/presentation/badges/badge_showcase_page.dart';
import '../../features/components/presentation/bottom_sheets/bottom_sheet_showcase_page.dart';
import '../../features/components/presentation/buttons/button_showcase_page.dart';
import '../../features/components/presentation/cards/card_showcase_page.dart';
import '../../features/components/presentation/dialogs/dialog_showcase_page.dart';
import '../../features/components/presentation/empty_states/empty_state_showcase_page.dart';
import '../../features/components/presentation/feedbacks/feedback_showcase_page.dart';
import '../../features/components/presentation/forms/input_showcase_page.dart';
import '../../features/components/presentation/layouts/layout_showcase_page.dart';
import '../../features/components/presentation/list_items/list_item_showcase_page.dart';
import '../../features/components/presentation/loaders/loader_showcase_page.dart';
import '../../features/components/presentation/navigations/navigation_showcase_page.dart';
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
      case RouteNames.buttonShowcase:
        return _buildRoute(const ButtonShowcasePage(), settings);
      case RouteNames.cardShowcase:
        return _buildRoute(const CardShowcasePage(), settings);
      case RouteNames.dialogShowcase:
        return _buildRoute(const DialogShowcasePage(), settings);
      case RouteNames.bottomSheetShowcase:
        return _buildRoute(const BottomSheetShowcasePage(), settings);
      case RouteNames.feedbackShowcase:
        return _buildRoute(const FeedbackShowcasePage(), settings);
      case RouteNames.emptyStateShowcase:
        return _buildRoute(const EmptyStateShowcasePage(), settings);
      case RouteNames.loaderShowcase:
        return _buildRoute(const LoaderShowcasePage(), settings);
      case RouteNames.listItemShowcase:
        return _buildRoute(const ListItemShowcasePage(), settings);
      case RouteNames.badgeShowcase:
        return _buildRoute(const BadgeShowcasePage(), settings);
      case RouteNames.appBarShowcase:
        return _buildRoute(const AppBarShowcasePage(), settings);
      case RouteNames.navigationShowcase:
        return _buildRoute(const NavigationShowcasePage(), settings);
      case RouteNames.layoutShowcase:
        return _buildRoute(const LayoutShowcasePage(), settings);
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
