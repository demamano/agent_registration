import 'dart:convert';
import 'dart:io';
import 'package:dio/io.dart';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';

class RegistrationRepository {
  
  final Dio dio;
  

  RegistrationRepository(this.dio);
  
  Future<void> registerUser(
      Map<String, dynamic> nonFileData, File id, File tradePermission) async {
    final formData = FormData.fromMap({
      'nonFileData': jsonEncode(nonFileData),
      'id': await MultipartFile.fromFile(id.path, filename: 'id.jpg'),
      'tradePermission': await MultipartFile.fromFile(tradePermission.path,
          filename: 'tradePermission.jpg'),
    });

    try {
      await dio.post('/register', data: formData);
    } catch (e) {
      throw Exception('Registration failed');
    }
  }
}
