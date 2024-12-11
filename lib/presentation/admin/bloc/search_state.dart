import 'package:equatable/equatable.dart';

import '../../../data/model/user.dart';

abstract class FetchUserState extends Equatable {}

class UserLoadingInitial extends FetchUserState {
  @override
  List<Object?> get props => [];
}

class UserLoading extends FetchUserState {
  @override
  List<Object> get props => [];
}

class UserLoaded extends FetchUserState {
  UserLoaded(this.users);
  final List<User> users;
  @override
  List<Object> get props => [users];
}

class UserLoadErrorState extends FetchUserState {
  UserLoadErrorState(this.error);
  final String error;
  @override
  List<Object> get props => [error];
}
