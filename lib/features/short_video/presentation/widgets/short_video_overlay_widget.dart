import 'dart:ui';

import 'package:flutter/material.dart';

import '../../data/short_video_models.dart';

class ShortVideoOverlay extends StatelessWidget {
  final ShortVideoItem item;
  final bool isLiked;
  final VoidCallback onLike;
  final VoidCallback onComment;
  final VoidCallback onShare;

  const ShortVideoOverlay({
    super.key,
    required this.item,
    required this.isLiked,
    required this.onLike,
    required this.onComment,
    required this.onShare,
  });

  String _formatCount(int value) {
    if (value >= 1000000) {
      return '${(value / 1000000).toStringAsFixed(1)}M';
    }

    if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(1)}K';
    }

    return value.toString();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: false,
      child: Stack(
        children: [
          Positioned(
            left: 18,
            right: 82,
            bottom: 30,
            child: _CaptionPanel(item: item),
          ),
          Positioned(
            right: 14,
            bottom: 34,
            child: Column(
              children: [
                _ActionButton(
                  icon: isLiked
                      ? Icons.favorite_rounded
                      : Icons.favorite_border_rounded,
                  label: _formatCount(item.likes + (isLiked ? 1 : 0)),
                  color: isLiked ? const Color(0xFFFB7185) : Colors.white,
                  onTap: onLike,
                ),
                const SizedBox(height: 18),
                _ActionButton(
                  icon: Icons.mode_comment_outlined,
                  label: _formatCount(item.comments),
                  color: Colors.white,
                  onTap: onComment,
                ),
                const SizedBox(height: 18),
                _ActionButton(
                  icon: Icons.ios_share_rounded,
                  label: _formatCount(item.shares),
                  color: Colors.white,
                  onTap: onShare,
                ),
                const SizedBox(height: 18),
                _AvatarDisc(imageUrl: item.avatarUrl, color: item.accentColor),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CaptionPanel extends StatelessWidget {
  final ShortVideoItem item;

  const _CaptionPanel({required this.item});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.28),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.white.withValues(alpha: 0.14)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.author,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                item.username,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Colors.white.withValues(alpha: 0.66),
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                item.caption,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white.withValues(alpha: 0.86),
                  height: 1.35,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(
                    Icons.music_note_rounded,
                    color: Colors.white,
                    size: 16,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      item.musicTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Colors.white.withValues(alpha: 0.86),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 7,
                runSpacing: 7,
                children: item.tags.map((tag) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 9,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: item.accentColor.withValues(alpha: 0.16),
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(
                        color: item.accentColor.withValues(alpha: 0.26),
                      ),
                    ),
                    child: Text(
                      '#$tag',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: item.accentColor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
            child: Material(
              color: Colors.black.withValues(alpha: 0.28),
              child: InkWell(
                onTap: onTap,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.14),
                    ),
                  ),
                  child: Icon(icon, color: color),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}

class _AvatarDisc extends StatelessWidget {
  final String imageUrl;
  final Color color;

  const _AvatarDisc({required this.imageUrl, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      height: 52,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(colors: [color, Colors.white]),
        boxShadow: [
          BoxShadow(color: color.withValues(alpha: 0.34), blurRadius: 18),
        ],
      ),
      child: ClipOval(
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) {
            return Container(
              color: Colors.black.withValues(alpha: 0.25),
              child: const Icon(Icons.person_rounded, color: Colors.white),
            );
          },
        ),
      ),
    );
  }
}
