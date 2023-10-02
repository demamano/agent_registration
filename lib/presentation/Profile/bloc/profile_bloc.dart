import 'package:agent_registration/data/Repository/users_repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserRepository _authRepository;
  ProfileBloc(this._authRepository) : super(ProfileInitial()) {
    on<GetUserById>((event, emit) async {
      emit(ProfileLoading());
      try {
        final user = await _authRepository.getUser(event.id);
        emit(ProfileLoadedState(user));
      } catch (e) {
        throw Exception(e);
      }
    });
    on<UpdateUser>(
      (event, emit) async {
        emit(ProfileLoading());
        try {
          final user = await _authRepository.updateUser(
              event.nonFileData, event.files, event.id);

          emit(ProfileUpdate(user));
        } catch (e) {
          emit(ProfileErrorState(e.toString()));
        }
      },
    );
    on<GetAdmin>((event, emit) async {
      emit(ProfileLoading());
      try {
        Map<String, dynamic> user = await _authRepository.getAdmin();
        emit(ProfileLoadedState(user));
        
      } catch (e) {
        emit(ProfileErrorState(e.toString()));
      }
    });
  }
}
