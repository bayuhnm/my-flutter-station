import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/glass_app_bar.dart';
import '../../../../core/widgets/glass_background.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/widgets/glass_pill.dart';
import '../bloc/showcase_cubit.dart';
import '../widgets/showcase_common_widgets.dart';


class UtilityShowcasePage extends StatelessWidget {
  const UtilityShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const GlassAppBar(title: 'Utility Showcase'),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
          children: const [
            ShowcaseHeaderCard(
              pill: 'UTILITY',
              title: 'Small Reusable Components',
              subtitle: 'Divider, dotted divider, info row, key value row, copy button, timer, countdown, rating, progress, and tooltip.',
              icon: Icons.build_circle_rounded,
            ),
            SizedBox(height: 16),
            _DividerSection(),
            SizedBox(height: 16),
            _InfoRowsSection(),
            SizedBox(height: 16),
            _RatingProgressSection(),
            SizedBox(height: 16),
            _CountdownSection(),
          ],
        ),
      ),
    );
  }
}

class _DividerSection extends StatelessWidget {
  const _DividerSection();

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      icon: Icons.horizontal_rule_rounded,
      title: 'Divider',
      subtitle: 'Solid and dotted divider.',
      children: const [
        Text('Solid divider', style: TextStyle(fontWeight: FontWeight.w900)),
        SizedBox(height: 10),
        GlassDivider(),
        SizedBox(height: 18),
        Text('Dotted divider', style: TextStyle(fontWeight: FontWeight.w900)),
        SizedBox(height: 10),
        DottedDivider(),
      ],
    );
  }
}

class _InfoRowsSection extends StatelessWidget {
  const _InfoRowsSection();

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      icon: Icons.info_rounded,
      title: 'Info Rows',
      subtitle: 'Key value and copy row.',
      children: const [
        KeyValueRow(label: 'Username', value: 'triv_user'),
        GlassDivider(),
        KeyValueRow(label: 'Account Level', value: 'Premium', valueColor: Color(0xFFAEC2FF)),
        GlassDivider(),
        GlassActionTile(title: 'Copy Referral Code', subtitle: 'TRIV-2026-ABC', icon: Icons.copy_rounded),
      ],
    );
  }
}

class _RatingProgressSection extends StatelessWidget {
  const _RatingProgressSection();

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      icon: Icons.star_rounded,
      title: 'Rating & Progress',
      subtitle: 'Rating stars and progress bar.',
      children: [
        Row(
          children: List.generate(5, (index) => Icon(Icons.star_rounded, color: index < 4 ? const Color(0xFFFFD166) : Colors.white.withOpacity(0.18))),
        ),
        const SizedBox(height: 16),
        ClipRRect(
          borderRadius: BorderRadius.circular(99),
          child: LinearProgressIndicator(
            value: 0.68,
            minHeight: 10,
            backgroundColor: Colors.white.withOpacity(0.08),
            valueColor: const AlwaysStoppedAnimation(Color(0xFFAEC2FF)),
          ),
        ),
      ],
    );
  }
}

class _CountdownSection extends StatelessWidget {
  const _CountdownSection();

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      icon: Icons.timer_rounded,
      title: 'Timer & Tooltip',
      subtitle: 'Countdown badge and tooltip helper.',
      children: [
        Row(
          children: const [
            GlassTag(text: 'Expires in 02:59', icon: Icons.timer_rounded, color: Color(0xFFFFD166)),
            SizedBox(width: 10),
            Tooltip(
              message: 'This is a tooltip helper.',
              child: GlassTag(text: 'Hover Info', icon: Icons.help_rounded),
            ),
          ],
        ),
      ],
    );
  }
}
