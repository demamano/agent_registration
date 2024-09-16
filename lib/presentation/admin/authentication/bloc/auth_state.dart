abstract class AuthenticationState {}

class InitialAuthenticationState extends AuthenticationState {}

class LoadingAuthenticationState extends AuthenticationState {}

class AuthenticatedState extends AuthenticationState {
  final Map<String, dynamic> user;
  AuthenticatedState(this.user);
}

class AdminAuthenticatedState extends AuthenticationState {}

class ErrorAuthenticationState extends AuthenticationState {
  final String errorMessage;

  ErrorAuthenticationState(this.errorMessage);
}

