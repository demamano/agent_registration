import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/Repository/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository authenticationRepository;
  AuthenticationBloc(this.authenticationRepository)
      : super(InitialAuthenticationState()) {
    on<LoginAdminUser>(
      (event, emit) async {
        emit(LoadingAuthenticationState());
        try {
          await authenticationRepository.loginAdminUser(
              event.username, event.password);

          emit(AdminAuthenticatedState());
        } catch (e) {
          emit(ErrorAuthenticationState(e.toString()));
        }
      },
    );
    on<LoginUser>(
      (event, emit) async {
        emit(LoadingAuthenticationState());
        try {
          final user = await authenticationRepository.loginUser(
              event.username, event.password);

          emit(AuthenticatedState(user));
        } catch (e) {
          emit(ErrorAuthenticationState(e.toString()));
        }
      },
    );
    on<Logout>((event, emit) async {
      emit(LoadingAuthenticationState());
      try {
        await authenticationRepository.logout();
        emit(InitialAuthenticationState());
      } catch (e) {
        ErrorAuthenticationState(e.toString());
      }
    });
    on<Refresh>((event, emit) async {
      emit(LoadingAuthenticationState());
      try {
        await authenticationRepository.refresh();
        emit(InitialAuthenticationState());
      } catch (e) {
        ErrorAuthenticationState(e.toString());
      }
    });

    on<UserNameEvent>(_usernameEvent);
    on<PasswordEvent>(_passwordEvent);
  }

  void _passwordEvent(PasswordEvent event, Emitter<AuthenticationState> emit) {
    print("email${event.password}");
  }

  void _usernameEvent(UserNameEvent event, Emitter<AuthenticationState> emit) {
    print(event.username);
    // if (event.username.isEmpty) {
    //   emit(ErrorAuthenticationState('password required'));
    // }
  }
}
