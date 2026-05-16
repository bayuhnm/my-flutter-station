import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../app/router/route_names.dart';
import '../../../../core/widgets/app_background.dart';

class DesignSystemPage extends StatelessWidget {
  const DesignSystemPage({super.key});

  static const _blue = Color(0xFF38BDF8);
  static const _gold = Color(0xFFF8D66D);
  static const _purple = Color(0xFF8B5CF6);
  static const _green = Color(0xFF22C55E);
  static const _pink = Color(0xFFFB7185);
  static const _dark = Color(0xFF020617);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? _dark
          : const Color(0xFFF6F9FF),
      body: AppBackground(
        child: SafeArea(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(22, 18, 22, 28),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    const _DesignSystemHeader(),
                    const SizedBox(height: 26),
                    const _DesignSystemHero(),
                    const SizedBox(height: 20),
                    const _DesignSystemStats(),
                    const SizedBox(height: 30),

                    _SectionHeader(
                      title: 'Available Preview',
                      subtitle:
                          'Start from typography and motion text. Other design system modules can be added gradually.',
                    ),

                    const SizedBox(height: 14),

                    _DesignSystemTile(
                      title: 'All Style Text & Animated Text',
                      subtitle:
                          'Heading, gradient, neon, ticker, typewriter, running text, shimmer and motion text.',
                      icon: Icons.text_fields_rounded,
                      badge: 'Ready',
                      color: _blue,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RouteNames.textAnimatedPreview,
                        );
                      },
                    ),

                    const SizedBox(height: 14),

                    _DesignSystemTile(
                      title: 'All Buttons',
                      subtitle:
                          'Primary, secondary, glass, gradient, icon, loading, disabled and premium action buttons.',
                      icon: Icons.smart_button_rounded,
                      badge: 'Next',
                      color: _purple,
                      onTap: () {},
                    ),

                    const SizedBox(height: 14),

                    _DesignSystemTile(
                      title: 'Badges & Chips',
                      subtitle:
                          'Status badge, crypto tag, category chip, filter chip, alert badge and premium labels.',
                      icon: Icons.sell_rounded,
                      badge: 'Next',
                      color: _gold,
                      onTap: () {},
                    ),

                    const SizedBox(height: 14),

                    _DesignSystemTile(
                      title: 'Cards & List Items',
                      subtitle:
                          'Market cards, portfolio rows, news cards, transaction items and infinite scroll list.',
                      icon: Icons.view_agenda_rounded,
                      badge: 'Next',
                      color: _green,
                      onTap: () {},
                    ),

                    const SizedBox(height: 14),

                    _DesignSystemTile(
                      title: 'Forms & Inputs',
                      subtitle:
                          'Text field, dropdown, radio, checkbox, date picker, upload and validation states.',
                      icon: Icons.dynamic_form_rounded,
                      badge: 'Next',
                      color: _pink,
                      onTap: () {},
                    ),

                    const SizedBox(height: 24),

                    const _DesignSystemFooterCard(),
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

class _DesignSystemHeader extends StatelessWidget {
  const _DesignSystemHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DesignSystemIconButton(
          icon: Icons.arrow_back_rounded,
          onTap: () => Navigator.pop(context),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShaderMask(
                shaderCallback: (bounds) {
                  return const LinearGradient(
                    colors: [
                      Color(0xFFFFFFFF),
                      Color(0xFF38BDF8),
                      Color(0xFFF8D66D),
                    ],
                  ).createShader(bounds);
                },
                child: Text(
                  'Design System',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.6,
                  ),
                ),
              ),
              const SizedBox(height: 3),
              Text(
                'Luxury reusable UI component station',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: designSystemMutedColor(context),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            gradient: LinearGradient(
              colors: [
                const Color(0xFFF8D66D).withValues(alpha: 0.22),
                const Color(0xFF38BDF8).withValues(alpha: 0.12),
              ],
            ),
            border: Border.all(
              color: const Color(0xFFF8D66D).withValues(alpha: 0.34),
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFF8D66D).withValues(alpha: 0.18),
                blurRadius: 24,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: const Icon(
            Icons.auto_awesome_rounded,
            color: Color(0xFFF8D66D),
          ),
        ),
      ],
    );
  }
}

class _DesignSystemHero extends StatelessWidget {
  const _DesignSystemHero();

  static const _blue = Color(0xFF38BDF8);
  static const _gold = Color(0xFFF8D66D);
  static const _purple = Color(0xFF8B5CF6);
  static const _green = Color(0xFF22C55E);

  @override
  Widget build(BuildContext context) {
    return DesignSystemGlassPanel(
      padding: EdgeInsets.zero,
      borderRadius: 36,
      child: Stack(
        children: [
          Positioned(
            top: -90,
            right: -80,
            child: DesignSystemBlurOrb(
              size: 220,
              color: _gold.withValues(alpha: 0.24),
              blur: 58,
            ),
          ),
          Positioned(
            bottom: -110,
            left: -90,
            child: DesignSystemBlurOrb(
              size: 230,
              color: _blue.withValues(alpha: 0.24),
              blur: 62,
            ),
          ),
          Positioned(
            right: 22,
            bottom: 22,
            child: Icon(
              Icons.grid_view_rounded,
              size: 96,
              color: Colors.white.withValues(
                alpha: Theme.of(context).brightness == Brightness.dark
                    ? 0.035
                    : 0.16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DesignSystemBadge(
                  label: 'Component Library',
                  icon: Icons.diamond_rounded,
                  color: _gold,
                ),
                const SizedBox(height: 24),
                Text(
                  'Preview every\npremium UI style.',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w900,
                    height: 0.98,
                    letterSpacing: -1.4,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  'A dedicated showcase hub for typography, animated text, buttons, badges, forms, cards, dialogs, charts and future premium components.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    height: 1.55,
                    color: designSystemMutedColor(context),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DesignSystemStats extends StatelessWidget {
  const _DesignSystemStats();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: _StatCard(
            title: 'Modules',
            value: '5+',
            icon: Icons.widgets_rounded,
            color: Color(0xFF38BDF8),
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: _StatCard(
            title: 'Theme',
            value: 'Dual',
            icon: Icons.dark_mode_rounded,
            color: Color(0xFFF8D66D),
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: _StatCard(
            title: 'Style',
            value: 'Lux',
            icon: Icons.auto_awesome_rounded,
            color: Color(0xFF22C55E),
          ),
        ),
      ],
    );
  }
}

class _DesignSystemTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final String badge;
  final Color color;
  final VoidCallback onTap;

  const _DesignSystemTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.badge,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return DesignSystemGlassPanel(
      onTap: onTap,
      borderRadius: 30,
      padding: const EdgeInsets.all(18),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(23),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  color.withValues(alpha: 0.32),
                  color.withValues(alpha: 0.08),
                ],
              ),
              border: Border.all(color: color.withValues(alpha: 0.34)),
              boxShadow: [
                BoxShadow(
                  color: color.withValues(alpha: 0.22),
                  blurRadius: 28,
                  offset: const Offset(0, 15),
                ),
              ],
            ),
            child: Icon(icon, color: color, size: 30),
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
                    DesignSystemSmallBadge(label: badge, color: color),
                  ],
                ),
                const SizedBox(height: 7),
                Text(
                  subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    height: 1.38,
                    color: designSystemMutedColor(context),
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
            color: designSystemMutedColor(context),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return DesignSystemGlassPanel(
      borderRadius: 26,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 14),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: designSystemMutedColor(context),
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _DesignSystemFooterCard extends StatelessWidget {
  const _DesignSystemFooterCard();

  @override
  Widget build(BuildContext context) {
    return DesignSystemGlassPanel(
      borderRadius: 30,
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: const Color(0xFF38BDF8).withValues(alpha: 0.12),
              border: Border.all(
                color: const Color(0xFF38BDF8).withValues(alpha: 0.28),
              ),
            ),
            child: const Icon(
              Icons.tips_and_updates_rounded,
              color: Color(0xFF38BDF8),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              'This page is separated from Auth widgets, so the Design System can grow independently.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                height: 1.42,
                color: designSystemMutedColor(context),
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

  const _SectionHeader({required this.title, required this.subtitle});

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
        const SizedBox(height: 6),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: designSystemMutedColor(context),
            height: 1.4,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class DesignSystemGlassPanel extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? borderColor;
  final List<BoxShadow>? boxShadow;

  const DesignSystemGlassPanel({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(20),
    this.borderRadius = 28,
    this.onTap,
    this.backgroundColor,
    this.borderColor,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final panel = ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 22, sigmaY: 22),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color:
                backgroundColor ??
                Colors.white.withValues(alpha: isDark ? 0.075 : 0.72),
            border: Border.all(
              color:
                  borderColor ??
                  Colors.white.withValues(alpha: isDark ? 0.12 : 0.86),
            ),
            boxShadow:
                boxShadow ??
                [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: isDark ? 0.34 : 0.08),
                    blurRadius: 34,
                    offset: const Offset(0, 18),
                  ),
                ],
          ),
          child: child,
        ),
      ),
    );

    if (onTap == null) return panel;

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius),
        child: panel,
      ),
    );
  }
}

class DesignSystemIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final double size;
  final double radius;

  const DesignSystemIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.size = 46,
    this.radius = 18,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Material(
          color: Colors.white.withValues(alpha: isDark ? 0.08 : 0.68),
          child: InkWell(
            onTap: onTap,
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                border: Border.all(
                  color: Colors.white.withValues(alpha: isDark ? 0.12 : 0.82),
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

class DesignSystemBadge extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;

  const DesignSystemBadge({
    super.key,
    required this.label,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 9),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withValues(alpha: 0.28)),
        boxShadow: [
          BoxShadow(color: color.withValues(alpha: 0.12), blurRadius: 20),
        ],
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

class DesignSystemSmallBadge extends StatelessWidget {
  final String label;
  final Color color;

  const DesignSystemSmallBadge({
    super.key,
    required this.label,
    required this.color,
  });

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

class DesignSystemBlurOrb extends StatelessWidget {
  final double size;
  final Color color;
  final double blur;

  const DesignSystemBlurOrb({
    super.key,
    required this.size,
    required this.color,
    this.blur = 58,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
      ),
    );
  }
}

Color designSystemMutedColor(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;

  return isDark
      ? Colors.white.withValues(alpha: 0.58)
      : Colors.black.withValues(alpha: 0.52);
}
