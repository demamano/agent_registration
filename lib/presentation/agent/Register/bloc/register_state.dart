abstract class RegistrationState {}
class InitialRegistrationState extends RegistrationState {}

class LoadingRegistrationState extends RegistrationState {}

class SuccessRegistrationState extends RegistrationState {}

class ErrorRegistrationState extends RegistrationState {
  final String errorMessage;

  ErrorRegistrationState(this.errorMessage);
}
