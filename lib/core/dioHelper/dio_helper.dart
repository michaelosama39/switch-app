import 'package:dio/dio.dart';
import '../utils/app_strings.dart';

class DioHelper {
  static Dio dioSingleton = Dio()..options.baseUrl = AppStrings.baseurl;

  static Future<Response<dynamic>> post(String path,
      {FormData? formData,
      Map<String, dynamic>? body, Map<String, dynamic>? headers}) {
    dioSingleton.options.headers = headers;
    return dioSingleton.post(path,
        data: formData != null ? formData : FormData.fromMap(body!),
        options: Options(
          validateStatus: (_) => true,
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
        ));
  }

  static Future<Response<dynamic>> get(String path,
      {Map<String, dynamic>? headers}) {
    dioSingleton.options.headers = headers;
    return dioSingleton.get(path);
  }
}
