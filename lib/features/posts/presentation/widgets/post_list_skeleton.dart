import 'package:flutter/material.dart';

import '../../../../core/widgets/glass_card.dart';

class PostListSkeleton extends StatelessWidget {
  const PostListSkeleton({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
      itemCount: 6,
      itemBuilder: (_, index) => Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: GlassCard(
          borderRadius: 30,
          padding: const EdgeInsets.all(18),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _Box(width: 48, height: 48, radius: 18),
            const SizedBox(width: 14),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [_Box(width: double.infinity, height: 16, radius: 8), SizedBox(height: 10), _Box(width: 220, height: 14, radius: 8), SizedBox(height: 14), _Box(width: 150, height: 30, radius: 999)])),
          ]),
        ),
      ),
    );
  }
}

class _Box extends StatelessWidget { final double width; final double height; final double radius; const _Box({required this.width, required this.height, required this.radius}); @override Widget build(BuildContext context) => Container(width: width, height: height, decoration: BoxDecoration(color: Colors.white.withOpacity(0.12), borderRadius: BorderRadius.circular(radius))); }
