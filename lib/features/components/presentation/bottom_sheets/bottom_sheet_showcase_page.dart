import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/glass_app_bar.dart';
import '../../../../core/widgets/glass_background.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/widgets/glass_pill.dart';


class BottomSheetShowcasePage extends StatelessWidget {
  const BottomSheetShowcasePage({super.key});

  void _showSheet(BuildContext context, _SheetType type) {
    final title = switch (type) {
      _SheetType.action => 'Action Sheet',
      _SheetType.filter => 'Filter Sheet',
      _SheetType.picker => 'Picker Sheet',
      _SheetType.confirm => 'Confirmation Sheet',
    };

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(34)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 12, 20, MediaQuery.of(context).padding.bottom + 24),
            decoration: BoxDecoration(
              color: const Color(0xFF101827).withOpacity(0.88),
              border: Border(top: BorderSide(color: Colors.white.withOpacity(0.16))),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(width: 52, height: 5, decoration: BoxDecoration(color: Colors.white.withOpacity(0.22), borderRadius: BorderRadius.circular(99))),
                const SizedBox(height: 22),
                Row(
                  children: [
                    Expanded(child: Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900))),
                    _RoundCloseButton(onTap: () => Navigator.pop(context)),
                  ],
                ),
                const SizedBox(height: 18),
                if (type == _SheetType.filter) const _FilterSheetContent(),
                if (type == _SheetType.picker) const _PickerSheetContent(),
                if (type == _SheetType.confirm) const _ConfirmSheetContent(),
                if (type == _SheetType.action) const _ActionSheetContent(),
              ],
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
        appBar: const GlassAppBar(title: 'Bottom Sheet Showcase'),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
          children: [
            const _HeaderCard(
              pill: 'BOTTOM SHEET',
              title: 'Glass Sheet Components',
              subtitle: 'Modern bottom sheets for actions, filters, pickers, and confirmations.',
              icon: Icons.vertical_align_bottom_rounded,
            ),
            const SizedBox(height: 16),
            _ShowcaseSection(
              icon: Icons.swipe_up_rounded,
              title: 'Sheet Variants',
              subtitle: 'Tap to open each bottom sheet.',
              children: [
                _ActionTile(title: 'Action Sheet', subtitle: 'Multiple user action options.', icon: Icons.touch_app_rounded, color: const Color(0xFFAEC2FF), onTap: () => _showSheet(context, _SheetType.action)),
                _ActionTile(title: 'Filter Sheet', subtitle: 'Filter chips and apply button.', icon: Icons.tune_rounded, color: const Color(0xFFB7FFE0), onTap: () => _showSheet(context, _SheetType.filter)),
                _ActionTile(title: 'Picker Sheet', subtitle: 'Select one option from list.', icon: Icons.checklist_rounded, color: const Color(0xFFFFD166), onTap: () => _showSheet(context, _SheetType.picker)),
                _ActionTile(title: 'Confirm Sheet', subtitle: 'Confirm destructive or important action.', icon: Icons.verified_rounded, color: const Color(0xFFFF8A8A), onTap: () => _showSheet(context, _SheetType.confirm)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

enum _SheetType { action, filter, picker, confirm }

class _ActionSheetContent extends StatelessWidget {
  const _ActionSheetContent();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _SheetRow(icon: Icons.edit_rounded, title: 'Edit Item', subtitle: 'Change selected component.'),
      _SheetRow(icon: Icons.share_rounded, title: 'Share Item', subtitle: 'Send this item to another app.'),
      _SheetRow(icon: Icons.delete_rounded, title: 'Delete Item', subtitle: 'Remove permanently.', danger: true),
    ]);
  }
}

class _FilterSheetContent extends StatelessWidget {
  const _FilterSheetContent();

  @override
  Widget build(BuildContext context) {
    final filters = ['All', 'Active', 'Pending', 'Completed', 'Failed'];
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Wrap(
        spacing: 10,
        runSpacing: 10,
        children: filters.map((e) => GlassPill(text: e, icon: e == 'All' ? Icons.auto_awesome_rounded : null)).toList(),
      ),
      const SizedBox(height: 20),
      AppButton(text: 'Apply Filter', icon: Icons.check_rounded, onPressed: () => Navigator.pop(context)),
    ]);
  }
}

class _PickerSheetContent extends StatelessWidget {
  const _PickerSheetContent();

  @override
  Widget build(BuildContext context) {
    final items = ['Indonesia', 'Singapore', 'Malaysia'];
    return Column(
      children: items.map((e) => _SheetRow(icon: Icons.public_rounded, title: e, subtitle: 'Available region', trailing: const Icon(Icons.chevron_right_rounded))).toList(),
    );
  }
}

class _ConfirmSheetContent extends StatelessWidget {
  const _ConfirmSheetContent();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text('This will continue your selected action. You can customize this content for logout, delete, or payment confirmation.',
          style: TextStyle(color: Colors.white.withOpacity(0.62), height: 1.45, fontWeight: FontWeight.w600)),
      const SizedBox(height: 20),
      AppButton(text: 'Confirm Action', icon: Icons.check_circle_rounded, onPressed: () => Navigator.pop(context)),
    ]);
  }
}

class _SheetRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool danger;
  final Widget? trailing;

  const _SheetRow({required this.icon, required this.title, required this.subtitle, this.danger = false, this.trailing});

  @override
  Widget build(BuildContext context) {
    final color = danger ? const Color(0xFFFF8A8A) : const Color(0xFFAEC2FF);
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white.withOpacity(0.06),
        border: Border.all(color: Colors.white.withOpacity(0.10)),
      ),
      child: Row(children: [
        Icon(icon, color: color),
        const SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w900)),
          const SizedBox(height: 4),
          Text(subtitle, style: TextStyle(color: Colors.white.withOpacity(0.56), fontWeight: FontWeight.w600)),
        ])),
        if (trailing != null) trailing!,
      ]),
    );
  }
}

class _RoundCloseButton extends StatelessWidget {
  final VoidCallback onTap;

  const _RoundCloseButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        height: 42,
        width: 42,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(18), color: Colors.white.withOpacity(0.08)),
        child: const Icon(Icons.close_rounded),
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
