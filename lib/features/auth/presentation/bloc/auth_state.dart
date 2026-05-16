import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/auth_user.dart';

enum AuthStatus { initial, loading, authenticated, failure }

class AuthState extends Equatable {
  final AuthStatus status;
  final String email;
  final String password;
  final bool obscurePassword;
  final String? errorMessage;
  final AuthUser? user;
  final ThemeMode themeMode;

  const AuthState({
    this.status = AuthStatus.initial,
    this.email = '',
    this.password = '',
    this.obscurePassword = true,
    this.errorMessage,
    this.user,
    this.themeMode = ThemeMode.dark,
  });

  bool get canSubmit => email.trim().isNotEmpty && password.trim().length >= 6;
  bool get isLoading => status == AuthStatus.loading;

  AuthState copyWith({
    AuthStatus? status,
    String? email,
    String? password,
    bool? obscurePassword,
    String? errorMessage,
    AuthUser? user,
    bool clearError = false,
    bool clearUser = false,
    ThemeMode? themeMode,
  }) {
    return AuthState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
      user: clearUser ? null : user ?? this.user,
      themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  List<Object?> get props => [status, email, password, obscurePassword, errorMessage, user, themeMode];
}
