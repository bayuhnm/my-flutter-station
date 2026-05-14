import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/glass_app_bar.dart';
import '../../../../core/widgets/glass_background.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/widgets/glass_pill.dart';
import '../bloc/showcase_cubit.dart';
import '../widgets/showcase_common_widgets.dart';


class AuthShowcasePage extends StatelessWidget {
  const AuthShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const GlassAppBar(title: 'Auth Showcase'),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
          children: const [
            ShowcaseHeaderCard(
              pill: 'AUTH SYSTEM',
              title: 'Login & Security Forms',
              subtitle: 'Login, register, forgot password, OTP, PIN input, biometric login, and social login components.',
              icon: Icons.lock_rounded,
            ),
            SizedBox(height: 16),
            _LoginCard(),
            SizedBox(height: 16),
            _OtpCard(),
            SizedBox(height: 16),
            _SocialLoginCard(),
          ],
        ),
      ),
    );
  }
}

class _LoginCard extends StatelessWidget {
  const _LoginCard();

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      icon: Icons.login_rounded,
      title: 'Login Form',
      subtitle: 'Email and password form preview.',
      children: const [
        _GlassInput(label: 'Email', hint: 'you@example.com', icon: Icons.email_rounded),
        SizedBox(height: 12),
        _GlassInput(label: 'Password', hint: '••••••••', icon: Icons.lock_rounded, obscure: true),
        SizedBox(height: 14),
        Row(
          children: [
            Expanded(child: GlassMiniButton(text: 'Login', icon: Icons.arrow_forward_rounded)),
            SizedBox(width: 12),
            GlassMiniButton(text: 'Forgot?', icon: Icons.help_rounded),
          ],
        ),
      ],
    );
  }
}

class _OtpCard extends StatelessWidget {
  const _OtpCard();

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      icon: Icons.password_rounded,
      title: 'OTP / PIN Input',
      subtitle: 'Verification input boxes.',
      children: [
        Row(
          children: List.generate(6, (index) {
            return Expanded(
              child: Container(
                height: 54,
                margin: EdgeInsets.only(right: index == 5 ? 0 : 8),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.white.withOpacity(0.07),
                  border: Border.all(color: index < 4 ? const Color(0xFFAEC2FF).withOpacity(0.42) : Colors.white.withOpacity(0.12)),
                ),
                child: Text(index < 4 ? '${index + 1}' : '', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class _SocialLoginCard extends StatelessWidget {
  const _SocialLoginCard();

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      icon: Icons.fingerprint_rounded,
      title: 'Login Options',
      subtitle: 'Biometric and social login buttons.',
      children: const [
        GlassActionTile(title: 'Login with Biometric', subtitle: 'Use Face ID or fingerprint.', icon: Icons.fingerprint_rounded),
        GlassActionTile(title: 'Continue with Google', subtitle: 'Social authentication button.', icon: Icons.g_mobiledata_rounded, color: Color(0xFFB7FFE0)),
        GlassActionTile(title: 'Create New Account', subtitle: 'Register account CTA.', icon: Icons.person_add_rounded, color: Color(0xFFFFD166)),
      ],
    );
  }
}

class _GlassInput extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final bool obscure;

  const _GlassInput({
    required this.label,
    required this.hint,
    required this.icon,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.white.withOpacity(0.07),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(22), borderSide: BorderSide(color: Colors.white.withOpacity(0.12))),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(22), borderSide: BorderSide(color: Colors.white.withOpacity(0.12))),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(22), borderSide: const BorderSide(color: Color(0xFFAEC2FF))),
      ),
    );
  }
}
