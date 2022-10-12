import 'dart:developer';

import 'package:dio/dio.dart';

class Repository {
  Dio _dio = Dio();
  String? url;
  Map<String, dynamic>? payload;

  Repository({
    this.url,
    this.payload,
  });

  void getData({Function()? beforeSend,
    Function(Map<String, dynamic> data)? onSuccess,
    required Function(dynamic error) onError}) async {
    log(url!);
    try {
      Response response;
      response = await _dio.get(
        url!,
        queryParameters: payload,
      );
      if (onSuccess != null) {
        onSuccess(response.data);
      }
    } on DioError catch (e) {
      log(e.message);
    }
  }

}