import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {}

class ProfileInitial extends ProfileState {
  @override
  List<Object?> get props => [];
}

class ProfileLoading extends ProfileState {
  @override
  List<Object?> get props => [];
}

class ProfileLoadedState extends ProfileState {
  final Map<String, dynamic> user;
  ProfileLoadedState(this.user);

  @override
  List<Object?> get props => [user];
}

class ProfileUpdate extends ProfileState {
  final Map<String, dynamic> user;
  ProfileUpdate(this.user);

  @override
  List<Object?> get props => [user];
}

class ProfileErrorState extends ProfileState {
  final String error;
  ProfileErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
