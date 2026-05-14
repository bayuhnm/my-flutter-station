part of 'auth_bloc.dart';
class AuthState extends Equatable {
  final AuthStatus status; final UserEntity? user; final Failure? error; final String? message;
  const AuthState({this.status = AuthStatus.initial, this.user, this.error, this.message});
  bool get isLoading => status == AuthStatus.loading;
  AuthState copyWith({AuthStatus? status, UserEntity? user, Failure? error, String? message, bool clearUser=false, bool clearError=false, bool clearMessage=false}) => AuthState(status: status ?? this.status, user: clearUser ? null : user ?? this.user, error: clearError ? null : error ?? this.error, message: clearMessage ? null : message ?? this.message);
  @override List<Object?> get props => [status, user, error, message];
}
