import 'package:dio/dio.dart';

class Request {

  //创建dio实例
  static BaseOptions base = BaseOptions(
      baseUrl: "https://netease.lzcdev.xyz/",
      connectTimeout: 5000,
    receiveTimeout: 3000,
  );

  static final dio = Dio(base);

  static Future $http(String url) async {
    try {
      Response res = await dio.request(url);
      return res.data;
    } on DioError catch(err) {
      throw err;
    }
  }
}