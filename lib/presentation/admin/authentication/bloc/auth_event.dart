abstract class AuthenticationEvent {}

class LoginAdminUser extends AuthenticationEvent {
  final String username;
  final String password;

  LoginAdminUser(this.username, this.password);
}

class LoginUser extends AuthenticationEvent {
  final String username;
  final String password;

  LoginUser(this.username, this.password);
}

class Logout extends AuthenticationEvent {}
class Refresh extends AuthenticationEvent {}
class PasswordEvent extends AuthenticationEvent {
  final String password;
  PasswordEvent(this.password);
}

class UserNameEvent extends AuthenticationEvent {
  final String username;
  UserNameEvent(this.username);
}

