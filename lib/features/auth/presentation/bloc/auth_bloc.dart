import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/usecases/login_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;

  AuthBloc({required this.loginUseCase}) : super(const AuthState()) {
    on<AuthStarted>(_onStarted);
    on<AuthEmailChanged>(_onEmailChanged);
    on<AuthPasswordChanged>(_onPasswordChanged);
    on<AuthPasswordVisibilityToggled>(_onPasswordVisibilityToggled);
    on<AuthSubmitted>(_onSubmitted);
    on<AuthLogoutRequested>(_onLogoutRequested);
    on<AuthThemeModeChanged>(_onThemeModeChanged);
  }

  void _onStarted(AuthStarted event, Emitter<AuthState> emit) {
    emit(state.copyWith(status: AuthStatus.initial, clearError: true));
  }

  void _onEmailChanged(AuthEmailChanged event, Emitter<AuthState> emit) {
    emit(state.copyWith(email: event.email, status: AuthStatus.initial, clearError: true));
  }

  void _onPasswordChanged(AuthPasswordChanged event, Emitter<AuthState> emit) {
    emit(state.copyWith(password: event.password, status: AuthStatus.initial, clearError: true));
  }

  void _onPasswordVisibilityToggled(
    AuthPasswordVisibilityToggled event,
    Emitter<AuthState> emit,
  ) {
    emit(state.copyWith(obscurePassword: !state.obscurePassword));
  }

  Future<void> _onSubmitted(AuthSubmitted event, Emitter<AuthState> emit) async {
    if (!state.canSubmit) {
      emit(state.copyWith(
        status: AuthStatus.failure,
        errorMessage: 'Please enter a valid email and minimum 6 characters password.',
      ));
      return;
    }

    emit(state.copyWith(status: AuthStatus.loading, clearError: true));

    try {
      final user = await loginUseCase(email: state.email, password: state.password);
      emit(state.copyWith(status: AuthStatus.authenticated, user: user, clearError: true));
    } on Failure catch (e) {
      emit(state.copyWith(status: AuthStatus.failure, errorMessage: e.message));
    } catch (_) {
      emit(state.copyWith(status: AuthStatus.failure, errorMessage: 'Unable to login right now.'));
    }
  }

  void _onLogoutRequested(AuthLogoutRequested event, Emitter<AuthState> emit) {
    emit(state.copyWith(status: AuthStatus.initial, password: '', clearUser: true, clearError: true));
  }

  void _onThemeModeChanged(AuthThemeModeChanged event, Emitter<AuthState> emit) {
    emit(state.copyWith(themeMode: event.themeMode));
  }
}
