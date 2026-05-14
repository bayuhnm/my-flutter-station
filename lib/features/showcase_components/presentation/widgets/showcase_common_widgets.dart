import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/widgets/glass_card.dart';
import '../../../../core/widgets/glass_pill.dart';

class ShowcaseHeaderCard extends StatelessWidget {
  final String pill;
  final String title;
  final String subtitle;
  final IconData icon;

  const ShowcaseHeaderCard({
    super.key,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlassPill(text: pill, icon: icon),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.8,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: TextStyle(
              height: 1.45,
              color: Colors.white.withOpacity(0.66),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class ShowcaseSection extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final List<Widget> children;

  const ShowcaseSection({
    super.key,
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
          ShowcaseSectionTitle(icon: icon, title: title, subtitle: subtitle),
          const SizedBox(height: 18),
          ...children,
        ],
      ),
    );
  }
}

class ShowcaseSectionTitle extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const ShowcaseSectionTitle({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GlassIconBox(icon: icon),
        const SizedBox(width: 13),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 17)),
              const SizedBox(height: 3),
              Text(
                subtitle,
                style: TextStyle(color: Colors.white.withOpacity(0.56), fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class GlassIconBox extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;

  const GlassIconBox({
    super.key,
    required this.icon,
    this.color = const Color(0xFFAEC2FF),
    this.size = 44,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size * 0.38),
        color: Colors.white.withOpacity(0.12),
        border: Border.all(color: Colors.white.withOpacity(0.14)),
      ),
      child: Icon(icon, color: color),
    );
  }
}

class GlassActionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;
  final Widget? trailing;

  const GlassActionTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.color = const Color(0xFFAEC2FF),
    this.onTap,
    this.trailing,
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
          child: Row(
            children: [
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: color.withOpacity(0.12),
                  border: Border.all(color: color.withOpacity(0.24)),
                ),
                child: Icon(icon, color: color),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.w900)),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.white.withOpacity(0.56), fontWeight: FontWeight.w600),
                  ),
                ]),
              ),
              trailing ?? const Icon(Icons.chevron_right_rounded),
            ],
          ),
        ),
      ),
    );
  }
}

class GlassMiniButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback? onTap;
  final Color color;

  const GlassMiniButton({
    super.key,
    required this.text,
    this.icon,
    this.onTap,
    this.color = const Color(0xFFAEC2FF),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: color.withOpacity(0.14),
          border: Border.all(color: color.withOpacity(0.26)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 18, color: color),
              const SizedBox(width: 8),
            ],
            Text(text, style: const TextStyle(fontWeight: FontWeight.w900)),
          ],
        ),
      ),
    );
  }
}

class GlassTag extends StatelessWidget {
  final String text;
  final Color color;
  final IconData? icon;

  const GlassTag({
    super.key,
    required this.text,
    this.color = const Color(0xFFAEC2FF),
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(99),
        color: color.withOpacity(0.12),
        border: Border.all(color: color.withOpacity(0.28)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 15, color: color),
            const SizedBox(width: 6),
          ],
          Text(text, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 12)),
        ],
      ),
    );
  }
}

class GlassSearchBox extends StatelessWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;

  const GlassSearchBox({
    super.key,
    this.hintText = 'Search...',
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      style: const TextStyle(fontWeight: FontWeight.w700),
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: const Icon(Icons.search_rounded),
        filled: true,
        fillColor: Colors.white.withOpacity(0.07),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.12)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.12)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: const BorderSide(color: Color(0xFFAEC2FF)),
        ),
      ),
    );
  }
}

class GlassDivider extends StatelessWidget {
  const GlassDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(height: 1, color: Colors.white.withOpacity(0.10));
  }
}

class KeyValueRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const KeyValueRow({
    super.key,
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: Row(
        children: [
          Expanded(
            child: Text(label, style: TextStyle(color: Colors.white.withOpacity(0.56), fontWeight: FontWeight.w700)),
          ),
          const SizedBox(width: 12),
          Text(value, style: TextStyle(color: valueColor ?? Colors.white, fontWeight: FontWeight.w900)),
        ],
      ),
    );
  }
}

class DottedDivider extends StatelessWidget {
  final double dashWidth;
  final double dashGap;

  const DottedDivider({
    super.key,
    this.dashWidth = 6,
    this.dashGap = 5,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final count = (constraints.maxWidth / (dashWidth + dashGap)).floor();
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          count,
          (_) => Container(
            height: 1,
            width: dashWidth,
            color: Colors.white.withOpacity(0.18),
          ),
        ),
      );
    });
  }
}
