import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/app_background.dart';
import '../../../../core/widgets/gradient_button.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../widgets/auth_form_fields.dart';
import '../widgets/auth_listener.dart';
import '../widgets/auth_premium_widget.dart';

class AuthLuxuryPage extends StatelessWidget {
  const AuthLuxuryPage({super.key});

  static const _gold = Color(0xFFF8D66D);
  static const _blue = Color(0xFF38BDF8);
  static const _purple = Color(0xFF8B5CF6);
  static const _dark = Color(0xFF020617);

  @override
  Widget build(BuildContext context) {
    return AuthListener(
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? _dark
            : const Color(0xFFF6F9FF),
        body: AppBackground(
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(22),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 540),
                  child: GlassPanel(
                    padding: EdgeInsets.zero,
                    borderRadius: 38,
                    child: Stack(
                      children: [
                        Positioned(
                          right: -80,
                          top: -90,
                          child: BlurGlow(
                            size: 220,
                            color: _gold.withValues(alpha: 0.22),
                          ),
                        ),
                        Positioned(
                          left: -80,
                          bottom: -100,
                          child: BlurGlow(
                            size: 220,
                            color: _blue.withValues(alpha: 0.24),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: GlassIconButton(
                                  icon: Icons.close_rounded,
                                  onTap: () => Navigator.pop(context),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(26),
                                  gradient: const LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [_gold, _blue, _purple],
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: _gold.withValues(alpha: 0.26),
                                      blurRadius: 34,
                                      offset: const Offset(0, 16),
                                    ),
                                  ],
                                ),
                                child: const Icon(
                                  Icons.currency_bitcoin_rounded,
                                  color: Colors.white,
                                  size: 36,
                                ),
                              ),
                              const SizedBox(height: 24),
                              PillBadge(
                                label: 'Luxury Glass Access',
                                icon: Icons.diamond_rounded,
                                color: _gold,
                              ),
                              const SizedBox(height: 18),
                              Text(
                                'Enter the\nCrypto Station',
                                style: Theme.of(context).textTheme.displaySmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.w900,
                                      height: 0.98,
                                      letterSpacing: -1.3,
                                    ),
                              ),
                              const SizedBox(height: 14),
                              Text(
                                'Premium authentication screen for a modern crypto dashboard. Same AuthBloc, elevated visual identity.',
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(
                                      height: 1.55,
                                      color: authMutedColor(context),
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              const SizedBox(height: 28),
                              const AuthFormFields(),
                              const SizedBox(height: 20),
                              BlocBuilder<AuthBloc, AuthState>(
                                builder: (context, state) {
                                  return GradientButton(
                                    label: 'Enter Station',
                                    icon: Icons.arrow_forward_rounded,
                                    isLoading: state.isLoading,
                                    onPressed: () {
                                      context.read<AuthBloc>().add(
                                        const AuthSubmitted(),
                                      );
                                    },
                                  );
                                },
                              ),
                              const SizedBox(height: 20),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22),
                                  color: Colors.white.withValues(
                                    alpha:
                                        Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? 0.06
                                        : 0.62,
                                  ),
                                  border: Border.all(
                                    color: Colors.white.withValues(
                                      alpha:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? 0.1
                                          : 0.8,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.info_rounded,
                                      color: _blue,
                                      size: 22,
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text(
                                        'Demo: any email + password minimum 6 chars.',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              height: 1.35,
                                              color: authMutedColor(context),
                                              fontWeight: FontWeight.w700,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
      ),
    );
  }
}
