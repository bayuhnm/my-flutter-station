import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/glass_app_bar.dart';
import '../../../../core/widgets/glass_background.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/widgets/glass_pill.dart';


class DialogShowcasePage extends StatelessWidget {
  const DialogShowcasePage({super.key});

  void _showGlassDialog(BuildContext context, _DialogType type) {
    final data = switch (type) {
      _DialogType.success => ('Success', 'Your data has been saved successfully.', Icons.check_circle_rounded, const Color(0xFF7CFFB2)),
      _DialogType.error => ('Something Went Wrong', 'Unable to process your request. Please try again.', Icons.error_rounded, const Color(0xFFFF8A8A)),
      _DialogType.warning => ('Are You Sure?', 'This action may affect your saved preferences.', Icons.warning_rounded, const Color(0xFFFFD166)),
      _DialogType.info => ('New Update', 'A new feature is available in your component library.', Icons.info_rounded, const Color(0xFFAEC2FF)),
    };

    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.62),
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 22),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: const Color(0xFF101827).withOpacity(0.78),
                border: Border.all(color: Colors.white.withOpacity(0.16)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 72,
                    width: 72,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: data.$4.withOpacity(0.16), border: Border.all(color: data.$4.withOpacity(0.34))),
                    child: Icon(data.$3, color: data.$4, size: 36),
                  ),
                  const SizedBox(height: 18),
                  Text(data.$1, textAlign: TextAlign.center, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
                  const SizedBox(height: 8),
                  Text(data.$2, textAlign: TextAlign.center, style: TextStyle(color: Colors.white.withOpacity(0.62), height: 1.45, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 22),
                  Row(
                    children: [
                      Expanded(child: _DialogButton(text: 'Cancel', onTap: () => Navigator.pop(context), outlined: true)),
                      const SizedBox(width: 12),
                      Expanded(child: _DialogButton(text: 'Continue', onTap: () => Navigator.pop(context))),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GlassBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const GlassAppBar(title: 'Dialog Showcase'),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
          children: [
            const _HeaderCard(
              pill: 'DIALOG SYSTEM',
              title: 'Glass Dialog Components',
              subtitle: 'Reusable modal dialogs for confirmation, warning, success, error, and information states.',
              icon: Icons.web_asset_rounded,
            ),
            const SizedBox(height: 16),
            _ShowcaseSection(
              icon: Icons.open_in_new_rounded,
              title: 'Dialog Variants',
              subtitle: 'Tap each item to preview modal style.',
              children: [
                _ActionTile(title: 'Success Dialog', subtitle: 'Confirmation after successful action.', icon: Icons.check_circle_rounded, color: const Color(0xFF7CFFB2), onTap: () => _showGlassDialog(context, _DialogType.success)),
                _ActionTile(title: 'Error Dialog', subtitle: 'Show failed action message.', icon: Icons.error_rounded, color: const Color(0xFFFF8A8A), onTap: () => _showGlassDialog(context, _DialogType.error)),
                _ActionTile(title: 'Warning Dialog', subtitle: 'Ask user before risky action.', icon: Icons.warning_rounded, color: const Color(0xFFFFD166), onTap: () => _showGlassDialog(context, _DialogType.warning)),
                _ActionTile(title: 'Info Dialog', subtitle: 'Show update or announcement.', icon: Icons.info_rounded, color: const Color(0xFFAEC2FF), onTap: () => _showGlassDialog(context, _DialogType.info)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

enum _DialogType { success, error, warning, info }

class _DialogButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool outlined;

  const _DialogButton({required this.text, required this.onTap, this.outlined = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: outlined ? Colors.white.withOpacity(0.04) : const Color(0xFFAEC2FF).withOpacity(0.18),
          border: Border.all(color: outlined ? Colors.white.withOpacity(0.14) : const Color(0xFFAEC2FF).withOpacity(0.38)),
        ),
        child: Text(text, style: const TextStyle(fontWeight: FontWeight.w900)),
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
