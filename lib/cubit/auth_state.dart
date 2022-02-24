part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  final User? user;
  final String? errorMessage;
  const AuthState({this.errorMessage, this.user});

  @override
  List<Object?> get props => [user, errorMessage];
}

class AuthDefault extends AuthState {}

// login state
class AuthLoginLoading extends AuthState {
  const AuthLoginLoading();
}

class AuthLoginSuccess extends AuthState {
  const AuthLoginSuccess({required User user}) : super(user: user);
}

class AuthLoginError extends AuthState {
  const AuthLoginError({required String error}) : super(errorMessage: error);
}

// signup state
class AuthSignUpLoading extends AuthState {
  const AuthSignUpLoading();
}

class AuthSignUpSuccess extends AuthState {
  const AuthSignUpSuccess();
}

class AuthSignUpError extends AuthState {
  final String? err;
  const AuthSignUpError(this.err);

  @override
  // compare objects
  bool operator ==(Object other) {
    // named other to match overridden method
    if (identical(this, other)) return true;
    return other is AuthSignUpError && other.err == err;
  }

  @override
  int get hashCode => err.hashCode;
}

// forgot password state
class AuthForgotPasswordLoading extends AuthState {
  const AuthForgotPasswordLoading();
}

class AuthForgotPasswordSuccess extends AuthState {
  const AuthForgotPasswordSuccess();
}

class AuthForgotPasswordError extends AuthState {
  final String? err;
  const AuthForgotPasswordError(this.err);

  @override
  // compare objects
  bool operator ==(Object other) {
    // named other to match overridden method
    if (identical(this, other)) return true;
    return other is AuthSignUpError && other.err == err;
  }

  @override
  int get hashCode => err.hashCode;
}

// google auth state

class AuthGoogleLoading extends AuthState {
  const AuthGoogleLoading();
}

class AuthGoogleSuccess extends AuthState {
  const AuthGoogleSuccess({User? user}) : super(user: user);
}

class AuthGoogleError extends AuthState {
  const AuthGoogleError({String? error}) : super(errorMessage: error);
}

// logout state

class AuthLogout extends AuthState {
  const AuthLogout();
}
