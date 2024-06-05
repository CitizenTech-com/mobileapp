import 'dart:developer';
import 'package:Citizen.Tech/constants/app.constants.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

class ApiClient {
  static final _dio = DioClient.instance.getDioClient();

  Future<Response> getData(String uri,
      {Map<String, dynamic>? query,
      Map<String, String>? headers,
      bool logs = true}) async {
    return await _dio.get(
      uri,
      queryParameters: query,
      options: Options(responseType: ResponseType.plain, headers: headers),
    );
  }

  Future<Response> postData(String? uri, dynamic body,
      {Map<String, String>? headers,
      bool ignoreExceptions = false,
      bool logs = true}) async {

    return await _dio.post(
        AppConstants.BASE_URL+uri!,
        // '${Get.find<AppconfigService>().baseUrl}$uri',
        data: body, options: Options(method: "POST", headers: headers));
  }

  Future<Response> patchData(String? uri, dynamic body,
      {Map<String, String>? headers,
      bool ignoreExceptions = false,
      bool logs = true}) async {
    // _logSwitching(logs);
    return await _dio.patch(
      '',
      // '${Get.find<AppconfigService>().baseUrl}$uri',
      data: body,
      options: Options(responseType: ResponseType.plain, headers: headers),
    );
  }

  Future<Response> putData(String? uri, dynamic body,
      {Map<String, String>? headers,
      bool ignoreExceptions = false,
      bool logs = true}) async {
    // _logSwitching(logs);
    return await _dio.put(
      '',
      // '${Get.find<AppconfigService>().baseUrl}$uri',
      data: body,
      options: Options(responseType: ResponseType.plain, headers: headers),
    );
  }

  Future<Response> deleteData(String? uri,
      {Map<String, String>? headers,
      bool ignoreExceptions = false,
      bool logs = true}) async {
    // _logSwitching(logs);
    return await _dio.delete(
      '',
      // '${Get.find<AppconfigService>().baseUrl}$uri',
      options: Options(responseType: ResponseType.plain, headers: headers),
    );
  }

  // void _logSwitching(bool logs) {
  //   /// only disply logs in debug mode.
  //   if (!kDebugMode) {
  //     return;
  //   }
  //   if (logs) {
  //     _dio.interceptors.removeWhere((element) => element is LoggingInterceptor);
  //     _dio.interceptors.insert(1, LoggingInterceptor());
  //   } else if (!logs) {
  //     _dio.interceptors.removeWhere((element) => element is LoggingInterceptor);
  //     _dio.interceptors.insert(1, LoggingInterceptor(logs: false));
  //   }
  // }
}

class DioClient {
  //flutter run --no-sound-null-safety -d chrome --web-port=1234

  static final DioClient _instance = DioClient._();

  DioClient._();

  static DioClient get instance => _instance;

  Dio getDioClient() {
    final Dio dio = Dio(BaseOptions(
        baseUrl: '',
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        maxRedirects: 3));
    // onHTTPCreate(dio);
    return dio;
  }

  // static void onHTTPCreate(Dio dio) {
  //   dio.options.headers['Access-Control-Allow-Origin'] = '*';
  //   dio.options.headers['Access-Control-Allow-Headers'] =
  //       'Content-Type, Accept, X-Requested-With';
  //   dio.options.headers['Access-Control-Allow-Credentials'] = true;
  //   dio.options.headers['Content-Type'] = 'application/json';
  //   dio.options.headers['X-Correlation-ID'] = GlobalUtils.getUniqueString();
  //   dio.options.headers['X-Session-ID'] =
  //       AppSession().getDefaultHeaders()['X-Session-ID'];
  //   dio.options.headers['X-Device-ID'] =
  //       AppSession().getDefaultHeaders()['X-Device-ID'];
  //   dio.options.responseType = ResponseType.plain;
  //   dio.interceptors.add(ErrorInterceptor(dio: dio));
  // }
}
