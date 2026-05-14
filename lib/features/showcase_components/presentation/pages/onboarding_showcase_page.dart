import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/glass_app_bar.dart';
import '../../../../core/widgets/glass_background.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/widgets/glass_pill.dart';
import '../bloc/showcase_cubit.dart';
import '../widgets/showcase_common_widgets.dart';


class OnboardingShowcasePage extends StatelessWidget {
  const OnboardingShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ShowcaseCubit(),
      child: GlassBackground(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: const GlassAppBar(title: 'Onboarding Showcase'),
          body: BlocBuilder<ShowcaseCubit, ShowcaseState>(
            builder: (context, state) {
              final pages = [
                ('Build Faster', 'Reusable components for production apps.', Icons.rocket_launch_rounded),
                ('Design Cleaner', 'Glassmorphism UI with consistent spacing.', Icons.auto_awesome_rounded),
                ('Ship Better', 'Ready for auth, wallet, chart, and profile screens.', Icons.verified_rounded),
              ];
              final current = pages[state.selectedIndex];

              return ListView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
                children: [
                  const ShowcaseHeaderCard(
                    pill: 'ONBOARDING',
                    title: 'Welcome Flow Components',
                    subtitle: 'Onboarding card, feature highlight, carousel indicator, permission request, and get started CTA.',
                    icon: Icons.rocket_launch_rounded,
                  ),
                  const SizedBox(height: 16),
                  GlassCard(
                    borderRadius: 34,
                    padding: const EdgeInsets.all(26),
                    child: Column(
                      children: [
                        Container(
                          height: 118,
                          width: 118,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFFAEC2FF).withOpacity(0.14),
                            border: Border.all(color: const Color(0xFFAEC2FF).withOpacity(0.30)),
                          ),
                          child: Icon(current.$3, color: const Color(0xFFAEC2FF), size: 58),
                        ),
                        const SizedBox(height: 24),
                        Text(current.$1, textAlign: TextAlign.center, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w900, letterSpacing: -0.6)),
                        const SizedBox(height: 8),
                        Text(current.$2, textAlign: TextAlign.center, style: TextStyle(color: Colors.white.withOpacity(0.62), height: 1.45, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 22),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(pages.length, (index) {
                            final active = state.selectedIndex == index;
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              height: 8,
                              width: active ? 28 : 8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(99),
                                color: active ? const Color(0xFFAEC2FF) : Colors.white.withOpacity(0.20),
                              ),
                            );
                          }),
                        ),
                        const SizedBox(height: 24),
                        GlassMiniButton(
                          text: state.selectedIndex == pages.length - 1 ? 'Get Started' : 'Next',
                          icon: Icons.arrow_forward_rounded,
                          onTap: () => context.read<ShowcaseCubit>().selectIndex((state.selectedIndex + 1) % pages.length),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const ShowcaseSection(
                    icon: Icons.location_on_rounded,
                    title: 'Permission Request',
                    subtitle: 'Permission card example.',
                    children: [
                      GlassActionTile(
                        title: 'Allow Location Access',
                        subtitle: 'We use location to personalize nearby services.',
                        icon: Icons.my_location_rounded,
                        trailing: GlassTag(text: 'ALLOW'),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
