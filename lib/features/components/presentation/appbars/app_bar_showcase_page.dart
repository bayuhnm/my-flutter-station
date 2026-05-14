import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/glass_app_bar.dart';
import '../../../../core/widgets/glass_background.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/widgets/glass_pill.dart';


class AppBarShowcasePage extends StatelessWidget {
  const AppBarShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const GlassAppBar(title: 'AppBar Showcase'),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
          children: [
            const _HeaderCard(
              pill: 'HEADER SYSTEM',
              title: 'Glass AppBar & Headers',
              subtitle: 'Reusable header patterns for page title, search header, action header, and profile header.',
              icon: Icons.view_headline_rounded,
            ),
            const SizedBox(height: 16),
            _ShowcaseSection(
              icon: Icons.web_asset_rounded,
              title: 'Header Variants',
              subtitle: 'Preview app header components.',
              children: const [
                _HeaderPreview(title: 'Default Header', subtitle: 'Simple title and back button.', icon: Icons.arrow_back_rounded),
                SizedBox(height: 12),
                _HeaderPreview(title: 'Search Header', subtitle: 'Search action on the right.', icon: Icons.search_rounded),
                SizedBox(height: 12),
                _HeaderPreview(title: 'Notification Header', subtitle: 'Badge and activity action.', icon: Icons.notifications_rounded),
              ],
            ),
            const SizedBox(height: 16),
            const _LargePageHeader(),
          ],
        ),
      ),
    );
  }
}

class _HeaderPreview extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const _HeaderPreview({required this.title, required this.subtitle, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), color: Colors.white.withOpacity(0.06), border: Border.all(color: Colors.white.withOpacity(0.10))),
      child: Row(children: [
        Container(height: 44, width: 44, decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.white.withOpacity(0.09)), child: Icon(icon, color: const Color(0xFFAEC2FF))),
        const SizedBox(width: 14),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w900)),
          const SizedBox(height: 4),
          Text(subtitle, style: TextStyle(color: Colors.white.withOpacity(0.56), fontWeight: FontWeight.w600)),
        ])),
        const Icon(Icons.more_horiz_rounded),
      ]),
    );
  }
}

class _LargePageHeader extends StatelessWidget {
  const _LargePageHeader();

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      borderRadius: 32,
      padding: const EdgeInsets.all(22),
      gradientColors: [const Color(0xFFAEC2FF).withOpacity(0.18), Colors.white.withOpacity(0.06)],
      child: Row(children: [
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const GlassPill(text: 'PROFILE', icon: Icons.person_rounded),
          const SizedBox(height: 16),
          const Text('Welcome Back', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, letterSpacing: -0.6)),
          const SizedBox(height: 6),
          Text('Large header for dashboard and profile pages.', style: TextStyle(color: Colors.white.withOpacity(0.62), fontWeight: FontWeight.w600)),
        ])),
        Container(height: 70, width: 70, decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.10)), child: const Icon(Icons.auto_awesome_rounded, color: Color(0xFFAEC2FF), size: 34)),
      ]),
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
