import 'package:flutter/material.dart';

import 'pages/auth_showcase_page.dart';
import 'pages/chart_showcase_page.dart';
import 'pages/media_showcase_page.dart';
import 'pages/notification_showcase_page.dart';
import 'pages/onboarding_showcase_page.dart';
import 'pages/profile_showcase_page.dart';
import 'pages/search_filter_showcase_page.dart';
import 'pages/security_showcase_page.dart';
import 'pages/showcase_menu_page.dart';
import 'pages/table_showcase_page.dart';
import 'pages/timeline_showcase_page.dart';
import 'pages/utility_showcase_page.dart';
import 'pages/wallet_showcase_page.dart';

class ShowcaseComponentRoutes {
  static const root = '/extra-showcase';
  static const chart = '/extra-showcase/chart';
  static const media = '/extra-showcase/media';
  static const table = '/extra-showcase/table';
  static const timeline = '/extra-showcase/timeline';
  static const searchFilter = '/extra-showcase/search-filter';
  static const profile = '/extra-showcase/profile';
  static const onboarding = '/extra-showcase/onboarding';
  static const auth = '/extra-showcase/auth';
  static const notification = '/extra-showcase/notification';
  static const wallet = '/extra-showcase/wallet';
  static const security = '/extra-showcase/security';
  static const utility = '/extra-showcase/utility';

  static Map<String, WidgetBuilder> routes = {
    root: (_) => const ShowcaseMenuPage(),
    chart: (_) => const ChartShowcasePage(),
    media: (_) => const MediaShowcasePage(),
    table: (_) => const TableShowcasePage(),
    timeline: (_) => const TimelineShowcasePage(),
    searchFilter: (_) => const SearchFilterShowcasePage(),
    profile: (_) => const ProfileShowcasePage(),
    onboarding: (_) => const OnboardingShowcasePage(),
    auth: (_) => const AuthShowcasePage(),
    notification: (_) => const NotificationShowcasePage(),
    wallet: (_) => const WalletShowcasePage(),
    security: (_) => const SecurityShowcasePage(),
    utility: (_) => const UtilityShowcasePage(),
  };
}
