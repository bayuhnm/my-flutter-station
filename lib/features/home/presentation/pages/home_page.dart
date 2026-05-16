import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/router/route_names.dart';
import '../../../../core/widgets/app_background.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_event.dart';
import '../../../auth/presentation/bloc/auth_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const _primaryBlue = Color(0xFF38BDF8);
  static const _deepNavy = Color(0xFF020617);
  static const _luxuryGold = Color(0xFFF8D66D);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? _deepNavy : const Color(0xFFF4F7FB),
      body: LuxuryAppBackground(
        child: SafeArea(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(22, 18, 22, 28),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    const _HomeHeader(),
                    const SizedBox(height: 26),
                    const _HeroPortfolioCard(),
                    const SizedBox(height: 18),
                    const _QuickStatsGrid(),
                    const SizedBox(height: 28),
                    _SectionHeader(
                      title: 'Design Modules',
                      subtitle:
                          'Explore premium UI previews built with reusable architecture.',
                      actionText: 'View all',
                      onTap: () {},
                    ),
                    const SizedBox(height: 14),
                    _LuxuryModuleTile(
                      title: 'Auth Page Preview',
                      subtitle:
                          '3 premium auth styles powered by the same Bloc.',
                      icon: Icons.login_rounded,
                      badge: 'Ready',
                      glowColor: _primaryBlue,
                      onTap: () =>
                          Navigator.pushNamed(context, RouteNames.authPreview),
                    ),
                    const SizedBox(height: 14),
                    _LuxuryModuleTile(
                      title: 'List Item Preview',
                      subtitle:
                          'Market cards, portfolio rows, infinite scroll layouts.',
                      icon: Icons.view_agenda_rounded,
                      badge: 'Soon',
                      glowColor: const Color(0xFF8B5CF6),
                      onTap: () {},
                    ),
                    const SizedBox(height: 14),
                    _LuxuryModuleTile(
                      title: 'All Form Preview',
                      subtitle:
                          'Input, dropdown, radio, upload, validation and states.',
                      icon: Icons.dynamic_form_rounded,
                      badge: 'Soon',
                      glowColor: const Color(0xFF22C55E),
                      onTap: () {},
                    ),
                    const SizedBox(height: 24),
                    const _DesignSystemBanner(),
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

class _HomeHeader extends StatelessWidget {
  const _HomeHeader();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF38BDF8), Color(0xFF1E3A8A)],
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF38BDF8).withValues(alpha: 0.35),
                blurRadius: 26,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: const Icon(Icons.auto_awesome_rounded, color: Colors.white),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Flutter Station',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                  letterSpacing: -0.6,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Luxury crypto UI template',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: isDark
                      ? Colors.white.withValues(alpha: 0.62)
                      : Colors.black.withValues(alpha: 0.55),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        BlocBuilder<AuthBloc, AuthState>(
          buildWhen: (previous, current) =>
              previous.themeMode != current.themeMode,
          builder: (context, state) {
            final isThemeDark = state.themeMode == ThemeMode.dark;

            return _GlassIconButton(
              icon: isThemeDark
                  ? Icons.light_mode_rounded
                  : Icons.dark_mode_rounded,
              onTap: () {
                final next = isThemeDark ? ThemeMode.light : ThemeMode.dark;

                context.read<AuthBloc>().add(AuthThemeModeChanged(next));
              },
            );
          },
        ),
      ],
    );
  }
}

class _HeroPortfolioCard extends StatelessWidget {
  const _HeroPortfolioCard();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return _PremiumGlassCard(
      padding: EdgeInsets.zero,
      borderRadius: 34,
      child: Stack(
        children: [
          Positioned(
            right: -60,
            top: -70,
            child: _BlurCircle(
              size: 190,
              color: const Color(0xFF38BDF8).withValues(alpha: 0.32),
            ),
          ),
          Positioned(
            left: -70,
            bottom: -80,
            child: _BlurCircle(
              size: 170,
              color: const Color(0xFF8B5CF6).withValues(alpha: 0.18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _SoftBadge(
                      label: 'Portfolio Preview',
                      icon: Icons.diamond_rounded,
                      color: const Color(0xFFF8D66D),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(
                          alpha: isDark ? 0.08 : 0.58,
                        ),
                        borderRadius: BorderRadius.circular(999),
                        border: Border.all(
                          color: Colors.white.withValues(
                            alpha: isDark ? 0.12 : 0.7,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 7,
                            height: 7,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF22C55E),
                            ),
                          ),
                          const SizedBox(width: 7),
                          Text(
                            'Live UI',
                            style: Theme.of(context).textTheme.labelSmall
                                ?.copyWith(fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 26),
                Text(
                  '\$42,891.20',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w900,
                    letterSpacing: -1.4,
                    height: 1,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.trending_up_rounded,
                      color: Color(0xFF22C55E),
                      size: 20,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '+12.48%',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: const Color(0xFF22C55E),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'last 24 hours',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: isDark
                            ? Colors.white.withValues(alpha: 0.56)
                            : Colors.black.withValues(alpha: 0.48),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: _HeroActionButton(
                        label: 'Explore Modules',
                        icon: Icons.grid_view_rounded,
                        isPrimary: true,
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _HeroActionButton(
                        label: 'Design System',
                        icon: Icons.palette_rounded,
                        isPrimary: false,
                        onTap: () {
                          Navigator.pushNamed(context, RouteNames.designSystem);
                        },
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

class _QuickStatsGrid extends StatelessWidget {
  const _QuickStatsGrid();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: _LuxuryMetricCard(
            label: 'UI Modules',
            value: '12+',
            icon: Icons.widgets_rounded,
            color: Color(0xFF38BDF8),
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: _LuxuryMetricCard(
            label: 'Reusable Bloc',
            value: 'Mono',
            icon: Icons.hub_rounded,
            color: Color(0xFFF8D66D),
          ),
        ),
      ],
    );
  }
}

class _LuxuryMetricCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const _LuxuryMetricCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return _PremiumGlassCard(
      padding: const EdgeInsets.all(18),
      borderRadius: 26,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withValues(alpha: 0.14),
              border: Border.all(color: color.withValues(alpha: 0.26)),
            ),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(height: 16),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w900,
              letterSpacing: -0.8,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white.withValues(alpha: 0.56)
                  : Colors.black.withValues(alpha: 0.48),
            ),
          ),
        ],
      ),
    );
  }
}

class _LuxuryModuleTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final String badge;
  final Color glowColor;
  final VoidCallback onTap;

  const _LuxuryModuleTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.badge,
    required this.glowColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return _PremiumGlassCard(
      onTap: onTap,
      padding: const EdgeInsets.all(18),
      borderRadius: 28,
      child: Row(
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  glowColor.withValues(alpha: 0.28),
                  glowColor.withValues(alpha: 0.08),
                ],
              ),
              border: Border.all(color: glowColor.withValues(alpha: 0.28)),
              boxShadow: [
                BoxShadow(
                  color: glowColor.withValues(alpha: isDark ? 0.24 : 0.16),
                  blurRadius: 24,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: Icon(icon, color: glowColor, size: 28),
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
                              letterSpacing: -0.2,
                            ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    _MiniBadge(label: badge, color: glowColor),
                  ],
                ),
                const SizedBox(height: 7),
                Text(
                  subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    height: 1.35,
                    color: isDark
                        ? Colors.white.withValues(alpha: 0.58)
                        : Colors.black.withValues(alpha: 0.52),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16,
            color: isDark
                ? Colors.white.withValues(alpha: 0.5)
                : Colors.black.withValues(alpha: 0.42),
          ),
        ],
      ),
    );
  }
}

class _DesignSystemBanner extends StatelessWidget {
  const _DesignSystemBanner();

  @override
  Widget build(BuildContext context) {
    return _PremiumGlassCard(
      padding: const EdgeInsets.all(20),
      borderRadius: 30,
      child: Row(
        children: [
          const Icon(
            Icons.auto_fix_high_rounded,
            color: Color(0xFFF8D66D),
            size: 28,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              'Built for scalable preview modules: auth, list items, forms, cards, dialogs, charts and more.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                height: 1.4,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final String actionText;
  final VoidCallback onTap;

  const _SectionHeader({
    required this.title,
    required this.subtitle,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
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
                  color: isDark
                      ? Colors.white.withValues(alpha: 0.54)
                      : Colors.black.withValues(alpha: 0.48),
                ),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: onTap,
          child: Text(
            actionText,
            style: const TextStyle(fontWeight: FontWeight.w800),
          ),
        ),
      ],
    );
  }
}

class _HeroActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isPrimary;
  final VoidCallback onTap;

  const _HeroActionButton({
    required this.label,
    required this.icon,
    required this.isPrimary,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(18),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          constraints: const BoxConstraints(minHeight: 52),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            gradient: isPrimary
                ? const LinearGradient(
                    colors: [Color(0xFF38BDF8), Color(0xFF2563EB)],
                  )
                : null,
            color: isPrimary
                ? null
                : Colors.white.withValues(alpha: isDark ? 0.07 : 0.62),
            border: Border.all(
              color: isPrimary
                  ? Colors.white.withValues(alpha: 0.18)
                  : Colors.white.withValues(alpha: isDark ? 0.1 : 0.75),
            ),
            boxShadow: isPrimary
                ? [
                    BoxShadow(
                      color: const Color(0xFF38BDF8).withValues(alpha: 0.28),
                      blurRadius: 24,
                      offset: const Offset(0, 12),
                    ),
                  ]
                : null,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 18,
                  color: isPrimary ? Colors.white : colorScheme.onSurface,
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    label,
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: isPrimary ? Colors.white : colorScheme.onSurface,
                      fontWeight: FontWeight.w800,
                      height: 1.15,
                      letterSpacing: -0.1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GlassIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _GlassIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: Material(
          color: Colors.white.withValues(alpha: isDark ? 0.08 : 0.7),
          child: InkWell(
            onTap: onTap,
            child: Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: Colors.white.withValues(alpha: isDark ? 0.12 : 0.78),
                ),
              ),
              child: Icon(icon),
            ),
          ),
        ),
      ),
    );
  }
}

class _PremiumGlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final VoidCallback? onTap;

  const _PremiumGlassCard({
    required this.child,
    this.padding = const EdgeInsets.all(20),
    this.borderRadius = 28,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final card = ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 22, sigmaY: 22),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: Colors.white.withValues(alpha: isDark ? 0.075 : 0.7),
            border: Border.all(
              color: Colors.white.withValues(alpha: isDark ? 0.12 : 0.85),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isDark ? 0.36 : 0.08),
                blurRadius: 34,
                offset: const Offset(0, 20),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );

    if (onTap == null) return card;

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius),
        child: card,
      ),
    );
  }
}

class _SoftBadge extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;

  const _SoftBadge({
    required this.label,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withValues(alpha: 0.26)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 16),
          const SizedBox(width: 7),
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: color,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}

class _MiniBadge extends StatelessWidget {
  final String label;
  final Color color;

  const _MiniBadge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withValues(alpha: 0.28)),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: color,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}

class _BlurCircle extends StatelessWidget {
  final double size;
  final Color color;

  const _BlurCircle({required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 55, sigmaY: 55),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      ),
    );
  }
}
