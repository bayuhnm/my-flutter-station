import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/get_profile_usecase.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import 'auth_status.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final GetProfileUseCase getProfileUseCase;
  final LogoutUseCase logoutUseCase;
  AuthBloc({
    required this.loginUseCase,
    required this.getProfileUseCase,
    required this.logoutUseCase,
  }) : super(const AuthState()) {
    on<AuthStarted>(_onStarted);
    on<AuthLoginSubmitted>(_onLoginSubmitted);
    on<AuthLogoutRequested>(_onLogoutRequested);
    on<AuthErrorCleared>(_onErrorCleared);
  }
  FutureOr<void> _onStarted(AuthStarted event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading, clearError: true));
    final result = await getProfileUseCase();
    result.when(
      success: (user) => emit(
        state.copyWith(
          status: AuthStatus.authenticated,
          user: user,
          clearError: true,
        ),
      ),
      failure: (_) => emit(
        state.copyWith(
          status: AuthStatus.unauthenticated,
          clearUser: true,
          clearError: true,
        ),
      ),
    );
  }

  FutureOr<void> _onLoginSubmitted(
    AuthLoginSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading, clearError: true));
    final result = await loginUseCase(
      email: event.email.trim(),
      password: event.password,
    );
    result.when(
      success: (user) => emit(
        state.copyWith(
          status: AuthStatus.authenticated,
          user: user,
          message: 'Login success',
          clearError: true,
        ),
      ),
      failure: (failure) => emit(
        state.copyWith(
          status: AuthStatus.failure,
          error: failure,
          clearUser: true,
        ),
      ),
    );
  }

  FutureOr<void> _onLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    await logoutUseCase();
    emit(
      state.copyWith(
        status: AuthStatus.unauthenticated,
        clearUser: true,
        clearError: true,
        clearMessage: true,
      ),
    );
  }

  FutureOr<void> _onErrorCleared(
    AuthErrorCleared event,
    Emitter<AuthState> emit,
  ) {
    emit(state.copyWith(clearError: true, clearMessage: true));
  }
}
