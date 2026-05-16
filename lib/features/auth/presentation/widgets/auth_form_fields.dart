import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';

class AuthFormFields extends StatelessWidget {
  const AuthFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (previous, current) =>
          previous.email != current.email ||
          previous.password != current.password ||
          previous.obscurePassword != current.obscurePassword,
      builder: (context, state) {
        return Column(
          children: [
            TextField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              onChanged: (value) => context.read<AuthBloc>().add(AuthEmailChanged(value)),
              decoration: const InputDecoration(
                hintText: 'Email address',
                prefixIcon: Icon(Icons.alternate_email_rounded),
              ),
            ),
            const SizedBox(height: 14),
            TextField(
              obscureText: state.obscurePassword,
              onChanged: (value) => context.read<AuthBloc>().add(AuthPasswordChanged(value)),
              onSubmitted: (_) => context.read<AuthBloc>().add(const AuthSubmitted()),
              decoration: InputDecoration(
                hintText: 'Password',
                prefixIcon: const Icon(Icons.lock_outline_rounded),
                suffixIcon: IconButton(
                  onPressed: () => context.read<AuthBloc>().add(const AuthPasswordVisibilityToggled()),
                  icon: Icon(state.obscurePassword ? Icons.visibility_off_rounded : Icons.visibility_rounded),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
