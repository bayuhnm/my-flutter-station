import 'dart:ui';

import 'package:flutter/material.dart';

import '../../data/short_video_models.dart';
import '../widgets/short_video_player_tiles.dart';

class ShortVideosChewiePlayerPage extends StatelessWidget {
  const ShortVideosChewiePlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF020617),
      body: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: demoShortVideos.length,
            itemBuilder: (context, index) {
              return ChewieShortVideoTile(item: demoShortVideos[index]);
            },
          ),

          Positioned(
            top: MediaQuery.paddingOf(context).top + 12,
            left: 16,
            child: _ShortVideoBackButton(onTap: () => Navigator.pop(context)),
          ),
        ],
      ),
    );
  }
}

class _ShortVideoBackButton extends StatelessWidget {
  final VoidCallback onTap;

  const _ShortVideoBackButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Material(
          color: Colors.black.withValues(alpha: 0.28),
          child: InkWell(
            onTap: onTap,
            child: Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Colors.white.withValues(alpha: 0.16)),
              ),
              child: const Icon(Icons.arrow_back_rounded, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
