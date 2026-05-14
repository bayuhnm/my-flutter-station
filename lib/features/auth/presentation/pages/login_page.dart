import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/router/route_names.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/glass_background.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/widgets/glass_pill.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_status.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController(
    text: 'demo@example.com',
  );
  final TextEditingController passwordController = TextEditingController(
    text: 'password',
  );

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _login() => context.read<AuthBloc>().add(
    AuthLoginSubmitted(
      email: emailController.text,
      password: passwordController.text,
    ),
  );
  void _continueAsDemo() => Navigator.pushNamedAndRemoveUntil(
    context,
    RouteNames.home,
    (route) => false,
  );

  @override
  Widget build(BuildContext context) {
    return GlassBackground(
      child: BlocConsumer<AuthBloc, AuthState>(
        listenWhen: (previous, current) =>
            previous.status != current.status ||
            previous.error != current.error,
        listener: (context, state) {
          if (state.status == AuthStatus.authenticated) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              RouteNames.home,
              (route) => false,
            );
          }
          if (state.status == AuthStatus.failure && state.error != null) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error!.message)));
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(22),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 480),
                    child: GlassCard(
                      padding: const EdgeInsets.all(24),
                      borderRadius: 36,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const _LoginHeader(),
                          const SizedBox(height: 30),
                          AppTextField(
                            controller: emailController,
                            label: 'Email',
                            hintText: 'you@example.com',
                            keyboardType: TextInputType.emailAddress,
                            prefixIcon: Icons.mail_outline_rounded,
                          ),
                          const SizedBox(height: 16),
                          AppTextField(
                            controller: passwordController,
                            label: 'Password',
                            obscureText: true,
                            prefixIcon: Icons.lock_outline_rounded,
                          ),
                          const SizedBox(height: 24),
                          AppButton(
                            text: 'Login',
                            icon: Icons.login_rounded,
                            isLoading: state.isLoading,
                            onPressed: _login,
                          ),
                          const SizedBox(height: 12),
                          OutlinedButton.icon(
                            onPressed: _continueAsDemo,
                            icon: const Icon(Icons.blur_on_rounded),
                            label: const Text('Continue Demo'),
                          ),
                          const SizedBox(height: 18),
                          Text(
                            'Demo mode opens the dashboard and public API module.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              height: 1.4,
                              fontSize: 12,
                              color: Colors.white.withOpacity(0.56),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _LoginHeader extends StatelessWidget {
  const _LoginHeader();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GlassPill(
          text: 'IOS-LIKE GLASS UI',
          icon: Icons.auto_awesome_rounded,
        ),
        const SizedBox(height: 22),
        Container(
          height: 66,
          width: 66,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.94),
                const Color(0xFFAEC2FF).withOpacity(0.78),
                const Color(0xFF55F7E6).withOpacity(0.48),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFAEC2FF).withOpacity(0.34),
                blurRadius: 36,
                offset: const Offset(0, 18),
              ),
            ],
          ),
          child: const Icon(Icons.bolt_rounded, color: Color(0xFF111827)),
        ),
        const SizedBox(height: 22),
        const Text(
          'Welcome Back',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w900,
            letterSpacing: -0.8,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'A modern frosted starter with Bloc, Dio, DI, Router, forms, and infinite scroll.',
          style: TextStyle(
            height: 1.45,
            color: Colors.white.withOpacity(0.66),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
