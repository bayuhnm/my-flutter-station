import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/glass_app_bar.dart';
import '../../../../core/widgets/glass_background.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/widgets/glass_pill.dart';
import '../bloc/showcase_cubit.dart';
import '../showcase_component_routes.dart';

class ShowcaseMenuPage extends StatelessWidget {
  const ShowcaseMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final menus = [
      _ShowcaseMenu(Icons.show_chart_rounded, 'Chart Showcase', 'Line chart, bar chart, donut chart, mini sparkline, and portfolio performance.', 'CHARTS', ShowcaseComponentRoutes.chart),
      _ShowcaseMenu(Icons.image_rounded, 'Media Showcase', 'Avatar, profile image, upload image box, image placeholder, banner, and stacked avatar.', 'MEDIA', ShowcaseComponentRoutes.media),
      _ShowcaseMenu(Icons.table_chart_rounded, 'Table Showcase', 'Simple table, transaction table, key value table, comparison table, and pricing table.', 'TABLE', ShowcaseComponentRoutes.table),
      _ShowcaseMenu(Icons.timeline_rounded, 'Timeline Showcase', 'Vertical timeline, transaction timeline, KYC progress, order status, and step tracking.', 'TIMELINE', ShowcaseComponentRoutes.timeline),
      _ShowcaseMenu(Icons.search_rounded, 'Search & Filter Showcase', 'Search bar, filter chips, sort dropdown, date range filter, category filter, and active tags.', 'FILTER', ShowcaseComponentRoutes.searchFilter),
      _ShowcaseMenu(Icons.person_rounded, 'Profile Showcase', 'Profile header, account menu, settings tile, security tile, connected account card, and logout section.', 'PROFILE', ShowcaseComponentRoutes.profile),
      _ShowcaseMenu(Icons.rocket_launch_rounded, 'Onboarding Showcase', 'Welcome page, feature highlight, onboarding carousel, permission request, and get started section.', 'START', ShowcaseComponentRoutes.onboarding),
      _ShowcaseMenu(Icons.lock_rounded, 'Auth Showcase', 'Login, register, forgot password, reset password, OTP input, PIN input, biometric login, and social button.', 'AUTH', ShowcaseComponentRoutes.auth),
      _ShowcaseMenu(Icons.notifications_rounded, 'Notification Showcase', 'Notification card, unread state, activity item, announcement banner, alert center, and grouped notification.', 'NOTIF', ShowcaseComponentRoutes.notification),
      _ShowcaseMenu(Icons.account_balance_wallet_rounded, 'Wallet Showcase', 'Wallet balance, payment method, bank account, crypto address, QR code, fee breakdown, and receipt card.', 'WALLET', ShowcaseComponentRoutes.wallet),
      _ShowcaseMenu(Icons.security_rounded, 'Security Showcase', 'Permission card, security warning, 2FA card, device session, password strength, and privacy notice.', 'SECURITY', ShowcaseComponentRoutes.security),
      _ShowcaseMenu(Icons.build_circle_rounded, 'Utility Showcase', 'Divider, dotted divider, info row, key value row, copy button, timer, countdown, rating, and tooltip.', 'UTILS', ShowcaseComponentRoutes.utility),
    ];

    return BlocProvider(
      create: (_) => ShowcaseCubit(),
      child: GlassBackground(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: const GlassAppBar(title: 'Extra Showcase'),
          body: ListView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
            children: [
              GlassCard(
                borderRadius: 34,
                padding: const EdgeInsets.all(24),
                gradientColors: [
                  Colors.white.withOpacity(0.22),
                  const Color(0xFFAEC2FF).withOpacity(0.09),
                  Colors.white.withOpacity(0.06),
                ],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const GlassPill(text: 'EXTRA COMPONENTS', icon: Icons.widgets_rounded),
                    const SizedBox(height: 20),
                    const Text(
                      'Production Ready UI Kit',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900, letterSpacing: -0.8),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Additional glassmorphism components for real app screens: chart, wallet, auth, profile, timeline, and utilities.',
                      style: TextStyle(height: 1.45, color: Colors.white.withOpacity(0.66), fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ...menus.map((item) {
                return _MenuCard(
                  icon: item.icon,
                  title: item.title,
                  subtitle: item.subtitle,
                  badge: item.badge,
                  onTap: () => Navigator.pushNamed(context, item.route),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class _ShowcaseMenu {
  final IconData icon;
  final String title;
  final String subtitle;
  final String badge;
  final String route;

  const _ShowcaseMenu(this.icon, this.title, this.subtitle, this.badge, this.route);
}

class _MenuCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String badge;
  final VoidCallback onTap;

  const _MenuCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.badge,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onTap,
        child: GlassCard(
          borderRadius: 30,
          padding: const EdgeInsets.all(18),
          child: Row(
            children: [
              Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21),
                  color: const Color(0xFFAEC2FF).withOpacity(0.12),
                  border: Border.all(color: const Color(0xFFAEC2FF).withOpacity(0.25)),
                ),
                child: Icon(icon, color: const Color(0xFFAEC2FF)),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(
                    children: [
                      Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 17))),
                      GlassPill(text: badge),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.white.withOpacity(0.58), fontWeight: FontWeight.w600, height: 1.35),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
