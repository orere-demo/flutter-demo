import 'dart:convert';

import 'package:demo1/index.dart';
import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io'; // ContentType 对象
import 'service_url.dart';

class ErrorEntity implements Exception {
  int code;
  String message;

  ErrorEntity({this.code, this.message});

  String toString() {
    if (message == null) return "Exception";
    return "Exception: code $code, $message";
  }
}

// 单例 封装
class HttpUtil {
  // static _instance，_instance会在编译期被初始化，保证了只被创建一次
  static HttpUtil _instance = HttpUtil._internal();

  // 提供了一个工厂方法来获取该类的实例（实例化HttpUtil 永远返回_instance）
  factory HttpUtil() => _instance;

  Dio dio;
  CancelToken cancelToken = CancelToken();

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: ServiceUrl,
      //连接服务器超时时间，单位是毫秒.
      connectTimeout: 10000,
      // 响应流上前后两次接受到数据的间隔，单位为毫秒。
      receiveTimeout: 5000,

      // Http请求头.
      headers: {},

      /// 请求的Content-Type，默认值是"application/json; charset=utf-8".
      /// 如果您想以"application/x-www-form-urlencoded"格式编码请求数据,
      /// 可以设置此选项为 `Headers.formUrlEncodedContentType`,  这样[Dio]
      /// 就会自动编码请求体.
      contentType: 'application/json; charset=utf-8',

      /// [responseType] 表示期望以那种格式(方式)接受响应数据。
      /// 目前 [ResponseType] 接受三种类型 `JSON`, `STREAM`, `PLAIN`.
      ///
      /// 默认值是 `JSON`, 当响应头中content-type为"application/json"时，dio 会自动将响应内容转化为json对象。
      /// 如果想以二进制方式接受响应数据，如下载一个二进制文件，那么可以使用 `STREAM`.
      ///
      /// 如果想以文本(字符串)格式接收响应数据，请使用 `PLAIN`.
      responseType: ResponseType.json,
    );

    dio = Dio(options);

    // Cookie管理
    // CookieJar cookieJar = CookieJar();
    // dio.interceptors.add(CookieManager(cookieJar));

    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      return options;
    }, onResponse: (Response response) {
      return response;
    }, onError: (DioError e) {
      ErrorEntity eInfo = createErrorEntity(e);

      // 错误提示
      // toastInfo(msg: eInfo.message);

      // 错误交互处理
      var context = e.request.extra["context"];
      if (context != null) {
        switch (eInfo.code) {
          case 401: // 没有权限 重新登录
            // goLoginPage(context);
            break;
          default:
        }
      }
      return eInfo;
    }));

    // 加内存缓存
    // dio.interceptors.add(NetCache());

    // 在调试模式下需要抓包调试，所以我们使用代理，并禁用HTTPS证书校验
    // if (!Global.isRelease && PROXY_ENABLE) {
    //   (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //       (client) {
    //     client.findProxy = (uri) {
    //       return "PROXY $PROXY_IP:$PROXY_PORT";
    //     };
    //     //代理工具会提供一个抓包的自签名证书，会通不过证书校验，所以我们禁用证书校验
    //     client.badCertificateCallback =
    //         (X509Certificate cert, String host, int port) => true;
    //   };
    // }
  }

  ErrorEntity createErrorEntity(DioError error) {
    switch (error.type) {
      case DioErrorType.CANCEL:
        return ErrorEntity(code: -1, message: "请求取消");
        break;
      case DioErrorType.CONNECT_TIMEOUT:
        return ErrorEntity(code: -1, message: "连接超时");
        break;
      case DioErrorType.SEND_TIMEOUT:
        return ErrorEntity(code: -1, message: "请求超时");
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        return ErrorEntity(code: -1, message: "响应超时");
        break;
      case DioErrorType.RESPONSE:
        {
          try {
            int errCode = error.response.statusCode;
            switch (errCode) {
              case 400:
                {
                  return ErrorEntity(code: errCode, message: "请求语法错误");
                }
                break;
              case 401:
                {
                  return ErrorEntity(code: errCode, message: "没有权限");
                }
                break;
              case 403:
                {
                  return ErrorEntity(code: errCode, message: "服务器拒绝执行");
                }
                break;
              case 404:
                {
                  return ErrorEntity(code: errCode, message: "无法连接服务器");
                }
                break;
              case 405:
                {
                  return ErrorEntity(code: errCode, message: "请求方法被禁止");
                }
                break;
              case 500:
                {
                  return ErrorEntity(code: errCode, message: "服务器内部错误");
                }
                break;
              case 502:
                {
                  return ErrorEntity(code: errCode, message: "无效的请求");
                }
                break;
              case 503:
                {
                  return ErrorEntity(code: errCode, message: "服务器挂了");
                }
                break;
              case 505:
                {
                  return ErrorEntity(code: errCode, message: "不支持HTTP协议请求");
                }
                break;
              default:
                {
                  // return ErrorEntity(code: errCode, message: "未知错误");
                  return ErrorEntity(
                      code: errCode, message: error.response.statusMessage);
                }
            }
          } on Exception catch (_) {
            return ErrorEntity(code: -1, message: "未知错误");
          }
        }
        break;
      default:
        return ErrorEntity(code: -1, message: error.message);
    }
  }

  /*
   * 取消请求
   *
   * 同一个cancel token 可以用于多个请求，当一个cancel token取消时，所有使用该cancel token的请求都会被取消。
   * 所以参数可选
   */
  void cancelRequests(CancelToken token) {
    token.cancel("cancelled");
  }

  /// 读取本地配置  token
  Map<String, dynamic> getAuthorizationHeader() {
    var headers;
    // accessToken在登录后同步到Global中
    // String accessToken = Global.profile?.accessToken;
    String accessToken;
    if (accessToken != null) {
      headers = {
        'Authorization': 'Bearer $accessToken',
      };
    }
    return headers;
  }

  /// restful get 操作
  /// refresh 是否下拉刷新 默认 false
  /// noCache 是否不缓存 默认 true
  /// list 是否列表 默认 false
  /// cacheKey 缓存key
  /// cacheDisk 是否磁盘缓存
  Future get(
    String path, {
    // @required BuildContext context,
    dynamic params,
    Options options,
    // bool refresh = false,
    // bool noCache = !CACHE_ENABLE,
    // bool list = false,
    // String cacheKey,
    // bool cacheDisk = false,
  }) async {
    print('path$path,params$params');
    Options requestOptions = options ?? Options();

    /// 请求时带上一些其他信息
    requestOptions = requestOptions.merge(extra: {
      // "context": context,
      // "refresh": refresh,
      // "noCache": noCache,
      // "list": list,
      // "cacheKey": cacheKey,
      // "cacheDisk": cacheDisk,
    });

    // 获取token并加入requestOptions
    Map<String, dynamic> _authorization = getAuthorizationHeader();
    if (_authorization != null) {
      requestOptions = requestOptions.merge(headers: _authorization);
    }

    Response response = await dio.get(path,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken);
    // print('response$response');
    // print(response.data);
    return json.decode(response.toString());
  }

  Future post(String path, {dynamic params}) async {
    Options requestOptions = Options();
    // token
    Map<String, dynamic> _authorization = getAuthorizationHeader();
    if (_authorization != null) {
      requestOptions = requestOptions.merge(headers: _authorization);
    }

    var response = await dio.post(path,
        data: params, options: requestOptions, cancelToken: cancelToken);
    return json.decode(response.toString());
  }
}
