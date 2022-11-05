import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,

      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang='ar',
    String? token,
  }) async
  {
    // dio.options.headers={
    //   'lang':lang ,
    //   'Authorization': token,
    //
    // };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

}