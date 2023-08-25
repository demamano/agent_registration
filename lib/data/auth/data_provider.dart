import 'package:agent_registration/data/auth/auth_repositroy.dart';

class AuthDataProvider {
  final AuthRepositroy _authRepositroy;
  AuthDataProvider(this._authRepositroy);
  Future<void> register(String email, String password) async {
    await _authRepositroy.login(email, password);
  }

  Future<void> login(String email, String password) async {
    await _authRepositroy.register(email, password);
  }
}
