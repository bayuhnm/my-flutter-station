import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/widgets/glass_app_bar.dart';
import '../../../../core/widgets/glass_background.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/widgets/glass_pill.dart';

class TextShowcasePage extends StatelessWidget {
  const TextShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const GlassAppBar(title: 'Text Showcase'),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
          children: const [
            _HeaderCard(),
            SizedBox(height: 16),

            _ShowcaseSection(
              icon: Icons.gradient_rounded,
              title: 'Gradient Text',
              subtitle: 'Gradient, silver, neon, and glowing text styles.',
              children: [
                GradientText(
                  'Premium Glassmorphism UI',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.6,
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFFFFFF),
                      Color(0xFFAEC2FF),
                      Color(0xFFB7FFE0),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                SilverGradientText(
                  'SILVER PREMIUM TEXT',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(height: 16),
                NeonText(
                  'Neon Cyber Text',
                  color: Color(0xFFAEC2FF),
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                ),
              ],
            ),

            SizedBox(height: 16),

            _ShowcaseSection(
              icon: Icons.format_size_rounded,
              title: 'Typography Scale',
              subtitle: 'Reusable text hierarchy for app pages.',
              children: [
                AppDisplayText('Display / Hero Text'),
                SizedBox(height: 10),
                AppTitleText('Title Text'),
                SizedBox(height: 10),
                AppSubtitleText('Subtitle text for section descriptions.'),
                SizedBox(height: 10),
                AppBodyText(
                  'Body text is used for readable content, descriptions, and regular page copy.',
                ),
                SizedBox(height: 10),
                AppCaptionText(
                  'Caption text, metadata, helper text, or small labels.',
                ),
              ],
            ),

            SizedBox(height: 16),

            _ShowcaseSection(
              icon: Icons.attach_money_rounded,
              title: 'Amount & Price Text',
              subtitle: 'Currency, price change, and percentage text.',
              children: [
                AmountText('\$128,420.50'),
                SizedBox(height: 12),
                Row(
                  children: [
                    PriceChangeText(value: 2.45),
                    SizedBox(width: 12),
                    PriceChangeText(value: -1.28),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    StatusText.success('Completed'),
                    SizedBox(width: 10),
                    StatusText.warning('Pending'),
                    SizedBox(width: 10),
                    StatusText.error('Failed'),
                  ],
                ),
              ],
            ),

            SizedBox(height: 16),

            _ShowcaseSection(
              icon: Icons.text_fields_rounded,
              title: 'Rich & Special Text',
              subtitle:
                  'Rich text, outlined text, shadow text, and copyable text.',
              children: [
                AppRichTextExample(),
                SizedBox(height: 18),
                OutlinedAppText(
                  'OUTLINED',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(height: 18),
                ShadowAppText(
                  'Soft Shadow Text',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900),
                ),
                SizedBox(height: 18),
                CopyableText(value: 'TRX-2026-000128420'),
              ],
            ),

            SizedBox(height: 16),

            _ShowcaseSection(
              icon: Icons.notes_rounded,
              title: 'Long Text',
              subtitle: 'Expandable text for article, news, and description.',
              children: [
                ExpandableGlassText(
                  text:
                      'This is a reusable expandable text component. You can use it for product descriptions, news previews, research articles, terms and conditions, and profile bios. The text will be collapsed by default and users can expand it when they want to read more content.',
                ),
              ],
            ),

            SizedBox(height: 16),

            _ShowcaseSection(
              icon: Icons.directions_run_rounded,
              title: 'Running Text',
              subtitle:
                  'Marquee text for announcement, banner, or market ticker.',
              children: [
                RunningText(
                  text:
                      'BTC +2.45%   ETH +1.20%   SOL -0.80%   New feature released: Glassmorphism Component Library is now available.',
                ),
              ],
            ),

            SizedBox(height: 16),

            _ShowcaseSection(
              icon: Icons.numbers_rounded,
              title: 'Animated Number Text',
              subtitle: 'Counter animation for dashboard, balance, and stats.',
              children: [
                AnimatedCounterText(prefix: '\$', value: 128420.50, suffix: ''),
              ],
            ),

            SizedBox(height: 16),

            _ShowcaseSection(
              icon: Icons.keyboard_rounded,
              title: 'Typing Text',
              subtitle: 'Animated typing text for onboarding and hero section.',
              children: [
                TypingText(
                  texts: [
                    'Build beautiful Flutter apps.',
                    'Create reusable UI components.',
                    'Ship faster with clean architecture.',
                    'Design glassmorphism pages easily.',
                  ],
                ),
              ],
            ),

            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _HeaderCard extends StatelessWidget {
  const _HeaderCard();

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      borderRadius: 34,
      padding: const EdgeInsets.all(24),
      gradientColors: [
        Colors.white.withOpacity(0.22),
        const Color(0xFFAEC2FF).withOpacity(0.09),
        Colors.white.withOpacity(0.06),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GlassPill(
            text: 'TEXT COMPONENTS',
            icon: Icons.text_fields_rounded,
          ),
          const SizedBox(height: 20),
          const GradientText(
            'Glass Text System',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.8,
            ),
            gradient: LinearGradient(
              colors: [Colors.white, Color(0xFFAEC2FF), Color(0xFFB7FFE0)],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Reusable text components from gradient text, price text, rich text, marquee text, typing text, and animated number text.',
            style: TextStyle(
              height: 1.45,
              color: Colors.white.withOpacity(0.66),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _ShowcaseSection extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final List<Widget> children;

  const _ShowcaseSection({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      borderRadius: 32,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(icon: icon, title: title, subtitle: subtitle),
          const SizedBox(height: 18),
          ...children,
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _SectionTitle({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 44,
          width: 44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            color: Colors.white.withOpacity(0.12),
            border: Border.all(color: Colors.white.withOpacity(0.14)),
          ),
          child: Icon(icon, color: const Color(0xFFAEC2FF)),
        ),
        const SizedBox(width: 13),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.56),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Gradient gradient;
  final TextAlign? textAlign;

  const GradientText(
    this.text, {
    super.key,
    required this.style,
    required this.gradient,
    this.textAlign,
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
        textAlign: textAlign,
        style: style.copyWith(color: Colors.white),
      ),
    );
  }
}

class SilverGradientText extends StatelessWidget {
  final String text;
  final TextStyle style;

  const SilverGradientText(this.text, {super.key, required this.style});

  @override
  Widget build(BuildContext context) {
    return GradientText(
      text,
      style: style,
      gradient: const LinearGradient(
        colors: [
          Color(0xFFFFFFFF),
          Color(0xFF9CA3AF),
          Color(0xFFE5E7EB),
          Color(0xFFFFFFFF),
        ],
      ),
    );
  }
}

class NeonText extends StatelessWidget {
  final String text;
  final Color color;
  final TextStyle style;

  const NeonText(
    this.text, {
    super.key,
    required this.color,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
        color: color,
        shadows: [
          Shadow(color: color.withOpacity(0.85), blurRadius: 18),
          Shadow(color: color.withOpacity(0.45), blurRadius: 36),
        ],
      ),
    );
  }
}

class AppDisplayText extends StatelessWidget {
  final String text;

  const AppDisplayText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w900,
        letterSpacing: -0.8,
      ),
    );
  }
}

class AppTitleText extends StatelessWidget {
  final String text;

  const AppTitleText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w900,
        letterSpacing: -0.3,
      ),
    );
  }
}

class AppSubtitleText extends StatelessWidget {
  final String text;

  const AppSubtitleText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        height: 1.45,
        color: Colors.white.withOpacity(0.72),
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class AppBodyText extends StatelessWidget {
  final String text;

  const AppBodyText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        height: 1.55,
        color: Colors.white.withOpacity(0.64),
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class AppCaptionText extends StatelessWidget {
  final String text;

  const AppCaptionText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12,
        height: 1.4,
        color: Colors.white.withOpacity(0.46),
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class AmountText extends StatelessWidget {
  final String value;

  const AmountText(this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return GradientText(
      value,
      style: const TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w900,
        letterSpacing: -1,
      ),
      gradient: const LinearGradient(
        colors: [Colors.white, Color(0xFFB7FFE0), Color(0xFFAEC2FF)],
      ),
    );
  }
}

class PriceChangeText extends StatelessWidget {
  final double value;

  const PriceChangeText({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    final isPositive = value >= 0;
    final color = isPositive
        ? const Color(0xFF7CFFB2)
        : const Color(0xFFFF8A8A);
    final icon = isPositive
        ? Icons.arrow_upward_rounded
        : Icons.arrow_downward_rounded;
    final prefix = isPositive ? '+' : '';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(99),
        color: color.withOpacity(0.12),
        border: Border.all(color: color.withOpacity(0.28)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 15, color: color),
          const SizedBox(width: 5),
          Text(
            '$prefix${value.toStringAsFixed(2)}%',
            style: TextStyle(color: color, fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }
}

class StatusText extends StatelessWidget {
  final String text;
  final Color color;
  final IconData icon;

  const StatusText._({
    required this.text,
    required this.color,
    required this.icon,
  });

  const StatusText.success(String text, {key})
    : this._(
        text: text,
        color: const Color(0xFF7CFFB2),
        icon: Icons.check_circle_rounded,
      );

  const StatusText.warning(String text, {key})
    : this._(
        text: text,
        color: const Color(0xFFFFD166),
        icon: Icons.schedule_rounded,
      );

  const StatusText.error(String text, {key})
    : this._(
        text: text,
        color: const Color(0xFFFF8A8A),
        icon: Icons.error_rounded,
      );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 15, color: color),
        const SizedBox(width: 5),
        Text(
          text,
          style: TextStyle(color: color, fontWeight: FontWeight.w900),
        ),
      ],
    );
  }
}

class AppRichTextExample extends StatelessWidget {
  const AppRichTextExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'You have ',
        style: TextStyle(
          color: Colors.white.withOpacity(0.66),
          fontWeight: FontWeight.w600,
          height: 1.45,
        ),
        children: const [
          TextSpan(
            text: '3 premium features ',
            style: TextStyle(
              color: Color(0xFFAEC2FF),
              fontWeight: FontWeight.w900,
            ),
          ),
          TextSpan(text: 'available in this component library.'),
        ],
      ),
    );
  }
}

class OutlinedAppText extends StatelessWidget {
  final String text;
  final TextStyle style;

  const OutlinedAppText(this.text, {super.key, required this.style});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: style.copyWith(
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 1.8
              ..color = const Color(0xFFAEC2FF).withOpacity(0.85),
          ),
        ),
        Text(
          text,
          style: style.copyWith(color: Colors.white.withOpacity(0.08)),
        ),
      ],
    );
  }
}

class ShadowAppText extends StatelessWidget {
  final String text;
  final TextStyle style;

  const ShadowAppText(this.text, {super.key, required this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
        color: Colors.white,
        shadows: [
          Shadow(
            color: const Color(0xFFAEC2FF).withOpacity(0.45),
            offset: const Offset(0, 8),
            blurRadius: 24,
          ),
        ],
      ),
    );
  }
}

class CopyableText extends StatelessWidget {
  final String value;

  const CopyableText({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: () {
        Clipboard.setData(ClipboardData(text: value));

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Copied to clipboard')));
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.07),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: Colors.white.withOpacity(0.12)),
        ),
        child: Row(
          children: [
            const Icon(Icons.copy_rounded, color: Color(0xFFAEC2FF)),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.2,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: Colors.white.withOpacity(0.7),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpandableGlassText extends StatefulWidget {
  final String text;

  const ExpandableGlassText({super.key, required this.text});

  @override
  State<ExpandableGlassText> createState() => _ExpandableGlassTextState();
}

class _ExpandableGlassTextState extends State<ExpandableGlassText> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 220),
          crossFadeState: expanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          firstChild: Text(
            widget.text,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white.withOpacity(0.66),
              height: 1.55,
              fontWeight: FontWeight.w600,
            ),
          ),
          secondChild: Text(
            widget.text,
            style: TextStyle(
              color: Colors.white.withOpacity(0.66),
              height: 1.55,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 12),
        InkWell(
          onTap: () => setState(() => expanded = !expanded),
          borderRadius: BorderRadius.circular(99),
          child: GlassPill(
            text: expanded ? 'Show Less' : 'Read More',
            icon: expanded
                ? Icons.keyboard_arrow_up_rounded
                : Icons.keyboard_arrow_down_rounded,
          ),
        ),
      ],
    );
  }
}

class RunningText extends StatefulWidget {
  final String text;

  const RunningText({super.key, required this.text});

  @override
  State<RunningText> createState() => _RunningTextState();
}

class _RunningTextState extends State<RunningText> {
  late final ScrollController _scrollController;
  Timer? _timer;
  double _position = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startRunning();
    });
  }

  void _startRunning() {
    _timer = Timer.periodic(const Duration(milliseconds: 28), (_) {
      if (!_scrollController.hasClients) return;

      final maxScroll = _scrollController.position.maxScrollExtent;
      if (maxScroll <= 0) return;

      _position += 1.2;

      if (_position >= maxScroll) {
        _position = 0;
        _scrollController.jumpTo(0);
      } else {
        _scrollController.jumpTo(_position);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.07),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.white.withOpacity(0.12)),
      ),
      child: Row(
        children: [
          const Icon(Icons.campaign_rounded, color: Color(0xFFAEC2FF)),
          const SizedBox(width: 12),
          Expanded(
            child: ListView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Center(
                  child: Text(
                    '${widget.text}     ${widget.text}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TypingText extends StatefulWidget {
  final List<String> texts;

  const TypingText({super.key, required this.texts});

  @override
  State<TypingText> createState() => _TypingTextState();
}

class _TypingTextState extends State<TypingText> {
  int sentenceIndex = 0;
  int charIndex = 0;
  bool deleting = false;
  Timer? timer;

  String get currentSentence => widget.texts[sentenceIndex];

  String get visibleText {
    return currentSentence.substring(0, charIndex);
  }

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  void _startTyping() {
    timer = Timer.periodic(const Duration(milliseconds: 70), (_) {
      if (!mounted) return;

      setState(() {
        if (!deleting) {
          if (charIndex < currentSentence.length) {
            charIndex++;
          } else {
            deleting = true;
          }
        } else {
          if (charIndex > 0) {
            charIndex--;
          } else {
            deleting = false;
            sentenceIndex = (sentenceIndex + 1) % widget.texts.length;
          }
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.07),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.12)),
      ),
      child: Row(
        children: [
          const Icon(Icons.auto_awesome_rounded, color: Color(0xFFAEC2FF)),
          const SizedBox(width: 12),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: visibleText,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                      height: 1.4,
                    ),
                  ),
                  const TextSpan(
                    text: '|',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFFAEC2FF),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedCounterText extends StatelessWidget {
  final String prefix;
  final double value;
  final String suffix;

  const AnimatedCounterText({
    super.key,
    required this.prefix,
    required this.value,
    required this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: value),
      duration: const Duration(milliseconds: 1200),
      curve: Curves.easeOutCubic,
      builder: (context, currentValue, child) {
        return GradientText(
          '$prefix${_formatNumber(currentValue)}$suffix',
          style: const TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w900,
            letterSpacing: -1,
          ),
          gradient: const LinearGradient(
            colors: [Colors.white, Color(0xFFAEC2FF), Color(0xFFB7FFE0)],
          ),
        );
      },
    );
  }

  String _formatNumber(double number) {
    final fixed = number.toStringAsFixed(2);
    final parts = fixed.split('.');
    final integer = parts[0];
    final decimal = parts[1];

    final buffer = StringBuffer();

    for (int i = 0; i < integer.length; i++) {
      final reverseIndex = integer.length - i;

      buffer.write(integer[i]);

      if (reverseIndex > 1 && reverseIndex % 3 == 1) {
        buffer.write(',');
      }
    }

    return '${buffer.toString()}.$decimal';
  }
}
