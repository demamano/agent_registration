import 'package:agent_registration/presentation/admin/bloc/search_event.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/Repository/users_repository.dart';
import 'search_state.dart';

class FetchUserBloc extends Bloc<FetchUserEvent, FetchUserState> {
  final UserRepository _authRepository;
  FetchUserBloc(this._authRepository) : super(UserLoadingInitial()) {
    on<SearchStarted>((event, emit) async {
      emit(UserLoading());
      try {
        final users = await _authRepository.getUsers(event.query);
        emit(UserLoaded(users));
      } catch (e) {
        emit(UserLoadErrorState(e.toString()));
      }
    });
  }
}
