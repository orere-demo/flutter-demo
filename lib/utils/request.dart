import 'package:dio/dio.dart';

// 参数 url params
// 可配置项 POST/GET/PUT , 请求头
// 请求前拦截
// 请求后拦截

void configDio({
  String baseUrl,
}){

}

class DioUtils {
  BaseOptions options = new BaseOptions(
    baseUrl: "https://www.xx.com/api",
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  Dio dio = new Dio(options);

}

