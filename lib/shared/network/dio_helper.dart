import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioHelper {
  static Dio dio = Dio();
  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://pos-app.com/public/',
          receiveDataWhenStatusError: true,
          headers: {
            'Accept': 'application/json',
          }),
    );
  }

  static Future<Response> getData({
    required String url,
    dynamic query,
  }) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    dio.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${preferences.getString('userToken')}',
    };
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers = {
      'Accept': 'application/json',
    };

    return dio.post(url, queryParameters: query, data: data);
  }
}
