import 'dart:io';

abstract class RegistrationEvent {}

class RegisterUser extends RegistrationEvent {
  final Map<String, dynamic> nonFileData;
  final File id;
  final File tradePermission;

  RegisterUser(this.tradePermission,
      {required this.nonFileData, required this.id});
}

class FirstNameEvent extends RegistrationEvent {
  final String firstName;
  FirstNameEvent(this.firstName);
}

class LastNameEvent extends RegistrationEvent {
  final String lastName;
  LastNameEvent(this.lastName);
}

class MiddleNameEvent extends RegistrationEvent {
  final String middleName;
  MiddleNameEvent(this.middleName);
}

class UserNameEvent extends RegistrationEvent {
  final String username;
  UserNameEvent(this.username);
}

class PasswordEvent extends RegistrationEvent {
  final String password;
  PasswordEvent(this.password);
}

class GenderEvent extends RegistrationEvent {
  final String gender;
  GenderEvent(this.gender);
}

class CountryEvent extends RegistrationEvent {
  final String country;
  CountryEvent(this.country);
}

class StateEvent extends RegistrationEvent {
  final String states;
  StateEvent(this.states);
}

class CityEvent extends RegistrationEvent {
  final String city;
  CityEvent(this.city);
}

class AgentTypeEvent extends RegistrationEvent {
  final String agentType;
  AgentTypeEvent(this.agentType);
}

class PropertySizeEvent extends RegistrationEvent {
  final String propertySize;
  PropertySizeEvent(this.propertySize);
}

class PhoneNumberEvent extends RegistrationEvent {
  final String phoneNumber;
  PhoneNumberEvent(this.phoneNumber);
}

class UserIdEvent extends RegistrationEvent {
  final String userId;
  UserIdEvent(this.userId);
}
