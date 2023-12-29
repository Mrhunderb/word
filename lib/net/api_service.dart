import 'package:dio/dio.dart';

class ApiService {
  Dio _dio;

  ApiService() : _dio = Dio() {
    BaseOptions options = BaseOptions(
      baseUrl: "http://192.168.1.101:8080",
      connectTimeout: const Duration(milliseconds: 3000),
      receiveTimeout: const Duration(milliseconds: 3000),
    );
    _dio = Dio(options);
  }

  Future<Response> loginUser(String username, String password) async {
    try {
      // 发送登录请求
      Response response = await _dio.post('/user/login/', queryParameters: {
        'username': username,
        'password': password,
      });
      return response;
    } catch (error) {
      rethrow;
    }
  }

  Future<Response> registerUser(String username, String password) async {
    try {
      // 发送注册请求
      Response response = await _dio.post('/user/register/', queryParameters: {
        'username': username,
        'password': password,
      });
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
