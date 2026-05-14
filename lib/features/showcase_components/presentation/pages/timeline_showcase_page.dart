import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/glass_app_bar.dart';
import '../../../../core/widgets/glass_background.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/widgets/glass_pill.dart';
import '../bloc/showcase_cubit.dart';
import '../widgets/showcase_common_widgets.dart';


class TimelineShowcasePage extends StatelessWidget {
  const TimelineShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const GlassAppBar(title: 'Timeline Showcase'),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
          children: const [
            ShowcaseHeaderCard(
              pill: 'TIMELINE SYSTEM',
              title: 'Progress & Activity Timeline',
              subtitle: 'Vertical timeline components for transaction, order, KYC, delivery, and step tracking.',
              icon: Icons.timeline_rounded,
            ),
            SizedBox(height: 16),
            _TimelineSection(),
            SizedBox(height: 16),
            _HorizontalStepperSection(),
          ],
        ),
      ),
    );
  }
}

class _TimelineSection extends StatelessWidget {
  const _TimelineSection();

  @override
  Widget build(BuildContext context) {
    final items = [
      ('Submitted', 'Your request has been submitted.', Icons.upload_rounded, const Color(0xFF7CFFB2), true),
      ('In Review', 'Team is checking your document.', Icons.manage_search_rounded, const Color(0xFFFFD166), true),
      ('Approved', 'Your request is ready to continue.', Icons.verified_rounded, const Color(0xFFAEC2FF), false),
    ];

    return ShowcaseSection(
      icon: Icons.format_list_bulleted_rounded,
      title: 'Vertical Timeline',
      subtitle: 'Transaction or verification progress.',
      children: [
        ...List.generate(items.length, (index) {
          final item = items[index];
          return _TimelineItem(
            title: item.$1,
            subtitle: item.$2,
            icon: item.$3,
            color: item.$4,
            showLine: index != items.length - 1,
            active: item.$5,
          );
        }),
      ],
    );
  }
}

class _TimelineItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final bool showLine;
  final bool active;

  const _TimelineItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.showLine,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              height: 42,
              width: 42,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color.withOpacity(active ? 0.18 : 0.08),
                border: Border.all(color: color.withOpacity(active ? 0.38 : 0.16)),
              ),
              child: Icon(icon, size: 20, color: color),
            ),
            if (showLine)
              Container(
                height: 52,
                width: 2,
                color: Colors.white.withOpacity(0.12),
              ),
          ],
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
              const SizedBox(height: 5),
              Text(subtitle, style: TextStyle(color: Colors.white.withOpacity(0.58), fontWeight: FontWeight.w600)),
            ]),
          ),
        ),
      ],
    );
  }
}

class _HorizontalStepperSection extends StatelessWidget {
  const _HorizontalStepperSection();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ShowcaseCubit(),
      child: BlocBuilder<ShowcaseCubit, ShowcaseState>(
        builder: (context, state) {
          return ShowcaseSection(
            icon: Icons.linear_scale_rounded,
            title: 'Stepper Timeline',
            subtitle: 'Bloc monostate selected step.',
            children: [
              Row(
                children: List.generate(4, (index) {
                  final active = index <= state.selectedStep;
                  return Expanded(
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () => context.read<ShowcaseCubit>().setStep(index),
                          child: Container(
                            height: 34,
                            width: 34,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: active ? const Color(0xFFAEC2FF).withOpacity(0.22) : Colors.white.withOpacity(0.06),
                              border: Border.all(color: active ? const Color(0xFFAEC2FF) : Colors.white.withOpacity(0.14)),
                            ),
                            child: Text('${index + 1}', style: const TextStyle(fontWeight: FontWeight.w900)),
                          ),
                        ),
                        if (index != 3)
                          Expanded(
                            child: Container(
                              height: 2,
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              color: active ? const Color(0xFFAEC2FF).withOpacity(0.55) : Colors.white.withOpacity(0.10),
                            ),
                          ),
                      ],
                    ),
                  );
                }),
              ),
              const SizedBox(height: 18),
              GlassMiniButton(
                text: 'Next Step',
                icon: Icons.arrow_forward_rounded,
                onTap: () => context.read<ShowcaseCubit>().nextStep(maxStep: 3),
              ),
            ],
          );
        },
      ),
    );
  }
}
