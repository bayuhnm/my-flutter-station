import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/router/route_names.dart';
import '../../../../core/widgets/glass_app_bar.dart';
import '../../../../core/widgets/glass_background.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/widgets/glass_pill.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_status.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _logout(BuildContext context) {
    context.read<AuthBloc>().add(const AuthLogoutRequested());
    Navigator.pushNamedAndRemoveUntil(
      context,
      RouteNames.login,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GlassBackground(
      child: BlocListener<AuthBloc, AuthState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status == AuthStatus.unauthenticated) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              RouteNames.login,
              (route) => false,
            );
          }
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: GlassAppBar(
            title: 'Dashboard',
            actions: [
              IconButton(
                onPressed: () => _logout(context),
                icon: const Icon(Icons.logout_rounded),
              ),
            ],
          ),
          body: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              final user = state.user;
              return ListView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
                children: [
                  _HeroSection(
                    name: user?.name ?? 'Builder',
                    email: user?.email ?? 'demo mode',
                  ),
                  const SizedBox(height: 18),
                  _MenuCard(
                    icon: Icons.dynamic_feed_rounded,
                    title: 'Posts Infinite Scroll',
                    subtitle:
                        'Public API list with pagination, refresh, loading more, and error state.',
                    badge: 'API MODULE',
                    onTap: () => Navigator.pushNamed(context, RouteNames.posts),
                  ),
                  const SizedBox(height: 14),
                  _MenuCard(
                    icon: Icons.tune_rounded,
                    title: 'Input Showcase',
                    subtitle:
                        'Text, password, textarea, radio, dropdown, checkbox, switch, slider, date picker.',
                    badge: 'FORM UI',
                    onTap: () =>
                        Navigator.pushNamed(context, RouteNames.inputShowcase),
                  ),
                  const SizedBox(height: 14),
                  const _InfoGrid(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  final String name;
  final String email;
  const _HeroSection({required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(24),
      borderRadius: 34,
      gradientColors: [
        Colors.white.withOpacity(0.20),
        const Color(0xFFAEC2FF).withOpacity(0.08),
        Colors.white.withOpacity(0.06),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GlassPill(
            text: 'MY FLUTTER STATION',
            icon: Icons.blur_on_rounded,
          ),
          const SizedBox(height: 24),
          Text(
            'Hi, $name 👋',
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.9,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            email,
            style: TextStyle(
              color: Colors.white.withOpacity(0.66),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: const [
              Expanded(
                child: _StatItem(label: 'Pattern', value: 'Clean'),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _StatItem(label: 'State', value: 'Bloc'),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _StatItem(label: 'Style', value: 'Glass'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MenuCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String badge;
  final VoidCallback onTap;
  const _MenuCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.badge,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      onTap: onTap,
      padding: const EdgeInsets.all(18),
      borderRadius: 30,
      child: Row(
        children: [
          Container(
            width: 62,
            height: 62,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(23),
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.88),
                  const Color(0xFFAEC2FF).withOpacity(0.64),
                  const Color(0xFF55F7E6).withOpacity(0.34),
                ],
              ),
            ),
            child: Icon(icon, color: const Color(0xFF111827)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GlassPill(text: badge),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.2,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: TextStyle(
                    height: 1.42,
                    color: Colors.white.withOpacity(0.62),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          const Icon(Icons.arrow_forward_ios_rounded, size: 17),
        ],
      ),
    );
  }
}

class _InfoGrid extends StatelessWidget {
  const _InfoGrid();
  @override
  Widget build(BuildContext context) => Row(
    children: const [
      Expanded(
        child: _SmallCard(
          icon: Icons.route_rounded,
          title: 'Router',
          subtitle: 'RouteNames',
        ),
      ),
      SizedBox(width: 14),
      Expanded(
        child: _SmallCard(
          icon: Icons.extension_rounded,
          title: 'DI',
          subtitle: 'GetIt',
        ),
      ),
    ],
  );
}

class _SmallCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  const _SmallCard({
    required this.icon,
    required this.title,
    required this.subtitle,
  });
  @override
  Widget build(BuildContext context) => GlassCard(
    borderRadius: 28,
    padding: const EdgeInsets.all(18),
    child: SizedBox(
      height: 106,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFFAEC2FF)),
          const Spacer(),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              color: Colors.white.withOpacity(0.58),
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    ),
  );
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  const _StatItem({required this.label, required this.value});
  @override
  Widget build(BuildContext context) => GlassCard(
    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
    borderRadius: 20,
    child: Column(
      children: [
        Text(value, style: const TextStyle(fontWeight: FontWeight.w900)),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: Colors.white.withOpacity(0.60),
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    ),
  );
}
