abstract class ProfileEvent {}

class GetUserById extends ProfileEvent {
  final String id;
  GetUserById(this.id);
}

class UpdateUser extends ProfileEvent {
  final Map<String, dynamic> nonFileData;
  final String id;
  final Map<String, dynamic> files;
  UpdateUser(
      {required this.id, required this.nonFileData, required this.files});
}
class GetAdmin extends ProfileEvent {
  
}
