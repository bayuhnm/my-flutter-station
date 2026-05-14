import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/glass_app_bar.dart';
import '../../../../core/widgets/glass_background.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/widgets/glass_pill.dart';
import '../bloc/showcase_cubit.dart';
import '../widgets/showcase_common_widgets.dart';


class ProfileShowcasePage extends StatelessWidget {
  const ProfileShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const GlassAppBar(title: 'Profile Showcase'),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
          children: const [
            _ProfileHeader(),
            SizedBox(height: 16),
            _ConnectedAccount(),
            SizedBox(height: 16),
            _ProfileMenuSection(),
          ],
        ),
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      borderRadius: 34,
      padding: const EdgeInsets.all(24),
      gradientColors: [
        const Color(0xFFAEC2FF).withOpacity(0.20),
        Colors.white.withOpacity(0.07),
        const Color(0xFFB7FFE0).withOpacity(0.06),
      ],
      child: Column(
        children: [
          Container(
            height: 92,
            width: 92,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.10),
              border: Border.all(color: Colors.white.withOpacity(0.18), width: 1.5),
            ),
            child: const Text('T', style: TextStyle(fontSize: 38, fontWeight: FontWeight.w900)),
          ),
          const SizedBox(height: 16),
          const Text('Triv User', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
          const SizedBox(height: 6),
          Text('Premium Account', style: TextStyle(color: Colors.white.withOpacity(0.62), fontWeight: FontWeight.w700)),
          const SizedBox(height: 16),
          const Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            runSpacing: 10,
            children: [
              GlassTag(text: 'Verified', icon: Icons.verified_rounded, color: Color(0xFF7CFFB2)),
              GlassTag(text: 'Level 3', icon: Icons.workspace_premium_rounded),
            ],
          ),
        ],
      ),
    );
  }
}

class _ConnectedAccount extends StatelessWidget {
  const _ConnectedAccount();

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      icon: Icons.link_rounded,
      title: 'Connected Account',
      subtitle: 'External account connection status.',
      children: const [
        GlassActionTile(
          title: 'Triv Account Connected',
          subtitle: 'Your account is connected and ready to use.',
          icon: Icons.check_circle_rounded,
          color: Color(0xFF7CFFB2),
          trailing: GlassTag(text: 'ACTIVE', color: Color(0xFF7CFFB2)),
        ),
      ],
    );
  }
}

class _ProfileMenuSection extends StatelessWidget {
  const _ProfileMenuSection();

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      icon: Icons.settings_rounded,
      title: 'Profile Menu',
      subtitle: 'Settings, security, notification, and logout row.',
      children: const [
        GlassActionTile(title: 'Account Settings', subtitle: 'Manage personal information.', icon: Icons.person_rounded),
        GlassActionTile(title: 'Security', subtitle: 'Password, PIN, biometric, and devices.', icon: Icons.security_rounded),
        GlassActionTile(title: 'Notifications', subtitle: 'Push notification and email settings.', icon: Icons.notifications_rounded),
        GlassActionTile(title: 'Logout', subtitle: 'Sign out from current device.', icon: Icons.logout_rounded, color: Color(0xFFFF8A8A)),
      ],
    );
  }
}
