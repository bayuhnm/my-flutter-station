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

class AuthMinimalCryptoPage extends StatelessWidget {
  const AuthMinimalCryptoPage({super.key});

  static const _blue = Color(0xFF38BDF8);
  static const _green = Color(0xFF22C55E);
  static const _dark = Color(0xFF020617);

  @override
  Widget build(BuildContext context) {
    return AuthListener(
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? _dark
            : const Color(0xFFF7FAFF),
        body: AppBackground(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(22, 18, 22, 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GlassIconButton(
                    icon: Icons.arrow_back_rounded,
                    onTap: () => Navigator.pop(context),
                  ),
                  const Spacer(),
                  PillBadge(
                    label: 'Minimal Crypto',
                    icon: Icons.auto_awesome_rounded,
                    color: _green,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Welcome\nback.',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                      height: 0.92,
                      letterSpacing: -1.6,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    'Clean authentication page with premium spacing, soft glass surfaces, and shared monostate AuthBloc.',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      height: 1.48,
                      color: authMutedColor(context),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 28),
                  GlassPanel(
                    borderRadius: 32,
                    padding: const EdgeInsets.all(22),
                    child: Column(
                      children: [
                        const AuthFormFields(),
                        const SizedBox(height: 20),
                        BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            return GradientButton(
                              label: 'Continue',
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
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      Expanded(
                        child: _MinimalFeature(
                          label: 'Fast',
                          icon: Icons.flash_on_rounded,
                          color: _blue,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _MinimalFeature(
                          label: 'Secure',
                          icon: Icons.verified_user_rounded,
                          color: _green,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MinimalFeature extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;

  const _MinimalFeature({
    required this.label,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      borderRadius: 24,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      child: Row(
        children: [
          Icon(icon, color: color, size: 22),
          const SizedBox(width: 10),
          Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }
}
