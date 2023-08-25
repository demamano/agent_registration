// defines the abstract AuthRepositroy class w/c provides
// methods for methods for authentication data operation

import 'package:dio/dio.dart';
import 'package:agent_registration/core/constant.dart';
import 'package:agent_registration/core/exception.dart';

abstract class AuthRepositroy {
  Future<void> login(String email, String password);
  Future<void> register(String email, String password);
}

class AuthRepositoryImpl implements AuthRepositroy {
  final Dio _dio;
  AuthRepositoryImpl(this._dio);    
  @override
  Future<void> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '${Constants.baseUrl}/login',
        data: {'email': email, 'password': password},
      );
      if (response.statusCode == 200) {
        print('login is successfull');
      } else {
        throw ServerException('Login Failed');
      }
    } on DioException catch (e) {
      throw NetworkException(e.message.toString());
    }
  }

  @override
  Future<void> register(String email, String password) async {
    try {
      final response = await _dio.post('${Constants.baseUrl}/register',
          data: {'email': email, 'password': password});
      if (response.statusCode == 201) {
        print("registration sucessful");
      } else {
        throw ServerException('Registration Failed');
      }
    } on DioException catch (e) {
      throw NetworkException(e.message.toString());
    }
  }
}
