import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/widgets/app_background.dart';
import '../widgets/button_widgets.dart';

class ButtonAnimatedPreviewPage extends StatefulWidget {
  const ButtonAnimatedPreviewPage({super.key});

  @override
  State<ButtonAnimatedPreviewPage> createState() =>
      _ButtonAnimatedPreviewPageState();
}

class _ButtonAnimatedPreviewPageState extends State<ButtonAnimatedPreviewPage> {
  static const _blue = Color(0xFF38BDF8);
  static const _gold = Color(0xFFF8D66D);
  static const _purple = Color(0xFF8B5CF6);
  static const _green = Color(0xFF22C55E);
  static const _red = Color(0xFFFB7185);
  static const _dark = Color(0xFF020617);

  bool _isLoading = false;

  Future<void> _simulateLoading() async {
    if (_isLoading) return;

    setState(() => _isLoading = true);

    await Future.delayed(const Duration(milliseconds: 1600));

    if (!mounted) return;
    setState(() => _isLoading = false);
  }

  void _onPreviewTap() {
    log("Button clicked");
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: const Text('Button clicked'),
    //     behavior: SnackBarBehavior.floating,
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    //   ),
    // );
  }

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
                    _Header(onBack: () => Navigator.pop(context)),

                    const SizedBox(height: 28),

                    const _HeroCard(),

                    const SizedBox(height: 28),

                    const _SectionTitle(
                      title: 'Primary Buttons',
                      subtitle:
                          'Premium buttons for main actions, CTA, wallet connect, and continue flow.',
                    ),

                    const SizedBox(height: 14),

                    _PreviewBlock(
                      title: 'Luxury Gradient Button',
                      badge: 'Primary',
                      color: _blue,
                      child: LuxuryGradientButton(
                        label: 'Start Premium Flow',
                        icon: Icons.arrow_forward_rounded,
                        onPressed: _onPreviewTap,
                      ),
                    ),

                    const SizedBox(height: 14),

                    _PreviewBlock(
                      title: 'Luxury Glass Button',
                      badge: 'Glass',
                      color: _gold,
                      child: LuxuryGlassButton(
                        label: 'Open Design Library',
                        icon: Icons.auto_awesome_rounded,
                        accentColor: _gold,
                        onPressed: _onPreviewTap,
                      ),
                    ),

                    const SizedBox(height: 14),

                    _PreviewBlock(
                      title: 'Neon Pulse Button',
                      badge: 'Neon',
                      color: _blue,
                      child: NeonPulseButton(
                        label: 'Authorize Wallet',
                        icon: Icons.security_rounded,
                        color: _blue,
                        onPressed: _onPreviewTap,
                      ),
                    ),

                    const SizedBox(height: 14),

                    _PreviewBlock(
                      title: 'Shimmer Button',
                      badge: 'Shimmer',
                      color: _gold,
                      child: ShimmerButton(
                        label: 'Claim Premium Reward',
                        icon: Icons.diamond_rounded,
                        onPressed: _onPreviewTap,
                      ),
                    ),

                    const SizedBox(height: 28),

                    const _SectionTitle(
                      title: 'Motion Buttons',
                      subtitle:
                          'Buttons with micro-interaction for hover, press, loading, floating and border animation.',
                    ),

                    const SizedBox(height: 14),

                    _PreviewBlock(
                      title: 'Border Sweep Button',
                      badge: 'Border',
                      color: _purple,
                      child: BorderSweepButton(
                        label: 'Scan Market Signal',
                        icon: Icons.radar_rounded,
                        color: _purple,
                        onPressed: _onPreviewTap,
                      ),
                    ),

                    const SizedBox(height: 14),

                    _PreviewBlock(
                      title: 'Liquid Fill Button',
                      badge: 'Liquid',
                      color: _green,
                      child: LiquidFillButton(
                        label: 'Activate Strategy',
                        icon: Icons.play_arrow_rounded,
                        color: _green,
                        onPressed: _onPreviewTap,
                      ),
                    ),

                    const SizedBox(height: 14),

                    _PreviewBlock(
                      title: 'Scale Press Button',
                      badge: 'Press',
                      color: _blue,
                      child: ScalePressButton(
                        label: 'Tap Interaction',
                        icon: Icons.touch_app_rounded,
                        color: _blue,
                        onPressed: _onPreviewTap,
                      ),
                    ),

                    const SizedBox(height: 14),

                    _PreviewBlock(
                      title: 'Icon Slide Button',
                      badge: 'Slide',
                      color: _gold,
                      child: IconSlideButton(
                        label: 'Explore Components',
                        icon: Icons.arrow_forward_rounded,
                        color: _gold,
                        onPressed: _onPreviewTap,
                      ),
                    ),

                    const SizedBox(height: 14),

                    _PreviewBlock(
                      title: 'Floating Glow Button',
                      badge: 'Float',
                      color: _purple,
                      child: FloatingGlowButton(
                        label: 'Launch Showcase',
                        icon: Icons.rocket_launch_rounded,
                        color: _purple,
                        onPressed: _onPreviewTap,
                      ),
                    ),

                    const SizedBox(height: 28),

                    const _SectionTitle(
                      title: 'State Buttons',
                      subtitle:
                          'Loading, success, danger, and disabled button state examples.',
                    ),

                    const SizedBox(height: 14),

                    _PreviewBlock(
                      title: 'Loading Morph Button',
                      badge: 'Loading',
                      color: _blue,
                      child: Align(
                        alignment: Alignment.center,
                        child: LoadingMorphButton(
                          idleLabel: 'Submit Transaction',
                          loadingLabel: 'Processing',
                          icon: Icons.send_rounded,
                          isLoading: _isLoading,
                          onPressed: _simulateLoading,
                          color: _blue,
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    _PreviewBlock(
                      title: 'Success & Danger Buttons',
                      badge: 'Status',
                      color: _green,
                      child: Row(
                        children: [
                          Expanded(
                            child: StatusButton(
                              label: 'Approve',
                              icon: Icons.check_circle_rounded,
                              color: _green,
                              onPressed: _onPreviewTap,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: StatusButton(
                              label: 'Reject',
                              icon: Icons.cancel_rounded,
                              color: _red,
                              onPressed: _onPreviewTap,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 14),

                    const _PreviewBlock(
                      title: 'Disabled Button',
                      badge: 'Disabled',
                      color: _red,
                      child: LuxuryGradientButton(
                        label: 'Disabled Action',
                        icon: Icons.lock_rounded,
                        onPressed: null,
                      ),
                    ),

                    const SizedBox(height: 24),

                    const _FooterCard(),
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

class _Header extends StatelessWidget {
  final VoidCallback onBack;

  const _Header({required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _GlassIconButton(icon: Icons.arrow_back_rounded, onTap: onBack),
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
                  'Button Showcase',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.6,
                  ),
                ),
              ),
              const SizedBox(height: 3),
              Text(
                'Animated premium button components',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: _mutedColor(context),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard();

  static const _blue = Color(0xFF38BDF8);
  static const _gold = Color(0xFFF8D66D);
  static const _purple = Color(0xFF8B5CF6);

  @override
  Widget build(BuildContext context) {
    return _GlassPanel(
      padding: EdgeInsets.zero,
      borderRadius: 36,
      child: Stack(
        children: [
          Positioned(
            top: -90,
            right: -80,
            child: _BlurOrb(size: 230, color: _gold.withValues(alpha: 0.23)),
          ),
          Positioned(
            bottom: -110,
            left: -90,
            child: _BlurOrb(size: 230, color: _blue.withValues(alpha: 0.24)),
          ),
          Positioned(
            right: 18,
            bottom: 18,
            child: Icon(
              Icons.smart_button_rounded,
              size: 110,
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
                const _Badge(
                  label: 'Button Motion System',
                  icon: Icons.auto_awesome_rounded,
                  color: _gold,
                ),
                const SizedBox(height: 24),
                Text(
                  'Reusable\nanimated buttons.',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w900,
                    height: 0.98,
                    letterSpacing: -1.4,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  'A premium button library for crypto, fintech, dashboard, marketplace, onboarding, and design preview pages.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    height: 1.55,
                    color: _mutedColor(context),
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

class _PreviewBlock extends StatelessWidget {
  final String title;
  final String badge;
  final Color color;
  final Widget child;

  const _PreviewBlock({
    required this.title,
    required this.badge,
    required this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return _GlassPanel(
      borderRadius: 30,
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _SmallBadge(label: badge, color: color),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: _mutedColor(context),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          child,
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
        const SizedBox(height: 6),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: _mutedColor(context),
            height: 1.4,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _FooterCard extends StatelessWidget {
  const _FooterCard();

  @override
  Widget build(BuildContext context) {
    return _GlassPanel(
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
              'All buttons are reusable widgets. You can use them across auth, dashboard, portfolio, market, form, and transaction pages.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                height: 1.42,
                color: _mutedColor(context),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MiniCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _MiniCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return _GlassPanel(
      borderRadius: 24,
      padding: const EdgeInsets.all(15),
      backgroundColor: Colors.white.withValues(
        alpha: Theme.of(context).brightness == Brightness.dark ? 0.06 : 0.5,
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 23),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: _mutedColor(context),
                    fontWeight: FontWeight.w700,
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

class _GlassPanel extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final Color? backgroundColor;
  final VoidCallback? onTap;

  const _GlassPanel({
    required this.child,
    this.padding = const EdgeInsets.all(20),
    this.borderRadius = 28,
    this.backgroundColor,
    this.onTap,
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
              color: Colors.white.withValues(alpha: isDark ? 0.12 : 0.86),
            ),
            boxShadow: [
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
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Material(
          color: Colors.white.withValues(alpha: isDark ? 0.08 : 0.68),
          child: InkWell(
            onTap: onTap,
            child: Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
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

class _Badge extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;

  const _Badge({required this.label, required this.icon, required this.color});

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

class _SmallBadge extends StatelessWidget {
  final String label;
  final Color color;

  const _SmallBadge({required this.label, required this.color});

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

class _BlurOrb extends StatelessWidget {
  final double size;
  final Color color;

  const _BlurOrb({required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 58, sigmaY: 58),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
      ),
    );
  }
}

Color _mutedColor(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;

  return isDark
      ? Colors.white.withValues(alpha: 0.58)
      : Colors.black.withValues(alpha: 0.52);
}
