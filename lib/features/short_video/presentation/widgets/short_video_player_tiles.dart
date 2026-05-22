import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../data/short_video_models.dart';
import 'short_video_overlay_widget.dart';

class PureShortVideoTile extends StatefulWidget {
  final ShortVideoItem item;
  final bool autoPlay;
  final bool useVisibilityDetector;

  const PureShortVideoTile({
    super.key,
    required this.item,
    this.autoPlay = true,
    this.useVisibilityDetector = false,
  });

  @override
  State<PureShortVideoTile> createState() => _PureShortVideoTileState();
}

class _PureShortVideoTileState extends State<PureShortVideoTile> {
  late final VideoPlayerController _controller;
  bool _initialized = false;
  bool _isLiked = false;
  bool _showPlayIcon = false;

  @override
  void initState() {
    super.initState();

    _controller =
        VideoPlayerController.networkUrl(
            Uri.parse(widget.item.videoUrl),
            videoPlayerOptions: VideoPlayerOptions(mixWithOthers: false),
          )
          ..setLooping(true)
          ..initialize().then((_) {
            if (!mounted) return;

            setState(() {
              _initialized = true;
            });

            if (widget.autoPlay) {
              _controller.play();
            }
          });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayback() {
    if (!_initialized) return;

    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        _showPlayIcon = true;
      } else {
        _controller.play();
        _showPlayIcon = false;
      }
    });
  }

  void _handleVisibility(double visibleFraction) {
    if (!widget.useVisibilityDetector || !_initialized) return;

    if (visibleFraction > 0.65) {
      if (!_controller.value.isPlaying) {
        _controller.play();
      }
    } else {
      if (_controller.value.isPlaying) {
        _controller.pause();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final content = GestureDetector(
      onTap: _togglePlayback,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (!_initialized)
            Container(
              color: const Color(0xFF020617),
              child: const Center(
                child: CircularProgressIndicator(color: Color(0xFF38BDF8)),
              ),
            )
          else
            FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x33000000),
                  Color(0x00000000),
                  Color(0xAA020617),
                ],
              ),
            ),
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 180),
            opacity: _showPlayIcon ? 1 : 0,
            child: Center(
              child: Container(
                width: 76,
                height: 76,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withValues(alpha: 0.35),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.18),
                  ),
                ),
                child: const Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.white,
                  size: 44,
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.paddingOf(context).top + 10,
            left: 18,
            child: _TopBadge(
              label: widget.useVisibilityDetector
                  ? 'video_player + visibility'
                  : 'pure video_player',
              color: widget.item.accentColor,
            ),
          ),
          ShortVideoOverlay(
            item: widget.item,
            isLiked: _isLiked,
            onLike: () {
              setState(() {
                _isLiked = !_isLiked;
              });
            },
            onComment: () {
              _showSnack(context, 'Open comments');
            },
            onShare: () {
              _showSnack(context, 'Share video');
            },
          ),
        ],
      ),
    );

    if (!widget.useVisibilityDetector) return content;

    return VisibilityDetector(
      key: ValueKey('video-${widget.item.id}'),
      onVisibilityChanged: (info) {
        _handleVisibility(info.visibleFraction);
      },
      child: content,
    );
  }

  void _showSnack(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
    );
  }
}

class ChewieShortVideoTile extends StatefulWidget {
  final ShortVideoItem item;

  const ChewieShortVideoTile({super.key, required this.item});

  @override
  State<ChewieShortVideoTile> createState() => _ChewieShortVideoTileState();
}

class _ChewieShortVideoTileState extends State<ChewieShortVideoTile> {
  late final VideoPlayerController _videoController;
  ChewieController? _chewieController;
  bool _initialized = false;
  bool _isLiked = false;

  @override
  void initState() {
    super.initState();

    _videoController = VideoPlayerController.networkUrl(
      Uri.parse(widget.item.videoUrl),
    );

    _videoController.initialize().then((_) {
      if (!mounted) return;

      _chewieController = ChewieController(
        videoPlayerController: _videoController,
        autoPlay: true,
        looping: true,
        showControls: true,
        allowFullScreen: true,
        allowMuting: true,
        materialProgressColors: ChewieProgressColors(
          playedColor: widget.item.accentColor,
          handleColor: widget.item.accentColor,
          backgroundColor: Colors.white.withValues(alpha: 0.18),
          bufferedColor: Colors.white.withValues(alpha: 0.36),
        ),
      );

      setState(() {
        _initialized = true;
      });
    });
  }

  @override
  void dispose() {
    _chewieController?.dispose();
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        if (!_initialized || _chewieController == null)
          Container(
            color: const Color(0xFF020617),
            child: const Center(
              child: CircularProgressIndicator(color: Color(0xFF38BDF8)),
            ),
          )
        else
          FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: _videoController.value.size.width,
              height: _videoController.value.size.height,
              child: Chewie(controller: _chewieController!),
            ),
          ),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0x22000000), Color(0x00000000), Color(0x99020617)],
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.paddingOf(context).top + 10,
          left: 18,
          child: _TopBadge(
            label: 'chewie + video_player',
            color: widget.item.accentColor,
          ),
        ),
        ShortVideoOverlay(
          item: widget.item,
          isLiked: _isLiked,
          onLike: () {
            setState(() {
              _isLiked = !_isLiked;
            });
          },
          onComment: () {
            _showSnack(context, 'Open comments');
          },
          onShare: () {
            _showSnack(context, 'Share video');
          },
        ),
      ],
    );
  }

  void _showSnack(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
    );
  }
}

class _TopBadge extends StatelessWidget {
  final String label;
  final Color color;

  const _TopBadge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.28),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withValues(alpha: 0.36)),
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
