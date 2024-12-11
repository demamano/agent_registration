import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/Repository/register_repository.dart';
import 'register_event.dart';
import 'register_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final RegistrationRepository registrationRepository;

  RegistrationBloc(this.registrationRepository)
      : super(InitialRegistrationState()) {
    on<RegisterUser>(
      (event, emit) async {
        emit(LoadingRegistrationState());
        try {
          await registrationRepository.registerUser(
              event.nonFileData, event.id, event.tradePermission);
          emit(SuccessRegistrationState());
        } catch (error) {
          emit(ErrorRegistrationState(error.toString()));
        }
      },
    );
    on<FirstNameEvent>(_firstNameEvent);
    on<LastNameEvent>(_lastNameEvent);
    on<MiddleNameEvent>(_middleNameEvent);
    on<UserNameEvent>(_usernameEvent);
    on<PasswordEvent>(_passwordEvent);
    on<CountryEvent>(_countryEvent);
    on<StateEvent>(_statesEvent);
    on<CityEvent>(_cityEvent);
    on<PropertySizeEvent>(_propertySizeEvent);
    on<AgentTypeEvent>(_agentTypeEvent);
    on<GenderEvent>(_genderEvent);
    on<PhoneNumberEvent>(_phoneNumberEvent);
    on<UserIdEvent>(_userIdEvent);
  }
  void _firstNameEvent(FirstNameEvent event, Emitter<RegistrationState> emit) {
    print("my firstname is ${event.firstName}");
  }

  void _lastNameEvent(LastNameEvent event, Emitter<RegistrationState> emit) {
    print("my firstname is ${event.lastName}");
  }

  void _middleNameEvent(
      MiddleNameEvent event, Emitter<RegistrationState> emit) {
    print("my firstname is ${event.middleName}");
  }

  void _passwordEvent(PasswordEvent event, Emitter<RegistrationState> emit) {
    print("my firstname is ${event.password}");
  }

  void _agentTypeEvent(AgentTypeEvent event, Emitter<RegistrationState> emit) {
    print("my firstname is ${event.agentType}");
  }

  void _genderEvent(GenderEvent event, Emitter<RegistrationState> emit) {
    print("my firstname is ${event.gender}");
    // emit(state.copy)
  }

  void _countryEvent(CountryEvent event, Emitter<RegistrationState> emit) {
    print("my firstname is ${event.country}");
  }

  void _statesEvent(StateEvent event, Emitter<RegistrationState> emit) {
    print("my firstname is ${event.states}");
  }

  void _phoneNumberEvent(
      PhoneNumberEvent event, Emitter<RegistrationState> emit) {
    print("my firstname is ${event.phoneNumber}");
  }

  void _propertySizeEvent(
      PropertySizeEvent event, Emitter<RegistrationState> emit) {
    print("my firstname is ${event.propertySize}");
  }

  void _cityEvent(CityEvent event, Emitter<RegistrationState> emit) {
    print("my firstname is ${event.city}");
  }

  void _usernameEvent(UserNameEvent event, Emitter<RegistrationState> emit) {
    print("my firstname is ${event.username}");
  }

  void _userIdEvent(UserIdEvent event, Emitter<RegistrationState> emit) {
    print("my firstname is ${event.userId}");
  }
}
