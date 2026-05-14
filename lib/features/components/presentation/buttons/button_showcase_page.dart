import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/glass_app_bar.dart';
import '../../../../core/widgets/glass_background.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/widgets/glass_pill.dart';


class ButtonShowcasePage extends StatefulWidget {
  const ButtonShowcasePage({super.key});

  @override
  State<ButtonShowcasePage> createState() => _ButtonShowcasePageState();
}

class _ButtonShowcasePageState extends State<ButtonShowcasePage> {
  bool isLoading = false;

  Future<void> _simulateLoading() async {
    setState(() => isLoading = true);
    await Future.delayed(const Duration(milliseconds: 900));
    if (mounted) setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return GlassBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const GlassAppBar(title: 'Button Showcase'),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
          children: [
            const _HeaderCard(
              pill: 'BUTTON SYSTEM',
              title: 'Glass Button Components',
              subtitle: 'Primary actions, secondary actions, outline buttons, icon buttons, and button states.',
              icon: Icons.smart_button_rounded,
            ),
            const SizedBox(height: 16),
            _ShowcaseSection(
              icon: Icons.touch_app_rounded,
              title: 'Action Buttons',
              subtitle: 'Common CTA styles for every screen.',
              children: [
                AppButton(text: 'Primary Button', icon: Icons.flash_on_rounded, onPressed: () {}),
                const SizedBox(height: 12),
                _GlassButton(text: 'Secondary Button', icon: Icons.auto_awesome_rounded, variant: _ButtonVariant.secondary, onTap: () {}),
                const SizedBox(height: 12),
                _GlassButton(text: 'Outline Button', icon: Icons.layers_rounded, variant: _ButtonVariant.outline, onTap: () {}),
                const SizedBox(height: 12),
                _GlassButton(text: 'Ghost Button', icon: Icons.blur_on_rounded, variant: _ButtonVariant.ghost, onTap: () {}),
              ],
            ),
            const SizedBox(height: 16),
            _ShowcaseSection(
              icon: Icons.motion_photos_on_rounded,
              title: 'Button States',
              subtitle: 'Loading, disabled, success, and danger styles.',
              children: [
                _GlassButton(
                  text: isLoading ? 'Processing...' : 'Tap Loading Button',
                  icon: Icons.sync_rounded,
                  isLoading: isLoading,
                  onTap: isLoading ? null : _simulateLoading,
                ),
                const SizedBox(height: 12),
                const _GlassButton(text: 'Disabled Button', icon: Icons.lock_rounded, onTap: null),
                const SizedBox(height: 12),
                _GlassButton(text: 'Success Button', icon: Icons.check_circle_rounded, variant: _ButtonVariant.success, onTap: () {}),
                const SizedBox(height: 12),
                _GlassButton(text: 'Danger Button', icon: Icons.delete_rounded, variant: _ButtonVariant.danger, onTap: () {}),
              ],
            ),
            const SizedBox(height: 16),
            _ShowcaseSection(
              icon: Icons.widgets_rounded,
              title: 'Icon Buttons',
              subtitle: 'Round buttons for compact actions.',
              children: [
                Row(
                  children: [
                    _RoundIconButton(icon: Icons.favorite_rounded, onTap: () {}),
                    const SizedBox(width: 12),
                    _RoundIconButton(icon: Icons.share_rounded, onTap: () {}),
                    const SizedBox(width: 12),
                    _RoundIconButton(icon: Icons.bookmark_rounded, onTap: () {}),
                    const SizedBox(width: 12),
                    _RoundIconButton(icon: Icons.more_horiz_rounded, onTap: () {}),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

enum _ButtonVariant { primary, secondary, outline, ghost, success, danger }

class _GlassButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback? onTap;
  final _ButtonVariant variant;
  final bool isLoading;

  const _GlassButton({
    required this.text,
    required this.icon,
    required this.onTap,
    this.variant = _ButtonVariant.primary,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final disabled = onTap == null;
    final Color accent = switch (variant) {
      _ButtonVariant.success => const Color(0xFF7CFFB2),
      _ButtonVariant.danger => const Color(0xFFFF8A8A),
      _ => const Color(0xFFAEC2FF),
    };

    final bgOpacity = switch (variant) {
      _ButtonVariant.primary => 0.20,
      _ButtonVariant.secondary => 0.12,
      _ButtonVariant.outline => 0.04,
      _ButtonVariant.ghost => 0.00,
      _ButtonVariant.success => 0.16,
      _ButtonVariant.danger => 0.16,
    };

    return Opacity(
      opacity: disabled ? 0.46 : 1,
      child: InkWell(
        onTap: disabled || isLoading ? null : onTap,
        borderRadius: BorderRadius.circular(22),
        child: Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: variant == _ButtonVariant.ghost ? Colors.transparent : accent.withOpacity(bgOpacity),
            border: Border.all(color: accent.withOpacity(variant == _ButtonVariant.outline ? 0.58 : 0.22)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isLoading)
                const SizedBox(height: 18, width: 18, child: CircularProgressIndicator(strokeWidth: 2))
              else
                Icon(icon, size: 20, color: accent),
              const SizedBox(width: 10),
              Text(text, style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white.withOpacity(0.94))),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _RoundIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        height: 52,
        width: 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white.withOpacity(0.09),
          border: Border.all(color: Colors.white.withOpacity(0.14)),
        ),
        child: Icon(icon, color: const Color(0xFFAEC2FF)),
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
