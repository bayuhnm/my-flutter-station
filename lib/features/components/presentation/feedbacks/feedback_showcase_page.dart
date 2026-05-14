import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/glass_app_bar.dart';
import '../../../../core/widgets/glass_background.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/widgets/glass_pill.dart';


class FeedbackShowcasePage extends StatelessWidget {
  const FeedbackShowcasePage({super.key});

  void _showSnack(BuildContext context, String text, IconData icon) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: const Color(0xFF101827),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18), side: BorderSide(color: Colors.white.withOpacity(0.14))),
        content: Row(children: [Icon(icon, color: const Color(0xFFAEC2FF)), const SizedBox(width: 12), Expanded(child: Text(text))]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GlassBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const GlassAppBar(title: 'Feedback Showcase'),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
          children: [
            const _HeaderCard(
              pill: 'FEEDBACK SYSTEM',
              title: 'Toast, Snackbar & Alert',
              subtitle: 'Quick user feedback for success, error, warning, info, and inline validation messages.',
              icon: Icons.notifications_active_rounded,
            ),
            const SizedBox(height: 16),
            _ShowcaseSection(
              icon: Icons.campaign_rounded,
              title: 'Snackbars',
              subtitle: 'Tap to preview floating snackbars.',
              children: [
                _ActionTile(title: 'Success Snackbar', subtitle: 'Data saved successfully.', icon: Icons.check_circle_rounded, color: const Color(0xFF7CFFB2), onTap: () => _showSnack(context, 'Data saved successfully.', Icons.check_circle_rounded)),
                _ActionTile(title: 'Error Snackbar', subtitle: 'Failed to process request.', icon: Icons.error_rounded, color: const Color(0xFFFF8A8A), onTap: () => _showSnack(context, 'Failed to process request.', Icons.error_rounded)),
                _ActionTile(title: 'Warning Snackbar', subtitle: 'Please check your input.', icon: Icons.warning_rounded, color: const Color(0xFFFFD166), onTap: () => _showSnack(context, 'Please check your input.', Icons.warning_rounded)),
              ],
            ),
            const SizedBox(height: 16),
            _ShowcaseSection(
              icon: Icons.info_rounded,
              title: 'Inline Alerts',
              subtitle: 'Reusable alert blocks inside pages.',
              children: const [
                _InlineAlert(title: 'Success', message: 'Your profile has been updated.', icon: Icons.check_circle_rounded, color: Color(0xFF7CFFB2)),
                SizedBox(height: 12),
                _InlineAlert(title: 'Warning', message: 'Your session will expire soon.', icon: Icons.warning_rounded, color: Color(0xFFFFD166)),
                SizedBox(height: 12),
                _InlineAlert(title: 'Error', message: 'Connection failed. Try again later.', icon: Icons.error_rounded, color: Color(0xFFFF8A8A)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _InlineAlert extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;
  final Color color;

  const _InlineAlert({required this.title, required this.message, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: color.withOpacity(0.11),
        border: Border.all(color: color.withOpacity(0.28)),
      ),
      child: Row(children: [
        Icon(icon, color: color),
        const SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w900)),
          const SizedBox(height: 4),
          Text(message, style: TextStyle(color: Colors.white.withOpacity(0.62), fontWeight: FontWeight.w600)),
        ])),
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
