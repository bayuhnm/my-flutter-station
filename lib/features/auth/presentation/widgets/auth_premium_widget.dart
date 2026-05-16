import 'dart:ui';

import 'package:flutter/material.dart';

class GlassPanel extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final VoidCallback? onTap;
  final Color? borderColor;
  final Color? backgroundColor;
  final List<BoxShadow>? boxShadow;

  const GlassPanel({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(20),
    this.borderRadius = 28,
    this.onTap,
    this.borderColor,
    this.backgroundColor,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final panel = ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 22, sigmaY: 22),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color:
                backgroundColor ??
                Colors.white.withValues(alpha: isDark ? 0.075 : 0.72),
            border: Border.all(
              color:
                  borderColor ??
                  Colors.white.withValues(alpha: isDark ? 0.12 : 0.85),
            ),
            boxShadow:
                boxShadow ??
                [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: isDark ? 0.34 : 0.08),
                    blurRadius: 34,
                    offset: const Offset(0, 18),
                  ),
                ],
          ),
          child: child,
        ),
      ),
    );

    if (onTap == null) return panel;

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius),
        child: panel,
      ),
    );
  }
}

class GlassIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final double size;
  final double radius;
  final Color? iconColor;

  const GlassIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.size = 46,
    this.radius = 18,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Material(
          color: Colors.white.withValues(alpha: isDark ? 0.08 : 0.68),
          child: InkWell(
            onTap: onTap,
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                border: Border.all(
                  color: Colors.white.withValues(alpha: isDark ? 0.12 : 0.82),
                ),
              ),
              child: Icon(icon, color: iconColor),
            ),
          ),
        ),
      ),
    );
  }
}

class PillBadge extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;

  const PillBadge({
    super.key,
    required this.label,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 9),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withValues(alpha: 0.28)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 16),
          const SizedBox(width: 7),
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: color,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}

class SmallBadge extends StatelessWidget {
  final String label;
  final Color color;

  const SmallBadge({super.key, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withValues(alpha: 0.28)),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: color,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}

class BlurGlow extends StatelessWidget {
  final double size;
  final Color color;
  final double blur;

  const BlurGlow({
    super.key,
    required this.size,
    required this.color,
    this.blur = 58,
  });

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      ),
    );
  }
}

class LuxuryGridPainter extends CustomPainter {
  final Color color;
  final double gap;
  final double strokeWidth;

  const LuxuryGridPainter({
    required this.color,
    this.gap = 38,
    this.strokeWidth = 1,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth;

    for (double x = 0; x <= size.width; x += gap) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    for (double y = 0; y <= size.height; y += gap) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant LuxuryGridPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.gap != gap ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}

Color authMutedColor(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;

  return isDark
      ? Colors.white.withValues(alpha: 0.58)
      : Colors.black.withValues(alpha: 0.52);
}
