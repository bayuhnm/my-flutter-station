import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  final Widget child;
  const AppBackground({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF070A12),
        gradient: RadialGradient(center: Alignment.topRight, radius: 1.1, colors: [Color(0xFF26305D), Color(0xFF070A12)]),
      ),
      child: Stack(children: [
        Positioned(top: -90, right: -70, child: _GlowCircle(size: 210, color: Color(0xFF6D7CFF), opacity: 0.28)),
        Positioned(bottom: -120, left: -90, child: _GlowCircle(size: 260, color: Color(0xFF24D6C7), opacity: 0.14)),
        child,
      ]),
    );
  }
}
class _GlowCircle extends StatelessWidget {
  final double size; final Color color; final double opacity;
  const _GlowCircle({required this.size, required this.color, required this.opacity});
  @override Widget build(BuildContext context) => IgnorePointer(child: Container(width: size, height: size, decoration: BoxDecoration(shape: BoxShape.circle, color: color.withOpacity(opacity), boxShadow: [BoxShadow(color: color.withOpacity(opacity), blurRadius: 90, spreadRadius: 30)])));
}
