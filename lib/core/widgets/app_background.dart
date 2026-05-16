import 'dart:ui';

import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';

class AppBackground extends StatelessWidget {
  final Widget child;

  const AppBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark
              ? const [AppColors.navy900, AppColors.navy800, Color(0xFF081125)]
              : const [Color(0xFFF3FBFF), Color(0xFFEAF2FF), Color(0xFFFFFFFF)],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -100,
            left: -70,
            child: _Orb(
              size: 220,
              color: AppColors.neonBlue.withValues(alpha: isDark ? 0.22 : 0.18),
            ),
          ),
          Positioned(
            bottom: -100,
            right: -80,
            child: _Orb(
              size: 260,
              color: AppColors.electricPurple.withValues(
                alpha: isDark ? 0.18 : 0.13,
              ),
            ),
          ),
          Positioned(
            top: 190,
            right: -70,
            child: _Orb(
              size: 150,
              color: AppColors.mint.withValues(alpha: isDark ? 0.10 : 0.12),
            ),
          ),
          child,
        ],
      ),
    );
  }
}

class _Orb extends StatelessWidget {
  final double size;
  final Color color;

  const _Orb({required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(color: color, blurRadius: 90, spreadRadius: 45),
          ],
        ),
      ),
    );
  }
}

class LuxuryAppBackground extends StatelessWidget {
  final Widget child;

  const LuxuryAppBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Stack(
      children: [
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: isDark
                    ? const [
                        Color(0xFF020617),
                        Color(0xFF06142E),
                        Color(0xFF020617),
                      ]
                    : const [
                        Color(0xFFF8FBFF),
                        Color(0xFFEFF6FF),
                        Color(0xFFFFFFFF),
                      ],
              ),
            ),
          ),
        ),
        Positioned(
          top: -120,
          right: -90,
          child: _BlurCircle(
            size: 260,
            color: const Color(
              0xFF38BDF8,
            ).withValues(alpha: isDark ? 0.24 : 0.2),
          ),
        ),
        Positioned(
          top: 210,
          left: -120,
          child: _BlurCircle(
            size: 230,
            color: const Color(
              0xFF8B5CF6,
            ).withValues(alpha: isDark ? 0.15 : 0.12),
          ),
        ),
        Positioned(
          bottom: -130,
          right: -100,
          child: _BlurCircle(
            size: 250,
            color: const Color(
              0xFFF8D66D,
            ).withValues(alpha: isDark ? 0.1 : 0.14),
          ),
        ),
        Positioned.fill(
          child: CustomPaint(
            painter: _LuxuryGridPainter(
              color: isDark
                  ? Colors.white.withValues(alpha: 0.035)
                  : Colors.black.withValues(alpha: 0.028),
            ),
          ),
        ),
        child,
      ],
    );
  }
}

class _BlurCircle extends StatelessWidget {
  final double size;
  final Color color;

  const _BlurCircle({required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 55, sigmaY: 55),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      ),
    );
  }
}

class _LuxuryGridPainter extends CustomPainter {
  final Color color;

  const _LuxuryGridPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;

    const gap = 38.0;

    for (double x = 0; x <= size.width; x += gap) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    for (double y = 0; y <= size.height; y += gap) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _LuxuryGridPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
