import 'dart:ui';

import 'package:flutter/material.dart';

class GlassPill extends StatelessWidget {
  final String text;
  final IconData? icon;

  const GlassPill({super.key, required this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(999),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.10),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: Colors.white.withOpacity(0.16)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[Icon(icon, size: 14, color: const Color(0xFFAEC2FF)), const SizedBox(width: 6)],
              Text(text, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w900, letterSpacing: 0.8, color: Color(0xFFEAF0FF))),
            ],
          ),
        ),
      ),
    );
  }
}
