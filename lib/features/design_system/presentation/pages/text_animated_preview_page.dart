import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_flutter_station/features/auth/presentation/widgets/auth_premium_widget.dart';

import '../../../../core/widgets/app_background.dart';
import '../widgets/text_widgets.dart';

class TextAnimatedPreviewPage extends StatelessWidget {
  const TextAnimatedPreviewPage({super.key});

  static const _blue = Color(0xFF38BDF8);
  static const _gold = Color(0xFFF8D66D);
  static const _purple = Color(0xFF8B5CF6);
  static const _green = Color(0xFF22C55E);
  static const _red = Color(0xFFFB7185);
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
                    Row(
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
                                'Text Showcase',
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: -0.5,
                                    ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                'All style text & animated text',
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(
                                      color: authMutedColor(context),
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 28),

                    GlassPanel(
                      padding: EdgeInsets.zero,
                      borderRadius: 34,
                      child: Stack(
                        children: [
                          Positioned(
                            top: -80,
                            right: -70,
                            child: BlurGlow(
                              size: 210,
                              color: _blue.withValues(alpha: 0.3),
                            ),
                          ),
                          Positioned(
                            bottom: -90,
                            left: -80,
                            child: BlurGlow(
                              size: 210,
                              color: _purple.withValues(alpha: 0.2),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const PillBadge(
                                  label: 'Typography Motion',
                                  icon: Icons.motion_photos_auto_rounded,
                                  color: _gold,
                                ),
                                const SizedBox(height: 22),
                                const GradientText(
                                  'Luxury\nAnimated Text',
                                  gradient: LinearGradient(
                                    colors: [_gold, _blue, _purple],
                                  ),
                                  style: TextStyle(
                                    fontSize: 42,
                                    height: 0.98,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: -1.4,
                                  ),
                                ),
                                const SizedBox(height: 14),
                                Text(
                                  'Preview typography untuk heading, body, gradient text, neon text, market ticker, typewriter, fade, slide, dan glow animation.',
                                  style: Theme.of(context).textTheme.bodyMedium
                                      ?.copyWith(
                                        height: 1.55,
                                        color: authMutedColor(context),
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 26),
                    _SectionTitle(
                      title: 'Static Text Styles',
                      subtitle:
                          'Reusable style untuk title, subtitle, label, dan crypto market text.',
                    ),
                    const SizedBox(height: 14),

                    _PreviewBlock(
                      title: 'Display Heading',
                      badge: 'Hero',
                      color: _gold,
                      child: Text(
                        'Crypto Station',
                        style: Theme.of(context).textTheme.displaySmall
                            ?.copyWith(
                              fontWeight: FontWeight.w900,
                              height: 0.98,
                              letterSpacing: -1.3,
                            ),
                      ),
                    ),

                    const SizedBox(height: 14),
                    const _PreviewBlock(
                      title: 'Gradient Text',
                      badge: 'Premium',
                      color: _blue,
                      child: GradientText(
                        'Portfolio Growth +42.8%',
                        gradient: LinearGradient(colors: [_blue, _green]),
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -0.8,
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),
                    const _PreviewBlock(
                      title: 'Luxury Gold Text',
                      badge: 'Gold',
                      color: _gold,
                      child: GradientText(
                        'Diamond Tier Member',
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFF8D66D),
                            Color(0xFFFFF4B8),
                            Color(0xFFD6A93B),
                          ],
                        ),
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),
                    _PreviewBlock(
                      title: 'Market Text',
                      badge: 'Ticker',
                      color: _green,
                      child: Row(
                        children: [
                          Text(
                            'BTC/USDT',
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(fontWeight: FontWeight.w900),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            '+12.48%',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  color: _green,
                                  fontWeight: FontWeight.w900,
                                ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 26),
                    _SectionTitle(
                      title: 'Animated Text Styles',
                      subtitle:
                          'Animation tanpa package tambahan. Semua pure Flutter.',
                    ),

                    const SizedBox(height: 14),
                    _PreviewBlock(
                      title: 'Fade Switch Text',
                      badge: 'Fade',
                      color: _purple,
                      child: RotatingFadeText(
                        texts: const [
                          'Luxury UI System',
                          'Clean Architecture',
                          'Reusable Bloc State',
                          'Premium Crypto Theme',
                        ],
                        textStyle: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              fontWeight: FontWeight.w900,
                              letterSpacing: -0.6,
                            ),
                      ),
                    ),

                    const SizedBox(height: 14),
                    _PreviewBlock(
                      title: 'Slide Up Text',
                      badge: 'Slide',
                      color: _green,
                      child: SlideUpRepeatingText(
                        texts: const [
                          'Design System Ready',
                          'Animated Text Ready',
                          'Next: Buttons & Badges',
                        ],
                        textStyle: Theme.of(context).textTheme.titleLarge
                            ?.copyWith(fontWeight: FontWeight.w900),
                      ),
                    ),

                    const SizedBox(height: 14),
                    const _PreviewBlock(
                      title: 'Neon Pulse Text',
                      badge: 'Glow',
                      color: _blue,
                      child: NeonPulseText(
                        text: 'NEON ACCESS',
                        color: _blue,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.8,
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),
                    _PreviewBlock(
                      title: 'Price Pulse Text',
                      badge: 'Market',
                      color: _green,
                      child: Row(
                        children: [
                          Text(
                            '\$68,420.90',
                            style: Theme.of(context).textTheme.headlineSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: -0.8,
                                ),
                          ),
                          const SizedBox(width: 12),
                          const PricePulseBadge(text: '+4.28%', color: _green),
                        ],
                      ),
                    ),

                    const SizedBox(height: 14),
                    const _PreviewBlock(
                      title: 'Risk Alert Text',
                      badge: 'Alert',
                      color: _red,
                      child: NeonPulseText(
                        text: 'Liquidation Risk Warning',
                        color: _red,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),

                    const SizedBox(height: 26),
                    _SectionTitle(
                      title: 'Advanced Motion Text',
                      subtitle:
                          'Running text, market ticker, counter, wave, flip, reveal, dan gradient pulse.',
                    ),
                    const SizedBox(height: 14),

                    const _PreviewBlock(
                      title: 'Running Text / Marquee',
                      badge: 'Running',
                      color: _blue,
                      child: RunningText(
                        text:
                            'BTC +4.28%   ETH +2.19%   SOL +8.42%   BNB +1.74%   XRP +3.08%   DOGE +5.12%',
                        duration: Duration(seconds: 9),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -0.2,
                          color: _blue,
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),
                    _PreviewBlock(
                      title: 'Vertical Market Ticker',
                      badge: 'Ticker',
                      color: _green,
                      child: VerticalTickerText(
                        texts: const [
                          'BTC/USDT  \$68,420.90  +4.28%',
                          'ETH/USDT  \$3,240.10  +2.19%',
                          'SOL/USDT  \$178.40  +8.42%',
                          'BNB/USDT  \$612.80  +1.74%',
                        ],
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: _green,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -0.4,
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),
                    _PreviewBlock(
                      title: 'Animated Counter Number',
                      badge: 'Counter',
                      color: _gold,
                      child: AnimatedCounterText(
                        value: 42891892173.20,
                        prefix: '\$',
                        decimalDigits: 2,
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w900,
                              letterSpacing: -1,
                              color: _gold,
                            ),
                      ),
                    ),

                    const SizedBox(height: 14),
                    const _PreviewBlock(
                      title: 'Wave Text',
                      badge: 'Wave',
                      color: _purple,
                      child: WaveText(
                        text: 'WAVE MOTION',
                        color: _purple,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),
                    _FlipPreviewBlock(),

                    const SizedBox(height: 14),
                    const _PreviewBlock(
                      title: 'Reveal Text',
                      badge: 'Reveal',
                      color: _blue,
                      child: RevealText(
                        text: 'Premium UI Revealed',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -0.5,
                          color: _blue,
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),
                    const _PreviewBlock(
                      title: 'Shimmer Scan Text',
                      badge: 'Shimmer',
                      color: _gold,
                      child: ShimmerText(
                        text: 'Premium Station',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -0.8,
                        ),
                        baseColor: Color(0xFFF8D66D),
                        highlightColor: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 14),
                    const _PreviewBlock(
                      title: 'Typewriter Text',
                      badge: 'Typing',
                      color: _blue,
                      child: TypewriterText(
                        text: 'Build premium Flutter apps faster.',
                        textStyle: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          height: 1.25,
                        ),
                      ),
                    ),
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
    return GlassPanel(
      borderRadius: 28,
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SmallBadge(label: badge, color: color),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: authMutedColor(context),
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
            color: authMutedColor(context),
            height: 1.4,
          ),
        ),
      ],
    );
  }
}

class _FlipPreviewBlock extends StatelessWidget {
  const _FlipPreviewBlock();

  @override
  Widget build(BuildContext context) {
    return _PreviewBlock(
      title: 'Flip Text',
      badge: 'Flip',
      color: TextAnimatedPreviewPage._green,
      child: FlipText(
        texts: const ['Luxury', 'Modern', 'Glass', 'Crypto'],
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          color: TextAnimatedPreviewPage._green,
          fontWeight: FontWeight.w900,
          letterSpacing: -0.8,
        ),
      ),
    );
  }
}
