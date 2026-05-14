import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/router/route_names.dart';
import '../../../../core/widgets/glass_app_bar.dart';
import '../../../../core/widgets/glass_background.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/widgets/glass_pill.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_status.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _logout(BuildContext context) {
    context.read<AuthBloc>().add(const AuthLogoutRequested());
    Navigator.pushNamedAndRemoveUntil(
      context,
      RouteNames.login,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GlassBackground(
      child: BlocListener<AuthBloc, AuthState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status == AuthStatus.unauthenticated) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              RouteNames.login,
              (route) => false,
            );
          }
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: GlassAppBar(
            title: 'Dashboard',
            actions: [
              IconButton(
                onPressed: () => _logout(context),
                icon: const Icon(Icons.logout_rounded),
              ),
            ],
          ),
          body: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              final user = state.user;
              return ListView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
                children: [
                  _HeroSection(
                    name: user?.name ?? 'Builder',
                    email: user?.email ?? 'demo mode',
                  ),
                  const SizedBox(height: 18),
                  _MenuCard(
                    icon: Icons.dynamic_feed_rounded,
                    title: 'Posts Infinite Scroll',
                    subtitle:
                        'Public API list with pagination, refresh, loading more, and error state.',
                    badge: 'API MODULE',
                    onTap: () => Navigator.pushNamed(context, RouteNames.posts),
                  ),
                  const SizedBox(height: 14),
                  _MenuCard(
                    icon: Icons.text_fields_rounded,
                    title: 'Text Showcase',
                    subtitle:
                        'Gradient text, silver text, neon text, rich text, amount text, running text, typing text, and animated counter.',
                    badge: 'TEXT UI',
                    onTap: () =>
                        Navigator.pushNamed(context, RouteNames.textShowcase),
                  ),
                  const SizedBox(height: 14),
                  _MenuCard(
                    icon: Icons.tune_rounded,
                    title: 'Input Showcase',
                    subtitle:
                        'Text, password, textarea, radio, dropdown, checkbox, switch, slider, date picker.',
                    badge: 'FORM UI',
                    onTap: () =>
                        Navigator.pushNamed(context, RouteNames.inputShowcase),
                  ),
                  const SizedBox(height: 14),

                  _MenuCard(
                    icon: Icons.show_chart_rounded,
                    title: 'Chart Showcase',
                    subtitle:
                        'Line chart, bar chart, donut chart, mini sparkline, and portfolio performance.',
                    badge: 'CHARTS',
                    onTap: () =>
                        Navigator.pushNamed(context, RouteNames.chartShowcase),
                  ),
                  const SizedBox(height: 14),
                  _MenuCard(
                    icon: Icons.search_rounded,
                    title: 'Search & Filter Showcase',
                    subtitle:
                        'Search bar, filter chips, sort dropdown, date range filter, category filter, and active tags.',
                    badge: 'FILTER',
                    onTap: () => Navigator.pushNamed(
                      context,
                      RouteNames.searchFilterShowcase,
                    ),
                  ),
                  const SizedBox(height: 14),
                  _MenuCard(
                    icon: Icons.lock_rounded,
                    title: 'Auth Showcase',
                    subtitle:
                        'Login, register, forgot password, reset password, OTP input, PIN input, biometric login, and social button.',
                    badge: 'AUTH',
                    onTap: () =>
                        Navigator.pushNamed(context, RouteNames.authShowcase),
                  ),
                  const SizedBox(height: 14),
                  _MenuCard(
                    icon: Icons.account_balance_wallet_rounded,
                    title: 'Wallet Showcase',
                    subtitle:
                        'Wallet balance, payment method, bank account, crypto address, QR code, fee breakdown, and receipt card.',
                    badge: 'WALLET',
                    onTap: () =>
                        Navigator.pushNamed(context, RouteNames.walletShowcase),
                  ),
                  const SizedBox(height: 14),
                  _MenuCard(
                    icon: Icons.smart_button_rounded,
                    title: 'Button Showcase',
                    subtitle:
                        'Primary, secondary, outline, ghost, loading, disabled, success, danger, and icon buttons.',
                    badge: 'BUTTONS',
                    onTap: () =>
                        Navigator.pushNamed(context, RouteNames.buttonShowcase),
                  ),
                  const SizedBox(height: 14),
                  _MenuCard(
                    icon: Icons.dashboard_customize_rounded,
                    title: 'Card Showcase',
                    subtitle:
                        'Glass cards, gradient cards, stat cards, profile cards, transaction cards, and selectable cards.',
                    badge: 'CARDS',
                    onTap: () =>
                        Navigator.pushNamed(context, RouteNames.cardShowcase),
                  ),
                  const SizedBox(height: 14),
                  _MenuCard(
                    icon: Icons.web_asset_rounded,
                    title: 'Dialog Showcase',
                    subtitle:
                        'Success, error, warning, info, confirmation, and custom glass dialogs.',
                    badge: 'DIALOGS',
                    onTap: () =>
                        Navigator.pushNamed(context, RouteNames.dialogShowcase),
                  ),
                  const SizedBox(height: 14),
                  _MenuCard(
                    icon: Icons.vertical_align_bottom_rounded,
                    title: 'Bottom Sheet Showcase',
                    subtitle:
                        'Action sheet, filter sheet, picker sheet, confirmation sheet, and scrollable glass bottom sheet.',
                    badge: 'SHEETS',
                    onTap: () => Navigator.pushNamed(
                      context,
                      RouteNames.bottomSheetShowcase,
                    ),
                  ),
                  const SizedBox(height: 14),
                  _MenuCard(
                    icon: Icons.notifications_active_rounded,
                    title: 'Feedback Showcase',
                    subtitle:
                        'Success toast, error toast, warning snackbar, info alert, banner, and inline feedback.',
                    badge: 'FEEDBACK',
                    onTap: () => Navigator.pushNamed(
                      context,
                      RouteNames.feedbackShowcase,
                    ),
                  ),
                  const SizedBox(height: 14),
                  _MenuCard(
                    icon: Icons.inbox_rounded,
                    title: 'Empty State Showcase',
                    subtitle:
                        'No data, no internet, no search result, no transaction, server error, and retry state.',
                    badge: 'STATES',
                    onTap: () => Navigator.pushNamed(
                      context,
                      RouteNames.emptyStateShowcase,
                    ),
                  ),
                  const SizedBox(height: 14),
                  _MenuCard(
                    icon: Icons.hourglass_top_rounded,
                    title: 'Loader Showcase',
                    subtitle:
                        'Circular loader, linear progress, full page loading, card skeleton, list skeleton, and shimmer state.',
                    badge: 'LOADERS',
                    onTap: () =>
                        Navigator.pushNamed(context, RouteNames.loaderShowcase),
                  ),
                  const SizedBox(height: 14),
                  _MenuCard(
                    icon: Icons.list_alt_rounded,
                    title: 'List Item Showcase',
                    subtitle:
                        'Basic list tile, avatar item, notification item, transaction item, crypto item, and selectable row.',
                    badge: 'LIST UI',
                    onTap: () => Navigator.pushNamed(
                      context,
                      RouteNames.listItemShowcase,
                    ),
                  ),
                  const SizedBox(height: 14),
                  _MenuCard(
                    icon: Icons.new_releases_rounded,
                    title: 'Badge & Chip Showcase',
                    subtitle:
                        'Status badge, category chip, filter chip, selected chip, gradient badge, and premium tag.',
                    badge: 'BADGES',
                    onTap: () =>
                        Navigator.pushNamed(context, RouteNames.badgeShowcase),
                  ),
                  const SizedBox(height: 14),
                  _MenuCard(
                    icon: Icons.view_headline_rounded,
                    title: 'AppBar Showcase',
                    subtitle:
                        'Default appbar, transparent appbar, search appbar, action header, title subtitle, and large header.',
                    badge: 'HEADERS',
                    onTap: () =>
                        Navigator.pushNamed(context, RouteNames.appBarShowcase),
                  ),
                  const SizedBox(height: 14),
                  _MenuCard(
                    icon: Icons.alt_route_rounded,
                    title: 'Navigation Showcase',
                    subtitle:
                        'Bottom navigation, tab bar, segmented control, stepper, page indicator, and navigation patterns.',
                    badge: 'NAV',
                    onTap: () => Navigator.pushNamed(
                      context,
                      RouteNames.navigationShowcase,
                    ),
                  ),
                  const SizedBox(height: 14),
                  _MenuCard(
                    icon: Icons.auto_awesome_mosaic_rounded,
                    title: 'Layout Showcase',
                    subtitle:
                        'Page wrapper, section header, glass background, responsive padding, grid layout, and content block.',
                    badge: 'LAYOUT',
                    onTap: () =>
                        Navigator.pushNamed(context, RouteNames.layoutShowcase),
                  ),
                  const SizedBox(height: 14),
                  _MenuCard(
                    icon: Icons.widgets_rounded,
                    title: 'Extra Showcase Components',
                    subtitle:
                        'Chart, media, table, timeline, search filter, profile, onboarding, auth, notification, wallet, security, and utility components.',
                    badge: 'EXTRA UI',
                    onTap: () =>
                        Navigator.pushNamed(context, RouteNames.extraShowcase),
                  ),
                  const SizedBox(height: 14),
                  const _InfoGrid(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  final String name;
  final String email;
  const _HeroSection({required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(24),
      borderRadius: 34,
      gradientColors: [
        Colors.white.withOpacity(0.20),
        const Color(0xFFAEC2FF).withOpacity(0.08),
        Colors.white.withOpacity(0.06),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GlassPill(
            text: 'MY FLUTTER STATION',
            icon: Icons.blur_on_rounded,
          ),
          const SizedBox(height: 24),
          Text(
            'Hi, $name 👋',
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.9,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            email,
            style: TextStyle(
              color: Colors.white.withOpacity(0.66),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: const [
              Expanded(
                child: _StatItem(label: 'Pattern', value: 'Clean'),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _StatItem(label: 'State', value: 'Bloc'),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _StatItem(label: 'Style', value: 'Glass'),
              ),
            ],
          ),
        ],
      ),
    );
  }
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
    return GlassCard(
      onTap: onTap,
      padding: const EdgeInsets.all(18),
      borderRadius: 30,
      child: Row(
        children: [
          Container(
            width: 62,
            height: 62,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(23),
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.88),
                  const Color(0xFFAEC2FF).withOpacity(0.64),
                  const Color(0xFF55F7E6).withOpacity(0.34),
                ],
              ),
            ),
            child: Icon(icon, color: const Color(0xFF111827)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GlassPill(text: badge),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.2,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: TextStyle(
                    height: 1.42,
                    color: Colors.white.withOpacity(0.62),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          const Icon(Icons.arrow_forward_ios_rounded, size: 17),
        ],
      ),
    );
  }
}

class _InfoGrid extends StatelessWidget {
  const _InfoGrid();
  @override
  Widget build(BuildContext context) => Row(
    children: const [
      Expanded(
        child: _SmallCard(
          icon: Icons.route_rounded,
          title: 'Router',
          subtitle: 'RouteNames',
        ),
      ),
      SizedBox(width: 14),
      Expanded(
        child: _SmallCard(
          icon: Icons.extension_rounded,
          title: 'DI',
          subtitle: 'GetIt',
        ),
      ),
    ],
  );
}

class _SmallCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  const _SmallCard({
    required this.icon,
    required this.title,
    required this.subtitle,
  });
  @override
  Widget build(BuildContext context) => GlassCard(
    borderRadius: 28,
    padding: const EdgeInsets.all(18),
    child: SizedBox(
      height: 106,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFFAEC2FF)),
          const Spacer(),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              color: Colors.white.withOpacity(0.58),
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    ),
  );
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  const _StatItem({required this.label, required this.value});
  @override
  Widget build(BuildContext context) => GlassCard(
    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
    borderRadius: 20,
    child: Column(
      children: [
        Text(value, style: const TextStyle(fontWeight: FontWeight.w900)),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: Colors.white.withOpacity(0.60),
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    ),
  );
}
