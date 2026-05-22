import 'package:flutter/material.dart';

class ShortVideoItem {
  final String id;
  final String videoUrl;
  final String author;
  final String username;
  final String caption;
  final String musicTitle;
  final String avatarUrl;
  final int likes;
  final int comments;
  final int shares;
  final List<String> tags;
  final Color accentColor;

  const ShortVideoItem({
    required this.id,
    required this.videoUrl,
    required this.author,
    required this.username,
    required this.caption,
    required this.musicTitle,
    required this.avatarUrl,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.tags,
    required this.accentColor,
  });
}

const demoShortVideos = <ShortVideoItem>[
  ShortVideoItem(
    id: '1',
    videoUrl:
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    author: 'Crypto Station',
    username: '@crypto.station',
    caption:
        'Luxury crypto market preview with smooth short video player experience.',
    musicTitle: 'Premium Market Beat',
    avatarUrl:
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=300&q=80',
    likes: 12840,
    comments: 842,
    shares: 312,
    tags: ['Crypto', 'Market', 'Luxury'],
    accentColor: Color(0xFF38BDF8),
  ),
  ShortVideoItem(
    id: '2',
    videoUrl:
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    author: 'Design Motion',
    username: '@design.motion',
    caption:
        'Glassmorphism motion UI for modern reels, shorts, and vertical content.',
    musicTitle: 'Glass UI Motion',
    avatarUrl:
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=300&q=80',
    likes: 42190,
    comments: 1290,
    shares: 870,
    tags: ['Design', 'Flutter', 'Reels'],
    accentColor: Color(0xFFF8D66D),
  ),
  ShortVideoItem(
    id: '3',
    videoUrl:
        'https://interactive-examples.mdn.mozilla.net/media/cc0-videos/flower.mp4',
    author: 'Premium Studio',
    username: '@premium.studio',
    caption:
        'A vertical player layout prepared for infinite scroll and social actions.',
    musicTitle: 'Future Reels Sound',
    avatarUrl:
        'https://images.unsplash.com/photo-1527980965255-d3b416303d12?auto=format&fit=crop&w=300&q=80',
    likes: 9360,
    comments: 420,
    shares: 128,
    tags: ['Shorts', 'Video', 'Mobile'],
    accentColor: Color(0xFF22C55E),
  ),
  ShortVideoItem(
    id: '4',
    videoUrl:
        'https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/720/Big_Buck_Bunny_720_10s_1MB.mp4',
    author: 'Market Pulse',
    username: '@market.pulse',
    caption:
        'Testing fullscreen video feed behavior with like, comment, share, and smooth page transition.',
    musicTitle: 'Bullish Signal Audio',
    avatarUrl:
        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=300&q=80',
    likes: 28750,
    comments: 760,
    shares: 540,
    tags: ['Trading', 'Signal', 'Feed'],
    accentColor: Color(0xFF8B5CF6),
  ),
  ShortVideoItem(
    id: '5',
    videoUrl:
        'https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/720/Big_Buck_Bunny_720_10s_2MB.mp4',
    author: 'Mobile Lab',
    username: '@mobile.lab',
    caption:
        'Compatibility test for Android and iOS video playback using network MP4 source.',
    musicTitle: 'Native Player Test',
    avatarUrl:
        'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?auto=format&fit=crop&w=300&q=80',
    likes: 15420,
    comments: 610,
    shares: 275,
    tags: ['Android', 'iOS', 'Test'],
    accentColor: Color(0xFFFB7185),
  ),
];
