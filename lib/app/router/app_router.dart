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
import '../../features/components/presentation/texts/text_showcase_page.dart';
import '../../features/posts/presentation/pages/post_list_page.dart';
import '../../features/showcase_components/presentation/pages/showcase_menu_page.dart';
import '../../features/showcase_components/presentation/pages/chart_showcase_page.dart';
import '../../features/showcase_components/presentation/pages/media_showcase_page.dart';
import '../../features/showcase_components/presentation/pages/table_showcase_page.dart';
import '../../features/showcase_components/presentation/pages/timeline_showcase_page.dart';
import '../../features/showcase_components/presentation/pages/search_filter_showcase_page.dart';
import '../../features/showcase_components/presentation/pages/profile_showcase_page.dart';
import '../../features/showcase_components/presentation/pages/onboarding_showcase_page.dart';
import '../../features/showcase_components/presentation/pages/auth_showcase_page.dart';
import '../../features/showcase_components/presentation/pages/notification_showcase_page.dart';
import '../../features/showcase_components/presentation/pages/wallet_showcase_page.dart';
import '../../features/showcase_components/presentation/pages/security_showcase_page.dart';
import '../../features/showcase_components/presentation/pages/utility_showcase_page.dart';
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

      // Main showcase
      case RouteNames.textShowcase:
        return _buildRoute(const TextShowcasePage(), settings);
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

      // Extra showcase
      case RouteNames.extraShowcase:
        return _buildRoute(const ShowcaseMenuPage(), settings);
      case RouteNames.chartShowcase:
        return _buildRoute(const ChartShowcasePage(), settings);
      case RouteNames.mediaShowcase:
        return _buildRoute(const MediaShowcasePage(), settings);
      case RouteNames.tableShowcase:
        return _buildRoute(const TableShowcasePage(), settings);
      case RouteNames.timelineShowcase:
        return _buildRoute(const TimelineShowcasePage(), settings);
      case RouteNames.searchFilterShowcase:
        return _buildRoute(const SearchFilterShowcasePage(), settings);
      case RouteNames.profileShowcase:
        return _buildRoute(const ProfileShowcasePage(), settings);
      case RouteNames.onboardingShowcase:
        return _buildRoute(const OnboardingShowcasePage(), settings);
      case RouteNames.authShowcase:
        return _buildRoute(const AuthShowcasePage(), settings);
      case RouteNames.notificationShowcase:
        return _buildRoute(const NotificationShowcasePage(), settings);
      case RouteNames.walletShowcase:
        return _buildRoute(const WalletShowcasePage(), settings);
      case RouteNames.securityShowcase:
        return _buildRoute(const SecurityShowcasePage(), settings);
      case RouteNames.utilityShowcase:
        return _buildRoute(const UtilityShowcasePage(), settings);

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
