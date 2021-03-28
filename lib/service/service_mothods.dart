// import 'package:dio/dio.dart';
// import 'dart:async';
// import 'dart:io'; // ContentType 对象
// import '../config/service_url.dart';

// // 获取首页主体内容
// Future getHomePageContent() async {
//   try {
//     print('开始获取数据');
//     Response response;
//     Dio dio = new Dio();
//     dio.options.contentType =
//         ContentType.parse("application/x-www-form-urlencoded") as String;

//     var formData = {'lon': '123, 123', 'lat': '2231, 331'};
//     response = await dio.post(servicePath['homePageContent'], data: formData);
//     if (response.statusCode == 200) {
//       return response.data;
//     } else {
//       // 抛出异常
//       throw Exception('接口异常');
//     }
//   } catch (e) {
//     return print('ERROR: ===================$e');
//   }
// }

import './http.dart';

Future getUserInfo({dynamic formData}) async {
  // var formData = {'lon': '123, 123', 'lat': '2231, 331'};
  var response = await HttpUtil().post(
    '/app/update',
    // context: context,
    params: formData,
  );
  return response.data;
}

/// 系统相关
// class AppApi {
//   /// 获取最新版本信息
//   static Future<AppUpdateResponseEntity> update({
//     @required BuildContext context,
//     AppUpdateRequestEntity params,
//   }) async {
//     var response = await HttpUtil().post(
//       '/app/update',
//       context: context,
//       params: params,
//     );
//     return AppUpdateResponseEntity.fromJson(response);
//   }
// }

// class AppUpdateRequestEntity {
//   String device;
//   String channel;
//   String architecture;
//   String model;
//   AppUpdateRequestEntity({
//     this.device,
//     this.channel,
//     this.architecture,
//     this.model,
//   });
//   factory AppUpdateRequestEntity.fromJson(Map<String, dynamic> json) =>
//       AppUpdateRequestEntity(
//         device: json["device"],
//         channel: json["channel"],
//         architecture: json["architecture"],
//         model: json["model"],
//       );
//   Map<String, dynamic> toJson() => {
//         "device": device,
//         "channel": channel,
//         "architecture": architecture,
//         "model": model,
//       };
// }

// class AppUpdateResponseEntity {
//   String shopUrl;
//   String fileUrl;
//   String latestVersion;
//   String latestDescription;
//   AppUpdateResponseEntity({
//     this.shopUrl,
//     this.fileUrl,
//     this.latestVersion,
//     this.latestDescription,
//   });
//   factory AppUpdateResponseEntity.fromJson(Map<String, dynamic> json) =>
//       AppUpdateResponseEntity(
//         shopUrl: json["shopUrl"],
//         fileUrl: json["fileUrl"],
//         latestVersion: json["latestVersion"],
//         latestDescription: json["latestDescription"],
//       );
//   Map<String, dynamic> toJson() => {
//         "shopUrl": shopUrl,
//         "fileUrl": fileUrl,
//         "latestVersion": latestVersion,
//         "latestDescription": latestDescription,
//       };
// }
