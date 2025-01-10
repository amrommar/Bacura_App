import 'package:dio/dio.dart';

import '../models/login_request_model.dart';

abstract class AuthRemoteDataSource {
  Future<void> login(LoginRequestModel loginRequestModel);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl({required this.dio});

  @override
  Future<void> login(LoginRequestModel loginRequestModel) async {
    try {
      print("📡 API Request Sent: ${loginRequestModel.toJson()}"); // ✅ Check request data

      final response = await dio.post(
        'http://89.250.75.77:5278/api/auth/login', // ⛔ Check if this is correct
        data: loginRequestModel.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      print("📥 API Response Status: ${response.statusCode}");
      print("📥 API Response Data: ${response.data}");

      if (response.statusCode != 200) {
        throw Exception('Login failed: ${response.data}');
      }
    } catch (e) {
      print("❌ API Error: $e");
      throw Exception('Login failed: $e');
    }
  }
}
