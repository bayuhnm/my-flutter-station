import 'package:flutter/material.dart';

import '../../../../core/widgets/glass_card.dart';
import '../../../../core/widgets/glass_pill.dart';
import '../../domain/entities/post_entity.dart';

class PostCard extends StatelessWidget {
  final PostEntity post;
  final int index;
  const PostCard({super.key, required this.post, required this.index});

  @override
  Widget build(BuildContext context) {
    final accentColors = [const Color(0xFFAEC2FF), const Color(0xFF55F7E6), const Color(0xFFFFD38A), const Color(0xFFFF9BC0)];
    final accent = accentColors[index % accentColors.length];
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GlassCard(
        borderRadius: 30,
        padding: const EdgeInsets.all(18),
        gradientColors: [Colors.white.withOpacity(0.17), accent.withOpacity(0.07), Colors.white.withOpacity(0.055)],
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(width: 48, height: 48, decoration: BoxDecoration(borderRadius: BorderRadius.circular(18), gradient: LinearGradient(colors: [Colors.white.withOpacity(0.90), accent.withOpacity(0.74)])), child: Center(child: Text('#${post.id}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w900, color: Color(0xFF111827))))),
          const SizedBox(width: 14),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(post.shortTitle, style: const TextStyle(fontSize: 16, height: 1.28, fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: -0.2)),
            const SizedBox(height: 10),
            Text(post.body, maxLines: 3, overflow: TextOverflow.ellipsis, style: TextStyle(height: 1.45, color: Colors.white.withOpacity(0.66), fontWeight: FontWeight.w600)),
            const SizedBox(height: 14),
            Row(children: [GlassPill(icon: Icons.person_outline, text: 'USER ${post.userId}'), const SizedBox(width: 8), const GlassPill(icon: Icons.article_outlined, text: 'POST')]),
          ])),
        ]),
      ),
    );
  }
}
