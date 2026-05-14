import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/glass_app_bar.dart';
import '../../../../core/widgets/glass_background.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/widgets/glass_pill.dart';


class LayoutShowcasePage extends StatelessWidget {
  const LayoutShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const GlassAppBar(title: 'Layout Showcase'),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
          children: [
            const _HeaderCard(
              pill: 'LAYOUT SYSTEM',
              title: 'Glass Layout Blocks',
              subtitle: 'Page wrappers, section headers, grid sections, responsive containers, and content blocks.',
              icon: Icons.auto_awesome_mosaic_rounded,
            ),
            const SizedBox(height: 16),
            _ShowcaseSection(
              icon: Icons.format_align_left_rounded,
              title: 'Section Header',
              subtitle: 'Use before a group of cards or list.',
              children: const [
                _SectionHeaderPreview(title: 'Market Overview', actionText: 'See All'),
                SizedBox(height: 12),
                _SectionHeaderPreview(title: 'Latest Transactions', actionText: 'History'),
              ],
            ),
            const SizedBox(height: 16),
            _ShowcaseSection(
              icon: Icons.grid_view_rounded,
              title: 'Grid Layout',
              subtitle: 'Two-column responsive blocks.',
              children: [
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.08,
                  children: const [
                    _MiniLayoutCard(icon: Icons.account_balance_wallet_rounded, label: 'Wallet'),
                    _MiniLayoutCard(icon: Icons.swap_horiz_rounded, label: 'Exchange'),
                    _MiniLayoutCard(icon: Icons.insights_rounded, label: 'Analytics'),
                    _MiniLayoutCard(icon: Icons.settings_rounded, label: 'Settings'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            _ShowcaseSection(
              icon: Icons.article_rounded,
              title: 'Content Block',
              subtitle: 'Reusable readable glass container.',
              children: [
                Text(
                  'This block can be reused for article content, page descriptions, onboarding copy, help center content, and policy pages.',
                  style: TextStyle(color: Colors.white.withOpacity(0.66), height: 1.55, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionHeaderPreview extends StatelessWidget {
  final String title;
  final String actionText;

  const _SectionHeaderPreview({required this.title, required this.actionText});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900))),
      Text(actionText, style: const TextStyle(color: Color(0xFFAEC2FF), fontWeight: FontWeight.w900)),
      const SizedBox(width: 4),
      const Icon(Icons.chevron_right_rounded, color: Color(0xFFAEC2FF)),
    ]);
  }
}

class _MiniLayoutCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const _MiniLayoutCard({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(26), color: Colors.white.withOpacity(0.06), border: Border.all(color: Colors.white.withOpacity(0.10))),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(icon, color: const Color(0xFFAEC2FF), size: 32),
        const SizedBox(height: 12),
        Text(label, style: const TextStyle(fontWeight: FontWeight.w900)),
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
