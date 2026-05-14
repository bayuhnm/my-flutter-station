import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/glass_app_bar.dart';
import '../../../../core/widgets/glass_background.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/widgets/glass_pill.dart';


class NavigationShowcasePage extends StatefulWidget {
  const NavigationShowcasePage({super.key});

  @override
  State<NavigationShowcasePage> createState() => _NavigationShowcasePageState();
}

class _NavigationShowcasePageState extends State<NavigationShowcasePage> {
  int tab = 0;
  int nav = 0;
  int step = 1;

  @override
  Widget build(BuildContext context) {
    return GlassBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const GlassAppBar(title: 'Navigation Showcase'),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 120),
          children: [
            const _HeaderCard(
              pill: 'NAVIGATION SYSTEM',
              title: 'Tabs, Stepper & NavBar',
              subtitle: 'Reusable navigation components for page tabs, segmented controls, steps, and bottom bar.',
              icon: Icons.alt_route_rounded,
            ),
            const SizedBox(height: 16),
            _ShowcaseSection(
              icon: Icons.tab_rounded,
              title: 'Segmented Tabs',
              subtitle: 'Glass style tab switcher.',
              children: [
                Row(
                  children: List.generate(3, (index) {
                    final labels = ['Overview', 'History', 'Settings'];
                    final active = tab == index;
                    return Expanded(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(18),
                        onTap: () => setState(() => tab = index),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 180),
                          margin: EdgeInsets.only(right: index == 2 ? 0 : 8),
                          height: 46,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: active ? const Color(0xFFAEC2FF).withOpacity(0.18) : Colors.white.withOpacity(0.05),
                            border: Border.all(color: active ? const Color(0xFFAEC2FF).withOpacity(0.36) : Colors.white.withOpacity(0.10)),
                          ),
                          child: Text(labels[index], style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 12)),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _ShowcaseSection(
              icon: Icons.timeline_rounded,
              title: 'Stepper',
              subtitle: 'Progress step indicator.',
              children: [
                Row(
                  children: List.generate(4, (index) {
                    final active = index <= step;
                    return Expanded(
                      child: Row(children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 180),
                          height: 34,
                          width: 34,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(shape: BoxShape.circle, color: active ? const Color(0xFFAEC2FF).withOpacity(0.24) : Colors.white.withOpacity(0.06), border: Border.all(color: active ? const Color(0xFFAEC2FF) : Colors.white.withOpacity(0.14))),
                          child: Text('${index + 1}', style: const TextStyle(fontWeight: FontWeight.w900)),
                        ),
                        if (index != 3) Expanded(child: Container(height: 2, margin: const EdgeInsets.symmetric(horizontal: 8), color: active ? const Color(0xFFAEC2FF).withOpacity(0.55) : Colors.white.withOpacity(0.10))),
                      ]),
                    );
                  }),
                ),
                const SizedBox(height: 18),
                AppButton(text: 'Next Step', icon: Icons.arrow_forward_rounded, onPressed: () => setState(() => step = step == 3 ? 0 : step + 1)),
              ],
            ),
          ],
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 22),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: const Color(0xFF101827).withOpacity(0.76),
            border: Border.all(color: Colors.white.withOpacity(0.14)),
          ),
          child: Row(
            children: List.generate(4, (index) {
              final icons = [Icons.home_rounded, Icons.bar_chart_rounded, Icons.wallet_rounded, Icons.person_rounded];
              final active = nav == index;
              return Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.circular(22),
                  onTap: () => setState(() => nav = index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    height: 52,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(22), color: active ? Colors.white.withOpacity(0.11) : Colors.transparent),
                    child: Icon(icons[index], color: active ? const Color(0xFFAEC2FF) : Colors.white.withOpacity(0.52)),
                  ),
                ),
              );
            }),
          ),
        ),
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
