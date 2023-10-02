import 'dart:convert';
import 'package:agent_registration/core/exception.dart';
import 'package:agent_registration/data/model/user.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  final Dio dio;
  UserRepository(this.dio);
  Future<List<User>> getUsers(String query) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String>? token = prefs.getStringList('set-cookie');

    if (token != null) {
      try {
        dio.options.headers['cookie'] = token.join('; ');

        final response = await dio.get('/admin/resource/agents',
            options: Options(headers: {'cookie': token.join(';')}));
        List<User> searchResult = [];
        List<dynamic> body = response.data;
        List<User> users =
            body.map((dynamic item) => User.fromMap(item)).toList();

        if (response.data != null) {
          if (query.isNotEmpty) {
            searchResult = users
                .where((element) => element.firstName
                    .toLowerCase()
                    .contains(query.toLowerCase()))
                .toList();

            return searchResult;
          }

          return users;
        } else {
          throw ServerException('Failed to Load Users');
        }
      } catch (e) {
        throw Exception("Failed to load users: $e");
      }
    } else {
      throw ServerException("User is not authenticated");
    }
  }

  Future<Map<String, dynamic>> getUser(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String>? token = prefs.getStringList('set-cookie');

    if (token != null) {
      try {
        dio.options.headers['cookie'] = token.join('; ');

        final response = await dio.get('/admin/resource/agents/$id');
        if (response.data != null) {
          return response.data;
        } else {
          throw Exception("Failed to load users");
        }
      } catch (e) {
        throw Exception("Failed to load users: $e");
      }
    } else {
      throw Exception("User is not authenticated");
    }
  }

  Future<Map<String, dynamic>> updateUser(Map<String, dynamic> nonFileData,
      Map<String, dynamic> files, String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String>? token = prefs.getStringList('set-cookie');
    final formData = FormData.fromMap(
        {'nonFileData': jsonEncode(nonFileData), 'files': files, 'id': id});

    if (token != null) {
      try {
        dio.options.headers['cookie'] = token.join('; ');
        Response response = await dio.patch('/agents/edit/$id', data: formData);
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

  Future<Map<String, dynamic>> getAdmin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String>? token = prefs.getStringList('set-cookie');

    if (token != null) {
      try {
        dio.options.headers['cookie'] = token.join('; ');

        final response = await dio.get('/admin/profile',
            options: Options(headers: {'cookie': token.join(';')}));

        Map<String, dynamic> body = response.data;
        Map<String, dynamic> users = body;
        return users;
      } catch (e) {
        throw Exception("Failed to load users: $e");
      }
    } else {
      throw Exception("User is not authenticated");
    }
  }
}
