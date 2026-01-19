import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_current_user.dart';
import '../../domain/usecases/sign_in.dart';
import '../../domain/usecases/sign_out.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignIn signInUseCase;
  final SignOut signOutUseCase;
  final GetCurrentUser getCurrentUserUseCase;

  AuthBloc({
    required this.signInUseCase,
    required this.signOutUseCase,
    required this.getCurrentUserUseCase,
  }) : super(AuthInitial()) {
    on<SignInRequested>(_onSignInRequested);
    on<SignOutRequested>(_onSignOutRequested);
    on<AuthStatusChecked>(_onAuthStatusChecked);
  }

  Future<void> _onSignInRequested(
    SignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final result = await signInUseCase(
      email: event.email,
      password: event.password,
    );

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(Authenticated(user)),
    );
  }

  Future<void> _onSignOutRequested(
    SignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final result = await signOutUseCase();

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(Unauthenticated()),
    );
  }

  Future<void> _onAuthStatusChecked(
    AuthStatusChecked event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final result = await getCurrentUserUseCase();

    result.fold(
      (failure) => emit(Unauthenticated()),
      (user) => user != null ? emit(Authenticated(user)) : emit(Unauthenticated()),
    );
  }
}
