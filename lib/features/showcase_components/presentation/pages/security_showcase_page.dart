import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/glass_app_bar.dart';
import '../../../../core/widgets/glass_background.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/widgets/glass_pill.dart';
import '../bloc/showcase_cubit.dart';
import '../widgets/showcase_common_widgets.dart';


class SecurityShowcasePage extends StatelessWidget {
  const SecurityShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const GlassAppBar(title: 'Security Showcase'),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
          children: const [
            ShowcaseHeaderCard(
              pill: 'SECURITY',
              title: 'Permission & Security Components',
              subtitle: 'Permission cards, security warning, 2FA card, device session, password strength, and privacy notice.',
              icon: Icons.security_rounded,
            ),
            SizedBox(height: 16),
            _PermissionSection(),
            SizedBox(height: 16),
            _PasswordStrengthSection(),
            SizedBox(height: 16),
            _DeviceSessionSection(),
          ],
        ),
      ),
    );
  }
}

class _PermissionSection extends StatelessWidget {
  const _PermissionSection();

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      icon: Icons.privacy_tip_rounded,
      title: 'Permission Cards',
      subtitle: 'Permission request and privacy notice.',
      children: const [
        GlassActionTile(title: 'Camera Permission', subtitle: 'Required for document upload and QR scan.', icon: Icons.camera_alt_rounded),
        GlassActionTile(title: 'Location Permission', subtitle: 'Improve fraud detection and nearby service.', icon: Icons.location_on_rounded),
        GlassActionTile(title: 'Security Warning', subtitle: 'Never share your OTP or password.', icon: Icons.warning_rounded, color: Color(0xFFFFD166)),
      ],
    );
  }
}

class _PasswordStrengthSection extends StatelessWidget {
  const _PasswordStrengthSection();

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      icon: Icons.password_rounded,
      title: 'Password Strength',
      subtitle: 'Password requirement indicator.',
      children: [
        const Text('Strong Password', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(99),
          child: LinearProgressIndicator(
            value: 0.82,
            minHeight: 10,
            backgroundColor: Colors.white.withOpacity(0.08),
            valueColor: const AlwaysStoppedAnimation(Color(0xFF7CFFB2)),
          ),
        ),
        const SizedBox(height: 12),
        const Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            GlassTag(text: '8+ chars', icon: Icons.check_rounded, color: Color(0xFF7CFFB2)),
            GlassTag(text: 'Number', icon: Icons.check_rounded, color: Color(0xFF7CFFB2)),
            GlassTag(text: 'Symbol', icon: Icons.check_rounded, color: Color(0xFF7CFFB2)),
          ],
        ),
      ],
    );
  }
}

class _DeviceSessionSection extends StatelessWidget {
  const _DeviceSessionSection();

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      icon: Icons.devices_rounded,
      title: 'Device Session',
      subtitle: 'Logged-in devices and revoke action.',
      children: const [
        GlassActionTile(title: 'Chrome on macOS', subtitle: 'Current device · Jakarta', icon: Icons.laptop_mac_rounded, trailing: GlassTag(text: 'ACTIVE', color: Color(0xFF7CFFB2))),
        GlassActionTile(title: 'Android Device', subtitle: 'Last active 2 hours ago', icon: Icons.phone_android_rounded, color: Color(0xFFFFD166)),
      ],
    );
  }
}
