import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationRepository {
  final Dio dio;

  AuthenticationRepository(this.dio);

  Future<void> loginAdminUser(String username, String password) async {
    try {
      final Response response = await dio.post('/auth/login', data: {
        'username': username,
        'password': password,
      });

      if (response.statusCode == 201) {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        prefs.setStringList('set-cookie', response.headers['set-cookie']!);
      } else {
        throw Exception('Failed to Login');
      }
    } catch (e) {
      throw Exception('Authentication failed');
    }
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? token = prefs.getStringList('set-cookie');
    try {
      dio.options.headers['cookie'] = token!.join('; ');
      await dio.get('/auth/logout');
      prefs.remove('set-cookie');
    } catch (e) {
      throw Exception(e.toString());
    }
  }
  
    Future<void> refresh() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? token = prefs.getStringList('set-cookie');
    try {
      dio.options.headers['cookie'] = token!.join('; ');
      await dio.get('/auth/refresh');
      prefs.reload();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Map<String, dynamic>> loginUser(
      String username, String password) async {
    try {
      final Response response = await dio.post('/agents/login', data: {
        'username': username,
        'password': password,
      });
      if (response.statusCode == 201) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setStringList('set-cookie', response.headers['set-cookie']!);
        // List<String>? token = prefs.getStringList('set-cookie');
      } else {
        throw Exception('Failed to Login');
      }

      Map<String, dynamic> user = response.data;
      return user;
    } catch (e) {
      throw Exception('Authentication failed');
    }
  }

  Future<Map<String, dynamic>> updateUser(Map<String, dynamic> nonFileData,
      File id, File tradePermission, String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String>? token = prefs.getStringList('set-cookie');
    final formData = FormData.fromMap({
      'nonFileData': jsonEncode(nonFileData),
      'id': await MultipartFile.fromFile(id.path, filename: 'id.jpg'),
      'tradePermission': await MultipartFile.fromFile(tradePermission.path,
          filename: 'tradePermission.jpg'),
    });

    if (token != null) {
      try {
        dio.options.headers['cookie'] = token.join('; ');
        Response response =
            await dio.patch('/agents/edit/$userId', data: formData);
        if (response.statusCode == 200) {
          return response.data;
        } else {
          throw Exception('Failed to Update agent');
        }
      } catch (e) {
        throw Exception('Update failed');
      }
    } else {
      throw Exception("User is not authenticated");
    }
  }
}
