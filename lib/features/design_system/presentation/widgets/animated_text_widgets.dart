import 'dart:async';

import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Gradient gradient;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const GradientText(
    this.text, {
    super.key,
    required this.gradient,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return gradient.createShader(
          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
        );
      },
      child: Text(
        text,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
        style: (style ?? Theme.of(context).textTheme.headlineMedium)?.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}

class TypewriterText extends StatefulWidget {
  final String text;
  final TextStyle? textStyle;
  final Duration speed;
  final Duration pause;
  final bool repeat;

  const TypewriterText({
    super.key,
    required this.text,
    this.textStyle,
    this.speed = const Duration(milliseconds: 55),
    this.pause = const Duration(milliseconds: 1400),
    this.repeat = true,
  });

  @override
  State<TypewriterText> createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText> {
  Timer? _timer;
  int _index = 0;
  bool _isDeleting = false;

  @override
  void initState() {
    super.initState();
    _start();
  }

  @override
  void didUpdateWidget(covariant TypewriterText oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.text != widget.text) {
      _timer?.cancel();
      _index = 0;
      _isDeleting = false;
      _start();
    }
  }

  void _start() {
    _timer = Timer.periodic(widget.speed, (_) {
      if (!mounted) return;

      setState(() {
        if (!_isDeleting) {
          if (_index < widget.text.length) {
            _index++;
            return;
          }

          if (!widget.repeat) {
            _timer?.cancel();
            return;
          }

          _isDeleting = true;
          _timer?.cancel();

          Future.delayed(widget.pause, () {
            if (!mounted) return;
            _start();
          });

          return;
        }

        if (_index > 0) {
          _index--;
          return;
        }

        _isDeleting = false;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final visibleText = widget.text.substring(0, _index);

    return RichText(
      text: TextSpan(
        style:
            widget.textStyle ??
            Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900),
        children: [
          TextSpan(text: visibleText),
          const TextSpan(text: '｜'),
        ],
      ),
    );
  }
}

class RotatingFadeText extends StatefulWidget {
  final List<String> texts;
  final TextStyle? textStyle;
  final Duration duration;

  const RotatingFadeText({
    super.key,
    required this.texts,
    this.textStyle,
    this.duration = const Duration(milliseconds: 1800),
  });

  @override
  State<RotatingFadeText> createState() => _RotatingFadeTextState();
}

class _RotatingFadeTextState extends State<RotatingFadeText> {
  Timer? _timer;
  int _index = 0;

  @override
  void initState() {
    super.initState();

    if (widget.texts.length > 1) {
      _timer = Timer.periodic(widget.duration, (_) {
        if (!mounted) return;

        setState(() {
          _index = (_index + 1) % widget.texts.length;
        });
      });
    }
  }

  @override
  void didUpdateWidget(covariant RotatingFadeText oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.texts != widget.texts) {
      _index = 0;
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.texts.isEmpty) return const SizedBox.shrink();

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 450),
      transitionBuilder: (child, animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: Text(
        widget.texts[_index],
        key: ValueKey(widget.texts[_index]),
        style:
            widget.textStyle ??
            Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900),
      ),
    );
  }
}

class SlideUpRepeatingText extends StatefulWidget {
  final List<String> texts;
  final TextStyle? textStyle;
  final Duration duration;

  const SlideUpRepeatingText({
    super.key,
    required this.texts,
    this.textStyle,
    this.duration = const Duration(milliseconds: 1700),
  });

  @override
  State<SlideUpRepeatingText> createState() => _SlideUpRepeatingTextState();
}

class _SlideUpRepeatingTextState extends State<SlideUpRepeatingText> {
  Timer? _timer;
  int _index = 0;

  @override
  void initState() {
    super.initState();

    if (widget.texts.length > 1) {
      _timer = Timer.periodic(widget.duration, (_) {
        if (!mounted) return;

        setState(() {
          _index = (_index + 1) % widget.texts.length;
        });
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.texts.isEmpty) return const SizedBox.shrink();

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 520),
      transitionBuilder: (child, animation) {
        final offsetAnimation =
            Tween<Offset>(
              begin: const Offset(0, 0.6),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
            );

        return FadeTransition(
          opacity: animation,
          child: SlideTransition(position: offsetAnimation, child: child),
        );
      },
      child: Text(
        widget.texts[_index],
        key: ValueKey(widget.texts[_index]),
        style:
            widget.textStyle ??
            Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900),
      ),
    );
  }
}

class NeonPulseText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final Color color;

  const NeonPulseText({
    super.key,
    required this.text,
    required this.color,
    this.style,
  });

  @override
  State<NeonPulseText> createState() => _NeonPulseTextState();
}

class _NeonPulseTextState extends State<NeonPulseText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _blurAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat(reverse: true);

    _blurAnimation = Tween<double>(
      begin: 8,
      end: 28,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final baseStyle =
        widget.style ??
        Theme.of(
          context,
        ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900);

    return AnimatedBuilder(
      animation: _blurAnimation,
      builder: (context, _) {
        return Text(
          widget.text,
          style: baseStyle?.copyWith(
            color: widget.color,
            shadows: [
              Shadow(
                color: widget.color.withValues(alpha: 0.9),
                blurRadius: _blurAnimation.value,
              ),
              Shadow(
                color: widget.color.withValues(alpha: 0.45),
                blurRadius: _blurAnimation.value * 1.8,
              ),
            ],
          ),
        );
      },
    );
  }
}

class ShimmerText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final Color baseColor;
  final Color highlightColor;
  final Duration duration;

  const ShimmerText({
    super.key,
    required this.text,
    required this.baseColor,
    required this.highlightColor,
    this.style,
    this.duration = const Duration(milliseconds: 1800),
  });

  @override
  State<ShimmerText> createState() => _ShimmerTextState();
}

class _ShimmerTextState extends State<ShimmerText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
  }

  @override
  void didUpdateWidget(covariant ShimmerText oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.duration != widget.duration) {
      _controller.duration = widget.duration;
      _controller
        ..reset()
        ..repeat();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final baseStyle =
        widget.style ??
        Theme.of(
          context,
        ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900);

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) {
            final width = bounds.width;

            return LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                widget.baseColor,
                widget.highlightColor,
                widget.baseColor,
              ],
              stops: const [0.2, 0.5, 0.8],
              transform: _SlidingGradientTransform(
                slidePercent: _controller.value,
                width: width,
              ),
            ).createShader(bounds);
          },
          child: Text(widget.text, style: baseStyle),
        );
      },
    );
  }
}

class PricePulseBadge extends StatefulWidget {
  final String text;
  final Color color;

  const PricePulseBadge({super.key, required this.text, required this.color});

  @override
  State<PricePulseBadge> createState() => _PricePulseBadgeState();
}

class _PricePulseBadgeState extends State<PricePulseBadge>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 950),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(
      begin: 0.96,
      end: 1.04,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(999),
          color: widget.color.withValues(alpha: 0.13),
          border: Border.all(color: widget.color.withValues(alpha: 0.34)),
          boxShadow: [
            BoxShadow(
              color: widget.color.withValues(alpha: 0.28),
              blurRadius: 18,
            ),
          ],
        ),
        child: Text(
          widget.text,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: widget.color,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}

class _SlidingGradientTransform extends GradientTransform {
  final double slidePercent;
  final double width;

  const _SlidingGradientTransform({
    required this.slidePercent,
    required this.width,
  });

  @override
  Matrix4 transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(width * (slidePercent * 2 - 1), 0, 0);
  }
}

class RunningText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final Duration duration;
  final double gap;
  final AxisDirection direction;
  final double? height;

  const RunningText({
    super.key,
    required this.text,
    this.style,
    this.duration = const Duration(seconds: 8),
    this.gap = 48,
    this.direction = AxisDirection.left,
    this.height,
  });

  @override
  State<RunningText> createState() => _RunningTextState();
}

class _RunningTextState extends State<RunningText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  bool get _toLeft => widget.direction == AxisDirection.left;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
  }

  @override
  void didUpdateWidget(covariant RunningText oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.duration != widget.duration) {
      _controller.duration = widget.duration;
      _controller
        ..reset()
        ..repeat();
    }

    if (oldWidget.direction != widget.direction) {
      _controller
        ..reset()
        ..repeat();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double _measureTextWidth({
    required BuildContext context,
    required TextStyle style,
  }) {
    final textPainter = TextPainter(
      text: TextSpan(text: widget.text, style: style),
      maxLines: 1,
      textDirection: Directionality.of(context),
    )..layout();

    return textPainter.width;
  }

  double _measureTextHeight({
    required BuildContext context,
    required TextStyle style,
  }) {
    final textPainter = TextPainter(
      text: TextSpan(text: widget.text, style: style),
      maxLines: 1,
      textDirection: Directionality.of(context),
    )..layout();

    return textPainter.height;
  }

  @override
  Widget build(BuildContext context) {
    final effectiveStyle =
        widget.style ??
        Theme.of(
          context,
        ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900) ??
        const TextStyle(fontSize: 16, fontWeight: FontWeight.w900);

    final textWidth = _measureTextWidth(
      context: context,
      style: effectiveStyle,
    );

    final textHeight = _measureTextHeight(
      context: context,
      style: effectiveStyle,
    );

    final itemWidth = textWidth + widget.gap;
    final contentWidth = itemWidth * 2;
    final height = widget.height ?? textHeight + 8;

    return ClipRect(
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return AnimatedBuilder(
              animation: _controller,
              builder: (context, _) {
                final animationValue = _controller.value;

                final offsetX = _toLeft
                    ? -itemWidth * animationValue
                    : -itemWidth + itemWidth * animationValue;

                return OverflowBox(
                  minWidth: contentWidth,
                  maxWidth: contentWidth,
                  alignment: Alignment.centerLeft,
                  child: Transform.translate(
                    offset: Offset(offsetX, 0),
                    child: SizedBox(
                      width: contentWidth,
                      height: height,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            bottom: 0,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                widget.text,
                                maxLines: 1,
                                softWrap: false,
                                overflow: TextOverflow.visible,
                                style: effectiveStyle,
                              ),
                            ),
                          ),
                          Positioned(
                            left: itemWidth,
                            top: 0,
                            bottom: 0,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                widget.text,
                                maxLines: 1,
                                softWrap: false,
                                overflow: TextOverflow.visible,
                                style: effectiveStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class VerticalTickerText extends StatefulWidget {
  final List<String> texts;
  final TextStyle? style;
  final Duration duration;
  final double height;

  const VerticalTickerText({
    super.key,
    required this.texts,
    this.style,
    this.duration = const Duration(milliseconds: 1500),
    this.height = 34,
  });

  @override
  State<VerticalTickerText> createState() => _VerticalTickerTextState();
}

class _VerticalTickerTextState extends State<VerticalTickerText> {
  Timer? _timer;
  int _index = 0;

  @override
  void initState() {
    super.initState();

    if (widget.texts.length > 1) {
      _timer = Timer.periodic(widget.duration, (_) {
        if (!mounted) return;

        setState(() {
          _index = (_index + 1) % widget.texts.length;
        });
      });
    }
  }

  @override
  void didUpdateWidget(covariant VerticalTickerText oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.texts != widget.texts) {
      _index = 0;
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.texts.isEmpty) return const SizedBox.shrink();

    return SizedBox(
      height: widget.height,
      child: ClipRect(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 460),
          transitionBuilder: (child, animation) {
            final slideAnimation =
                Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeOutCubic,
                  ),
                );

            return FadeTransition(
              opacity: animation,
              child: SlideTransition(position: slideAnimation, child: child),
            );
          },
          child: Align(
            key: ValueKey(widget.texts[_index]),
            alignment: Alignment.centerLeft,
            child: Text(
              widget.texts[_index],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style:
                  widget.style ??
                  Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900),
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedCounterText extends StatefulWidget {
  final double value;
  final String prefix;
  final String suffix;
  final int decimalDigits;
  final Duration duration;
  final TextStyle? style;

  const AnimatedCounterText({
    super.key,
    required this.value,
    this.prefix = '',
    this.suffix = '',
    this.decimalDigits = 0,
    this.duration = const Duration(milliseconds: 3000),
    this.style,
  });

  @override
  State<AnimatedCounterText> createState() => _AnimatedCounterTextState();
}

class _AnimatedCounterTextState extends State<AnimatedCounterText> {
  double _oldValue = 0;

  @override
  void didUpdateWidget(covariant AnimatedCounterText oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value != widget.value) {
      _oldValue = oldWidget.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: _oldValue, end: widget.value),
      duration: widget.duration,
      curve: Curves.easeOutCubic,
      builder: (context, value, _) {
        return Text(
          '${widget.prefix}${value.toStringAsFixed(widget.decimalDigits)}${widget.suffix}',
          style:
              widget.style ??
              Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900),
        );
      },
    );
  }
}

class WaveText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final Color color;
  final Duration duration;

  const WaveText({
    super.key,
    required this.text,
    required this.color,
    this.style,
    this.duration = const Duration(milliseconds: 1300),
  });

  @override
  State<WaveText> createState() => _WaveTextState();
}

class _WaveTextState extends State<WaveText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
  }

  @override
  void didUpdateWidget(covariant WaveText oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.duration != widget.duration) {
      _controller.duration = widget.duration;
      _controller
        ..reset()
        ..repeat();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double _waveValue(int index) {
    final progress = (_controller.value * widget.text.length) - index;
    final normalized = progress.clamp(0.0, 1.0);

    if (normalized <= 0 || normalized >= 1) return 0;

    return -8 * (1 - (2 * normalized - 1).abs());
  }

  @override
  Widget build(BuildContext context) {
    final baseStyle =
        widget.style ??
        Theme.of(
          context,
        ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900);

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Wrap(
          spacing: 1,
          children: List.generate(widget.text.length, (index) {
            final char = widget.text[index];

            return Transform.translate(
              offset: Offset(0, _waveValue(index)),
              child: Text(
                char,
                style: baseStyle?.copyWith(
                  color: widget.color,
                  shadows: [
                    Shadow(
                      color: widget.color.withValues(alpha: 0.35),
                      blurRadius: 16,
                    ),
                  ],
                ),
              ),
            );
          }),
        );
      },
    );
  }
}

class FlipText extends StatefulWidget {
  final List<String> texts;
  final TextStyle? style;
  final Duration duration;

  const FlipText({
    super.key,
    required this.texts,
    this.style,
    this.duration = const Duration(milliseconds: 1700),
  });

  @override
  State<FlipText> createState() => _FlipTextState();
}

class _FlipTextState extends State<FlipText> {
  Timer? _timer;
  int _index = 0;

  @override
  void initState() {
    super.initState();

    if (widget.texts.length > 1) {
      _timer = Timer.periodic(widget.duration, (_) {
        if (!mounted) return;

        setState(() {
          _index = (_index + 1) % widget.texts.length;
        });
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.texts.isEmpty) return const SizedBox.shrink();

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 560),
      transitionBuilder: (child, animation) {
        final rotate = Tween<double>(begin: 1.5708, end: 0).animate(
          CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
        );

        return AnimatedBuilder(
          animation: rotate,
          child: child,
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateX(rotate.value),
              child: FadeTransition(opacity: animation, child: child),
            );
          },
        );
      },
      child: Text(
        widget.texts[_index],
        key: ValueKey(widget.texts[_index]),
        style:
            widget.style ??
            Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900),
      ),
    );
  }
}

class RevealText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final Duration duration;
  final bool repeat;

  const RevealText({
    super.key,
    required this.text,
    this.style,
    this.duration = const Duration(milliseconds: 1300),
    this.repeat = true,
  });

  @override
  State<RevealText> createState() => _RevealTextState();
}

class _RevealTextState extends State<RevealText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _revealAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration);

    _revealAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );

    if (widget.repeat) {
      _controller.repeat(reverse: true);
    } else {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(covariant RevealText oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.duration != widget.duration ||
        oldWidget.repeat != widget.repeat) {
      _controller.duration = widget.duration;

      if (widget.repeat) {
        _controller
          ..reset()
          ..repeat(reverse: true);
      } else {
        _controller
          ..reset()
          ..forward();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final baseStyle =
        widget.style ??
        Theme.of(
          context,
        ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900);

    return AnimatedBuilder(
      animation: _revealAnimation,
      builder: (context, _) {
        return ClipRect(
          child: Align(
            widthFactor: _revealAnimation.value.clamp(0.0, 1.0),
            alignment: Alignment.centerLeft,
            child: Text(widget.text, maxLines: 1, style: baseStyle),
          ),
        );
      },
    );
  }
}

class GradientPulseText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final List<Color> colors;
  final Duration duration;

  const GradientPulseText({
    super.key,
    required this.text,
    required this.colors,
    this.style,
    this.duration = const Duration(milliseconds: 1500),
  });

  @override
  State<GradientPulseText> createState() => _GradientPulseTextState();
}

class _GradientPulseTextState extends State<GradientPulseText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat(reverse: true);

    _pulseAnimation = Tween<double>(
      begin: 0.65,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void didUpdateWidget(covariant GradientPulseText oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.duration != widget.duration) {
      _controller.duration = widget.duration;
      _controller
        ..reset()
        ..repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final baseStyle =
        widget.style ??
        Theme.of(
          context,
        ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900);

    return AnimatedBuilder(
      animation: _pulseAnimation,
      builder: (context, _) {
        return ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) {
            return LinearGradient(
              colors: widget.colors
                  .map(
                    (color) => color.withValues(alpha: _pulseAnimation.value),
                  )
                  .toList(),
            ).createShader(bounds);
          },
          child: Text(widget.text, style: baseStyle),
        );
      },
    );
  }
}
