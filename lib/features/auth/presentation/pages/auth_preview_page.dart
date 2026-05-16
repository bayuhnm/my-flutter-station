import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/router/route_names.dart';
import '../../../../core/widgets/app_background.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../widgets/auth_premium_widget.dart';

class AuthPreviewPage extends StatelessWidget {
  const AuthPreviewPage({super.key});

  static const _blue = Color(0xFF38BDF8);
  static const _purple = Color(0xFF8B5CF6);
  static const _gold = Color(0xFFF8D66D);
  static const _green = Color(0xFF22C55E);
  static const _dark = Color(0xFF020617);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? _dark
          : const Color(0xFFF6F9FF),
      body: LuxuryAppBackground(
        child: SafeArea(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(22, 18, 22, 28),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    const _AuthPreviewHeader(),
                    const SizedBox(height: 28),
                    const _HeroPreviewCard(),
                    const SizedBox(height: 26),
                    _SectionTitle(
                      title: 'Choose Auth Experience',
                      subtitle:
                          'Semua halaman memakai AuthBloc yang sama, tetapi punya karakter visual berbeda.',
                    ),
                    const SizedBox(height: 14),
                    _PreviewTile(
                      title: 'Luxury Glass Crypto',
                      subtitle:
                          'Premium glassmorphism, elegant, cocok untuk crypto app utama.',
                      icon: Icons.diamond_rounded,
                      routeName: RouteNames.authLuxury,
                      accentColor: _gold,
                      badge: 'Premium',
                    ),
                    const SizedBox(height: 14),
                    _PreviewTile(
                      title: 'Neon Card Terminal',
                      subtitle:
                          'Bold, futuristic, cocok untuk exchange, futures, market dashboard.',
                      icon: Icons.bolt_rounded,
                      routeName: RouteNames.authNeonCard,
                      accentColor: _blue,
                      badge: 'Cyber',
                    ),
                    const SizedBox(height: 14),
                    _PreviewTile(
                      title: 'Minimal Crypto Clean',
                      subtitle:
                          'Clean, modern, high-conversion, cocok untuk onboarding simple.',
                      icon: Icons.auto_awesome_rounded,
                      routeName: RouteNames.authMinimal,
                      accentColor: _green,
                      badge: 'Clean',
                    ),
                    const SizedBox(height: 24),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AuthPreviewHeader extends StatelessWidget {
  const _AuthPreviewHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GlassIconButton(
          icon: Icons.arrow_back_rounded,
          onTap: () => Navigator.pop(context),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Auth Preview',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                'Luxury UI design station',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: authMutedColor(context),
                ),
              ),
            ],
          ),
        ),
        BlocBuilder<AuthBloc, AuthState>(
          buildWhen: (previous, current) =>
              previous.themeMode != current.themeMode,
          builder: (context, state) {
            final isDark = state.themeMode == ThemeMode.dark;

            return GlassIconButton(
              icon: isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
              onTap: () {
                context.read<AuthBloc>().add(
                  AuthThemeModeChanged(
                    isDark ? ThemeMode.light : ThemeMode.dark,
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}

class _HeroPreviewCard extends StatelessWidget {
  const _HeroPreviewCard();

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      borderRadius: 34,
      padding: EdgeInsets.zero,
      child: Stack(
        children: [
          Positioned(
            top: -70,
            right: -60,
            child: BlurGlow(
              size: 180,
              color: const Color(0xFF38BDF8).withValues(alpha: 0.32),
            ),
          ),
          Positioned(
            bottom: -80,
            left: -70,
            child: BlurGlow(
              size: 170,
              color: const Color(0xFF8B5CF6).withValues(alpha: 0.22),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PillBadge(
                  label: 'Shared Monostate Bloc',
                  icon: Icons.hub_rounded,
                  color: const Color(0xFFF8D66D),
                ),
                const SizedBox(height: 24),
                Text(
                  'One logic,\nthree premium auth styles.',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w900,
                    height: 0.98,
                    letterSpacing: -1.4,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  'Email, password, loading, error, success, dan theme mode tetap sinkron karena semua preview memakai AuthBloc yang sama.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    height: 1.55,
                    color: authMutedColor(context),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 22),
                const Row(
                  children: [
                    Expanded(
                      child: _MiniStat(
                        label: 'Styles',
                        value: '3',
                        icon: Icons.layers_rounded,
                        color: Color(0xFF38BDF8),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: _MiniStat(
                        label: 'Bloc',
                        value: '1',
                        icon: Icons.memory_rounded,
                        color: Color(0xFF22C55E),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PreviewTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final String routeName;
  final Color accentColor;
  final String badge;

  const _PreviewTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.routeName,
    required this.accentColor,
    required this.badge,
  });

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      onTap: () => Navigator.pushNamed(context, routeName),
      padding: const EdgeInsets.all(18),
      borderRadius: 28,
      child: Row(
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  accentColor.withValues(alpha: 0.28),
                  accentColor.withValues(alpha: 0.08),
                ],
              ),
              border: Border.all(color: accentColor.withValues(alpha: 0.35)),
              boxShadow: [
                BoxShadow(
                  color: accentColor.withValues(alpha: 0.22),
                  blurRadius: 28,
                  offset: const Offset(0, 14),
                ),
              ],
            ),
            child: Icon(icon, color: accentColor, size: 29),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w900,
                              letterSpacing: -0.25,
                            ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    SmallBadge(label: badge, color: accentColor),
                  ],
                ),
                const SizedBox(height: 7),
                Text(
                  subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    height: 1.38,
                    color: authMutedColor(context),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16,
            color: authMutedColor(context),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const _SectionTitle({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w900,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: authMutedColor(context),
            height: 1.38,
          ),
        ),
      ],
    );
  }
}

class _MiniStat extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const _MiniStat({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: Colors.white.withValues(
          alpha: Theme.of(context).brightness == Brightness.dark ? 0.07 : 0.58,
        ),
        border: Border.all(
          color: Colors.white.withValues(
            alpha: Theme.of(context).brightness == Brightness.dark ? 0.1 : 0.8,
          ),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 22),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                  height: 1,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                label,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: authMutedColor(context),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
