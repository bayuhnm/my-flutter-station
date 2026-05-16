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

class AuthNeonCardPage extends StatelessWidget {
  const AuthNeonCardPage({super.key});

  static const _blue = Color(0xFF38BDF8);
  static const _cyan = Color(0xFF22D3EE);
  static const _purple = Color(0xFF8B5CF6);
  static const _green = Color(0xFF22C55E);
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
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(22, 18, 22, 28),
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: GlassIconButton(
                    icon: Icons.arrow_back_rounded,
                    onTap: () => Navigator.pop(context),
                  ),
                ),
                const SizedBox(height: 34),
                PillBadge(
                  label: 'Cyber Terminal',
                  icon: Icons.terminal_rounded,
                  color: _cyan,
                ),
                const SizedBox(height: 18),
                Text(
                  'NEON\nACCESS',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.4,
                    height: 0.9,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  'A bold authentication experience for futuristic exchange, market, and futures dashboards.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    height: 1.48,
                    color: authMutedColor(context),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 30),
                GlassPanel(
                  borderRadius: 34,
                  padding: EdgeInsets.zero,
                  child: Stack(
                    children: [
                      Positioned(
                        top: -70,
                        right: -70,
                        child: BlurGlow(
                          size: 190,
                          color: _blue.withValues(alpha: 0.32),
                        ),
                      ),
                      Positioned(
                        bottom: -90,
                        left: -90,
                        child: BlurGlow(
                          size: 190,
                          color: _purple.withValues(alpha: 0.2),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(22),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                _TerminalDot(color: _green),
                                const SizedBox(width: 7),
                                _TerminalDot(color: _blue),
                                const SizedBox(width: 7),
                                _TerminalDot(color: _purple),
                                const Spacer(),
                                Text(
                                  'SECURE_NODE',
                                  style: Theme.of(context).textTheme.labelSmall
                                      ?.copyWith(
                                        color: _cyan,
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 1.2,
                                      ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 22),
                            const AuthFormFields(),
                            const SizedBox(height: 20),
                            BlocBuilder<AuthBloc, AuthState>(
                              builder: (context, state) {
                                return GradientButton(
                                  label: 'Authorize Wallet',
                                  icon: Icons.security_rounded,
                                  isLoading: state.isLoading,
                                  onPressed: () {
                                    context.read<AuthBloc>().add(
                                      const AuthSubmitted(),
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                Row(
                  children: [
                    Expanded(
                      child: _NeonInfoCard(
                        title: 'Encrypted',
                        value: '256-bit',
                        icon: Icons.lock_rounded,
                        color: _blue,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _NeonInfoCard(
                        title: 'Network',
                        value: 'Live',
                        icon: Icons.sensors_rounded,
                        color: _green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TerminalDot extends StatelessWidget {
  final Color color;

  const _TerminalDot({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 9,
      height: 9,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        boxShadow: [
          BoxShadow(color: color.withValues(alpha: 0.5), blurRadius: 14),
        ],
      ),
    );
  }
}

class _NeonInfoCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _NeonInfoCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      borderRadius: 26,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 14),
          Text(
            value,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: authMutedColor(context),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
