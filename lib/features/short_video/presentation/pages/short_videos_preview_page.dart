import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../app/router/route_names.dart';
import '../../../../core/widgets/app_background.dart';
import '../widgets/short_video_glass_widget.dart';

class ShortVideosPreviewPage extends StatelessWidget {
  const ShortVideosPreviewPage({super.key});

  static const _blue = Color(0xFF38BDF8);
  static const _gold = Color(0xFFF8D66D);
  static const _green = Color(0xFF22C55E);
  static const _purple = Color(0xFF8B5CF6);
  static const _dark = Color(0xFF020617);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? _dark
          : const Color(0xFFF6F9FF),
      body: AppBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(22, 18, 22, 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _Header(onBack: () => Navigator.pop(context)),
                const SizedBox(height: 28),
                const _HeroCard(),
                const SizedBox(height: 28),
                Text(
                  'Player Options',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Test several video player approaches for Android and iOS compatibility.',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: shortVideoMutedColor(context),
                    height: 1.4,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 14),
                _OptionTile(
                  title: 'Pure video_player',
                  subtitle:
                      'Best for full custom UI. Recommended for TikTok/Reels style unlimited vertical scroll.',
                  packageName: 'video_player',
                  icon: Icons.play_circle_fill_rounded,
                  color: _blue,
                  badge: 'Core',
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteNames.shortVideosPurePlayer,
                    );
                  },
                ),
                const SizedBox(height: 14),
                _OptionTile(
                  title: 'video_player + visibility_detector',
                  subtitle:
                      'Auto play visible item and pause invisible item. Good for feed performance testing.',
                  packageName: 'video_player + visibility_detector',
                  icon: Icons.visibility_rounded,
                  color: _green,
                  badge: 'Auto',
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteNames.shortVideosVisibilityPlayer,
                    );
                  },
                ),
                const SizedBox(height: 14),
                _OptionTile(
                  title: 'Chewie Player',
                  subtitle:
                      'Uses video_player under the hood and adds ready-made Material/Cupertino controls.',
                  packageName: 'chewie + video_player',
                  icon: Icons.smart_display_rounded,
                  color: _purple,
                  badge: 'Controls',
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteNames.shortVideosChewiePlayer,
                    );
                  },
                ),
                const SizedBox(height: 24),
                const _CompatibilityCard(),
              ],
            ),
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
        ShortVideoGlassIconButton(
          icon: Icons.arrow_back_rounded,
          onTap: onBack,
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
                  'Short Videos Player',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.6,
                  ),
                ),
              ),
              const SizedBox(height: 3),
              Text(
                'Luxury reels player implementation options',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: shortVideoMutedColor(context),
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

  @override
  Widget build(BuildContext context) {
    return ShortVideoGlassPanel(
      padding: EdgeInsets.zero,
      borderRadius: 36,
      child: Stack(
        children: [
          Positioned(
            top: -90,
            right: -80,
            child: ShortVideoBlurOrb(
              size: 230,
              color: _gold.withValues(alpha: 0.22),
            ),
          ),
          Positioned(
            bottom: -110,
            left: -90,
            child: ShortVideoBlurOrb(
              size: 230,
              color: _blue.withValues(alpha: 0.24),
            ),
          ),
          Positioned(
            right: 18,
            bottom: 18,
            child: Icon(
              Icons.video_collection_rounded,
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
                const ShortVideoBadge(
                  label: 'Reels Design System',
                  icon: Icons.auto_awesome_rounded,
                  color: _gold,
                ),
                const SizedBox(height: 24),
                Text(
                  'Short videos\nwith luxury UI.',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w900,
                    height: 0.98,
                    letterSpacing: -1.4,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  'Several implementation options for vertical short videos, reels, auto play, like, comment, share and compatibility testing.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    height: 1.55,
                    color: shortVideoMutedColor(context),
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

class _OptionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String packageName;
  final IconData icon;
  final Color color;
  final String badge;
  final VoidCallback onTap;

  const _OptionTile({
    required this.title,
    required this.subtitle,
    required this.packageName,
    required this.icon,
    required this.color,
    required this.badge,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ShortVideoGlassPanel(
      onTap: onTap,
      borderRadius: 30,
      padding: const EdgeInsets.all(18),
      child: Row(
        children: [
          Container(
            width: 62,
            height: 62,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(23),
              gradient: LinearGradient(
                colors: [
                  color.withValues(alpha: 0.3),
                  color.withValues(alpha: 0.08),
                ],
              ),
              border: Border.all(color: color.withValues(alpha: 0.34)),
              boxShadow: [
                BoxShadow(
                  color: color.withValues(alpha: 0.22),
                  blurRadius: 26,
                  offset: const Offset(0, 14),
                ),
              ],
            ),
            child: Icon(icon, color: color, size: 31),
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
                    ShortVideoBadge(
                      label: badge,
                      icon: Icons.bolt_rounded,
                      color: color,
                    ),
                  ],
                ),
                const SizedBox(height: 7),
                Text(
                  subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    height: 1.38,
                    color: shortVideoMutedColor(context),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  packageName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: color,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16,
            color: shortVideoMutedColor(context),
          ),
        ],
      ),
    );
  }
}

class _CompatibilityCard extends StatelessWidget {
  const _CompatibilityCard();

  @override
  Widget build(BuildContext context) {
    return ShortVideoGlassPanel(
      borderRadius: 30,
      child: Row(
        children: [
          const Icon(
            Icons.phone_android_rounded,
            color: Color(0xFF38BDF8),
            size: 30,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              'Use HTTPS video URLs, test on physical Android/iOS devices, and dispose controllers properly to avoid memory leaks in long reels feed.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                height: 1.42,
                color: shortVideoMutedColor(context),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
