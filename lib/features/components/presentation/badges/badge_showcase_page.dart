import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/glass_app_bar.dart';
import '../../../../core/widgets/glass_background.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/widgets/glass_pill.dart';


class BadgeShowcasePage extends StatelessWidget {
  const BadgeShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    final statuses = [
      ('Completed', const Color(0xFF7CFFB2), Icons.check_circle_rounded),
      ('Pending', const Color(0xFFFFD166), Icons.schedule_rounded),
      ('Failed', const Color(0xFFFF8A8A), Icons.error_rounded),
      ('Processing', const Color(0xFFAEC2FF), Icons.sync_rounded),
    ];

    return GlassBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const GlassAppBar(title: 'Badge & Chip Showcase'),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
          children: [
            const _HeaderCard(
              pill: 'BADGE SYSTEM',
              title: 'Glass Badge & Chips',
              subtitle: 'Status badges, category chips, filter chips, and silver gradient tags.',
              icon: Icons.new_releases_rounded,
            ),
            const SizedBox(height: 16),
            _ShowcaseSection(
              icon: Icons.verified_rounded,
              title: 'Status Badges',
              subtitle: 'Use for transaction and account states.',
              children: [
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: statuses.map((e) => _StatusBadge(text: e.$1, color: e.$2, icon: e.$3)).toList(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _ShowcaseSection(
              icon: Icons.filter_alt_rounded,
              title: 'Filter Chips',
              subtitle: 'Selectable-looking categories.',
              children: [
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: const [
                    GlassPill(text: 'All', icon: Icons.auto_awesome_rounded),
                    GlassPill(text: 'Crypto'),
                    GlassPill(text: 'Stocks'),
                    GlassPill(text: 'News'),
                    GlassPill(text: 'Research'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            _ShowcaseSection(
              icon: Icons.diamond_rounded,
              title: 'Premium Tags',
              subtitle: 'Silver gradient text effect for modern labels.',
              children: const [
                _SilverTag(text: 'PREMIUM'),
                SizedBox(height: 12),
                _SilverTag(text: 'EXCLUSIVE RESEARCH'),
                SizedBox(height: 12),
                _SilverTag(text: 'EARLY ACCESS'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String text;
  final Color color;
  final IconData icon;

  const _StatusBadge({required this.text, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 9),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(99),
        color: color.withOpacity(0.12),
        border: Border.all(color: color.withOpacity(0.28)),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: 7),
        Text(text, style: const TextStyle(fontWeight: FontWeight.w900)),
      ]),
    );
  }
}

class _SilverTag extends StatelessWidget {
  final String text;

  const _SilverTag({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.black.withOpacity(0.38),
        border: Border.all(color: Colors.white.withOpacity(0.15)),
      ),
      child: ShaderMask(
        shaderCallback: (bounds) => const LinearGradient(
          colors: [Color(0xFFFFFFFF), Color(0xFFB8C0CC), Color(0xFFFFFFFF)],
        ).createShader(bounds),
        child: Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, letterSpacing: 1.1)),
      ),
    );
  }
}


class _HeaderCard extends StatelessWidget {
  final String pill;
  final String title;
  final String subtitle;
  final IconData icon;

  const _HeaderCard({
    required this.pill,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      borderRadius: 34,
      padding: const EdgeInsets.all(24),
      gradientColors: [
        Colors.white.withOpacity(0.22),
        const Color(0xFFAEC2FF).withOpacity(0.09),
        Colors.white.withOpacity(0.06),
      ],
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        GlassPill(text: pill, icon: icon),
        const SizedBox(height: 20),
        Text(title, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900, letterSpacing: -0.8)),
        const SizedBox(height: 8),
        Text(subtitle, style: TextStyle(height: 1.45, color: Colors.white.withOpacity(0.66), fontWeight: FontWeight.w600)),
      ]),
    );
  }
}

class _ShowcaseSection extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final List<Widget> children;

  const _ShowcaseSection({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      borderRadius: 32,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(icon: icon, title: title, subtitle: subtitle),
          const SizedBox(height: 18),
          ...children,
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _SectionTitle({required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        height: 44,
        width: 44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          color: Colors.white.withOpacity(0.12),
          border: Border.all(color: Colors.white.withOpacity(0.14)),
        ),
        child: Icon(icon, color: const Color(0xFFAEC2FF)),
      ),
      const SizedBox(width: 13),
      Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 17)),
          const SizedBox(height: 3),
          Text(subtitle, style: TextStyle(color: Colors.white.withOpacity(0.56), fontWeight: FontWeight.w600)),
        ]),
      ),
    ]);
  }
}

class _ActionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _ActionTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.white.withOpacity(0.06),
            border: Border.all(color: Colors.white.withOpacity(0.10)),
          ),
          child: Row(children: [
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(18), color: color.withOpacity(0.12), border: Border.all(color: color.withOpacity(0.24))),
              child: Icon(icon, color: color),
            ),
            const SizedBox(width: 14),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w900)),
              const SizedBox(height: 4),
              Text(subtitle, style: TextStyle(color: Colors.white.withOpacity(0.56), fontWeight: FontWeight.w600)),
            ])),
            const Icon(Icons.chevron_right_rounded),
          ]),
        ),
      ),
    );
  }
}
