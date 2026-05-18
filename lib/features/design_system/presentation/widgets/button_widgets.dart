import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

class LuxuryGradientButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double height;
  final BorderRadiusGeometry borderRadius;
  final List<Color> colors;

  const LuxuryGradientButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isLoading = false,
    this.height = 56,
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
    this.colors = const [
      Color(0xFF38BDF8),
      Color(0xFF2563EB),
      Color(0xFF8B5CF6),
    ],
  });

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null && !isLoading;

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 220),
      opacity: enabled ? 1 : 0.58,
      child: Material(
        color: Colors.transparent,
        borderRadius: borderRadius,
        child: InkWell(
          onTap: enabled ? onPressed : null,
          borderRadius: borderRadius.resolve(Directionality.of(context)),
          child: Ink(
            height: height,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              gradient: LinearGradient(colors: colors),
              boxShadow: [
                BoxShadow(
                  color: colors.first.withValues(alpha: 0.28),
                  blurRadius: 28,
                  offset: const Offset(0, 14),
                ),
              ],
            ),
            child: Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 240),
                child: isLoading
                    ? const SizedBox(
                        key: ValueKey('loading'),
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.4,
                          color: Colors.white,
                        ),
                      )
                    : _ButtonContent(
                        key: const ValueKey('content'),
                        label: label,
                        icon: icon,
                        foregroundColor: Colors.white,
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LuxuryGlassButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback? onPressed;
  final double height;
  final Color accentColor;

  const LuxuryGlassButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.height = 56,
    this.accentColor = const Color(0xFF38BDF8),
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final enabled = onPressed != null;

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 220),
      opacity: enabled ? 1 : 0.5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
          child: Material(
            color: Colors.white.withValues(alpha: isDark ? 0.08 : 0.68),
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              onTap: enabled ? onPressed : null,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: accentColor.withValues(alpha: 0.34),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: accentColor.withValues(alpha: isDark ? 0.18 : 0.1),
                      blurRadius: 24,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: Center(
                  child: _ButtonContent(
                    label: label,
                    icon: icon,
                    foregroundColor: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NeonPulseButton extends StatefulWidget {
  final String label;
  final IconData? icon;
  final VoidCallback? onPressed;
  final Color color;
  final double height;

  const NeonPulseButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.color = const Color(0xFF38BDF8),
    this.height = 56,
  });

  @override
  State<NeonPulseButton> createState() => _NeonPulseButtonState();
}

class _NeonPulseButtonState extends State<NeonPulseButton>
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
      begin: 14,
      end: 34,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final enabled = widget.onPressed != null;

    return AnimatedBuilder(
      animation: _blurAnimation,
      builder: (context, _) {
        return AnimatedOpacity(
          duration: const Duration(milliseconds: 220),
          opacity: enabled ? 1 : 0.5,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: widget.color.withValues(alpha: 0.32),
                  blurRadius: _blurAnimation.value,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              child: InkWell(
                onTap: enabled ? widget.onPressed : null,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: widget.height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: widget.color.withValues(alpha: 0.12),
                    border: Border.all(
                      color: widget.color.withValues(alpha: 0.58),
                    ),
                  ),
                  child: Center(
                    child: _ButtonContent(
                      label: widget.label,
                      icon: widget.icon,
                      foregroundColor: widget.color,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class ShimmerButton extends StatefulWidget {
  final String label;
  final IconData? icon;
  final VoidCallback? onPressed;
  final double height;
  final List<Color> colors;

  const ShimmerButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.height = 56,
    this.colors = const [
      Color(0xFFF8D66D),
      Color(0xFF38BDF8),
      Color(0xFF8B5CF6),
    ],
  });

  @override
  State<ShimmerButton> createState() => _ShimmerButtonState();
}

class _ShimmerButtonState extends State<ShimmerButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final enabled = widget.onPressed != null;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return AnimatedOpacity(
          duration: const Duration(milliseconds: 220),
          opacity: enabled ? 1 : 0.5,
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              onTap: enabled ? widget.onPressed : null,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: widget.height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      widget.colors.first,
                      Colors.white,
                      widget.colors.last,
                    ],
                    stops: const [0.15, 0.5, 0.85],
                    transform: _SlidingGradientTransform(
                      slidePercent: _controller.value,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: widget.colors.first.withValues(alpha: 0.26),
                      blurRadius: 26,
                      offset: const Offset(0, 14),
                    ),
                  ],
                ),
                child: Center(
                  child: _ButtonContent(
                    label: widget.label,
                    icon: widget.icon,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class BorderSweepButton extends StatefulWidget {
  final String label;
  final IconData? icon;
  final VoidCallback? onPressed;
  final Color color;
  final double height;

  const BorderSweepButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.color = const Color(0xFF38BDF8),
    this.height = 56,
  });

  @override
  State<BorderSweepButton> createState() => _BorderSweepButtonState();
}

class _BorderSweepButtonState extends State<BorderSweepButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final enabled = widget.onPressed != null;

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 220),
      opacity: enabled ? 1 : 0.5,
      child: CustomPaint(
        painter: _SweepBorderPainter(
          progress: _controller,
          color: widget.color,
          radius: 20,
        ),
        child: Material(
          color: widget.color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            onTap: enabled ? widget.onPressed : null,
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              height: widget.height,
              child: Center(
                child: _ButtonContent(
                  label: widget.label,
                  icon: widget.icon,
                  foregroundColor: widget.color,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LiquidFillButton extends StatefulWidget {
  final String label;
  final IconData? icon;
  final VoidCallback? onPressed;
  final Color color;
  final double height;

  const LiquidFillButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.color = const Color(0xFF22C55E),
    this.height = 56,
  });

  @override
  State<LiquidFillButton> createState() => _LiquidFillButtonState();
}

class _LiquidFillButtonState extends State<LiquidFillButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _hovered = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 520),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _setHovered(bool value) {
    if (widget.onPressed == null) return;

    setState(() => _hovered = value);

    if (value) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final enabled = widget.onPressed != null;

    return MouseRegion(
      onEnter: (_) => _setHovered(true),
      onExit: (_) => _setHovered(false),
      child: GestureDetector(
        onTapDown: (_) => _setHovered(true),
        onTapCancel: () => _setHovered(false),
        onTapUp: (_) => _setHovered(false),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 220),
          opacity: enabled ? 1 : 0.5,
          child: Material(
            color: widget.color.withValues(alpha: 0.09),
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              onTap: enabled ? widget.onPressed : null,
              borderRadius: BorderRadius.circular(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  height: widget.height,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned.fill(
                        child: AnimatedBuilder(
                          animation: _controller,
                          builder: (context, _) {
                            return Align(
                              alignment: Alignment.bottomCenter,
                              child: FractionallySizedBox(
                                heightFactor: _controller.value,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: widget.color.withValues(alpha: 0.92),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: widget.color.withValues(alpha: 0.36),
                          ),
                        ),
                      ),
                      AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 180),
                        style:
                            Theme.of(context).textTheme.labelLarge?.copyWith(
                              fontWeight: FontWeight.w900,
                              color: _hovered ? Colors.white : widget.color,
                            ) ??
                            TextStyle(
                              fontWeight: FontWeight.w900,
                              color: _hovered ? Colors.white : widget.color,
                            ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (widget.icon != null) ...[
                              Icon(
                                widget.icon,
                                color: _hovered ? Colors.white : widget.color,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                            ],
                            Text(widget.label),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ScalePressButton extends StatefulWidget {
  final String label;
  final IconData? icon;
  final VoidCallback? onPressed;
  final Color color;
  final double height;

  const ScalePressButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.color = const Color(0xFF38BDF8),
    this.height = 56,
  });

  @override
  State<ScalePressButton> createState() => _ScalePressButtonState();
}

class _ScalePressButtonState extends State<ScalePressButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final enabled = widget.onPressed != null;

    return GestureDetector(
      onTapDown: enabled ? (_) => setState(() => _pressed = true) : null,
      onTapCancel: enabled ? () => setState(() => _pressed = false) : null,
      onTapUp: enabled ? (_) => setState(() => _pressed = false) : null,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOut,
        scale: _pressed ? 0.96 : 1,
        child: LuxuryGradientButton(
          label: widget.label,
          icon: widget.icon,
          onPressed: widget.onPressed,
          height: widget.height,
          colors: [widget.color, widget.color.withValues(alpha: 0.75)],
        ),
      ),
    );
  }
}

class LoadingMorphButton extends StatefulWidget {
  final String idleLabel;
  final String loadingLabel;
  final IconData? icon;
  final bool isLoading;
  final VoidCallback? onPressed;
  final Color color;
  final double height;

  const LoadingMorphButton({
    super.key,
    required this.idleLabel,
    required this.loadingLabel,
    required this.isLoading,
    required this.onPressed,
    this.icon,
    this.color = const Color(0xFF38BDF8),
    this.height = 56,
  });

  @override
  State<LoadingMorphButton> createState() => _LoadingMorphButtonState();
}

class _LoadingMorphButtonState extends State<LoadingMorphButton> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final parentWidth = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : MediaQuery.sizeOf(context).width;

        final loadingWidth = parentWidth < 190 ? parentWidth : 190.0;
        final targetWidth = widget.isLoading ? loadingWidth : parentWidth;
        final radius = widget.isLoading ? 999.0 : 20.0;

        return Align(
          alignment: Alignment.center,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 360),
            curve: Curves.easeOutCubic,
            height: widget.height,
            width: targetWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              gradient: LinearGradient(
                colors: [widget.color, const Color(0xFF2563EB)],
              ),
              boxShadow: [
                BoxShadow(
                  color: widget.color.withValues(alpha: 0.28),
                  blurRadius: 28,
                  offset: const Offset(0, 14),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(radius),
              child: InkWell(
                onTap: widget.isLoading ? null : widget.onPressed,
                borderRadius: BorderRadius.circular(radius),
                child: Center(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 260),
                    switchInCurve: Curves.easeOutCubic,
                    switchOutCurve: Curves.easeInCubic,
                    child: widget.isLoading
                        ? Row(
                            key: const ValueKey('loading-morph'),
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.2,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Flexible(
                                child: Text(
                                  widget.loadingLabel,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.labelLarge
                                      ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                      ),
                                ),
                              ),
                            ],
                          )
                        : _ButtonContent(
                            key: const ValueKey('idle-morph'),
                            label: widget.idleLabel,
                            icon: widget.icon,
                            foregroundColor: Colors.white,
                          ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class IconSlideButton extends StatefulWidget {
  final String label;
  final IconData icon;
  final VoidCallback? onPressed;
  final Color color;
  final double height;

  const IconSlideButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
    this.color = const Color(0xFFF8D66D),
    this.height = 56,
  });

  @override
  State<IconSlideButton> createState() => _IconSlideButtonState();
}

class _IconSlideButtonState extends State<IconSlideButton> {
  bool _pressedOrHovered = false;

  void _setActive(bool value) {
    if (widget.onPressed == null) return;
    if (_pressedOrHovered == value) return;

    setState(() {
      _pressedOrHovered = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final enabled = widget.onPressed != null;

    return MouseRegion(
      onEnter: (_) => _setActive(true),
      onExit: (_) => _setActive(false),
      child: GestureDetector(
        onTapDown: enabled ? (_) => _setActive(true) : null,
        onTapCancel: enabled ? () => _setActive(false) : null,
        onTapUp: enabled ? (_) => _setActive(false) : null,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 220),
          opacity: enabled ? 1 : 0.5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
              child: Material(
                color: Colors.white.withValues(alpha: isDark ? 0.08 : 0.68),
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  onTap: enabled ? widget.onPressed : null,
                  borderRadius: BorderRadius.circular(20),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    curve: Curves.easeOutCubic,
                    height: widget.height,
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: widget.color.withValues(
                          alpha: _pressedOrHovered ? 0.58 : 0.34,
                        ),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: widget.color.withValues(
                            alpha: _pressedOrHovered ? 0.26 : 0.12,
                          ),
                          blurRadius: _pressedOrHovered ? 30 : 20,
                          offset: const Offset(0, 12),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AnimatedSlide(
                            duration: const Duration(milliseconds: 220),
                            curve: Curves.easeOutCubic,
                            offset: _pressedOrHovered
                                ? const Offset(0.28, 0)
                                : Offset.zero,
                            child: Icon(
                              widget.icon,
                              color: widget.color,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: Text(
                              widget.label,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.labelLarge
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurface,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: -0.1,
                                  ),
                            ),
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 220),
                            curve: Curves.easeOutCubic,
                            width: _pressedOrHovered ? 10 : 0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FloatingGlowButton extends StatefulWidget {
  final String label;
  final IconData? icon;
  final VoidCallback? onPressed;
  final Color color;
  final double height;

  const FloatingGlowButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.color = const Color(0xFF8B5CF6),
    this.height = 56,
  });

  @override
  State<FloatingGlowButton> createState() => _FloatingGlowButtonState();
}

class _FloatingGlowButtonState extends State<FloatingGlowButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _floatAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    )..repeat(reverse: true);

    _floatAnimation = Tween<double>(
      begin: 0,
      end: -6,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _floatAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _floatAnimation.value),
          child: child,
        );
      },
      child: LuxuryGradientButton(
        label: widget.label,
        icon: widget.icon,
        onPressed: widget.onPressed,
        height: widget.height,
        colors: [widget.color, const Color(0xFF38BDF8)],
      ),
    );
  }
}

class StatusButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback? onPressed;
  final Color color;
  final double height;

  const StatusButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
    required this.color,
    this.height = 54,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color.withValues(alpha: 0.11),
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: color.withValues(alpha: 0.32)),
          ),
          child: Center(
            child: _ButtonContent(
              label: label,
              icon: icon,
              foregroundColor: color,
            ),
          ),
        ),
      ),
    );
  }
}

class _ButtonContent extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Color foregroundColor;

  const _ButtonContent({
    super.key,
    required this.label,
    required this.icon,
    required this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style:
          Theme.of(context).textTheme.labelLarge?.copyWith(
            color: foregroundColor,
            fontWeight: FontWeight.w900,
            letterSpacing: -0.1,
          ) ??
          TextStyle(color: foregroundColor, fontWeight: FontWeight.w900),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, color: foregroundColor, size: 20),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}

class _SweepBorderPainter extends CustomPainter {
  final Animation<double> progress;
  final Color color;
  final double radius;

  _SweepBorderPainter({
    required this.progress,
    required this.color,
    required this.radius,
  }) : super(repaint: progress);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final rRect = RRect.fromRectAndRadius(
      rect.deflate(1),
      Radius.circular(radius),
    );

    final basePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2
      ..color = color.withValues(alpha: 0.22);

    canvas.drawRRect(rRect, basePaint);

    final sweepPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2
      ..strokeCap = StrokeCap.round
      ..shader = SweepGradient(
        startAngle: 0,
        endAngle: math.pi * 2,
        transform: GradientRotation(progress.value * math.pi * 2),
        colors: [
          Colors.transparent,
          color.withValues(alpha: 0.1),
          color,
          Colors.transparent,
        ],
        stops: const [0, 0.42, 0.5, 0.62],
      ).createShader(rect);

    final path = Path()..addRRect(rRect);
    canvas.drawPath(path, sweepPaint);
  }

  @override
  bool shouldRepaint(covariant _SweepBorderPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.radius != radius ||
        oldDelegate.progress != progress;
  }
}

class _SlidingGradientTransform extends GradientTransform {
  final double slidePercent;

  const _SlidingGradientTransform({required this.slidePercent});

  @override
  Matrix4 transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(
      bounds.width * (slidePercent * 2 - 1),
      0,
      0,
    );
  }
}

extension _ButtonOverlayExtension on Widget {
  Widget withOverlay({required Widget child}) {
    return Stack(
      alignment: Alignment.center,
      children: [
        this,
        IgnorePointer(child: child),
      ],
    );
  }
}
