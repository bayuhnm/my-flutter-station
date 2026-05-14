import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/router/route_names.dart';
import '../../../../core/widgets/glass_background.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/widgets/glass_pill.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_status.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassBackground(
      child: BlocListener<AuthBloc, AuthState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status == AuthStatus.authenticated ||
              state.status == AuthStatus.unauthenticated) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              RouteNames.login,
              (route) => false,
            );
          }
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: GlassCard(
              padding: const EdgeInsets.all(30),
              borderRadius: 36,
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _GlassLogo(),
                  SizedBox(height: 24),
                  GlassPill(
                    text: 'CLEAN ARCHITECTURE',
                    icon: Icons.auto_awesome_rounded,
                  ),
                  SizedBox(height: 18),
                  Text(
                    'My Flutter Station',
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -0.7,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Frosted starter template',
                    style: TextStyle(
                      color: Color(0xFFCAD6F7),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 28),
                  CircularProgressIndicator(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GlassLogo extends StatelessWidget {
  const _GlassLogo();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 82,
      height: 82,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.92),
            const Color(0xFFAEC2FF).withOpacity(0.72),
            const Color(0xFF55F7E6).withOpacity(0.46),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFAEC2FF).withOpacity(0.38),
            blurRadius: 44,
            offset: const Offset(0, 22),
          ),
        ],
      ),
      child: const Icon(
        Icons.rocket_launch_rounded,
        color: Color(0xFF111827),
        size: 38,
      ),
    );
  }
}
