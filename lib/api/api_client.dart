import 'dart:io';
import 'package:telemedicine_pasien/env.dart';
import 'package:telemedicine_pasien/injection_container.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient extends DioForNative {
  ApiClient() : super() {
    var urlHOST = Env.baseUrl;
    options = BaseOptions(
      baseUrl: urlHOST,
      connectTimeout: (1000 * 60) * 5,
      receiveTimeout: (options.connectTimeout * 0.6).toInt(),
      validateStatus: (status) {
        return true;
      },
    );

    interceptors.add(PrettyDioLogger(
      requestBody: true,
      responseBody: false,
    ));
    interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      this.options.headers = <String, dynamic>{
        HttpHeaders.authorizationHeader:
            'Bearer ${sl<SharedPreferences>().getString('token')}',
      };
      options.headers = <String, dynamic>{
        HttpHeaders.authorizationHeader:
            'Bearer ${sl<SharedPreferences>().getString('token')}',
      };
      return handler.next(options);
    }, onResponse: (response, handler) {
      _ifTokenExpired(response);
      return handler.next(response);
    }, onError: (DioError e, handler) {
      _ifTokenExpired(e.response);
      return handler.next(e);
    }));
  }
  // dotenv.env['GIT_BRANCH'];

  // this.options.baseUrl = urlHOST;
  // // this.options.baseUrl = const String.fromEnvironment('API_URL', defaultValue: 'http://182.253.222.86:4100/');
  // this.options.validateStatus = (status) => true;
  // this.options.connectTimeout = (1000 * 60) * 5;
  // this.options.receiveTimeout = (this.options.connectTimeout * 0.6).toInt();
}

void _ifTokenExpired(Response<dynamic>? response) {
  if ((response?.statusCode == 400 || response?.statusCode == 401) &&
      response?.data is Map<String, dynamic>) {
    if (response?.data['message'] is String) {
      final message = (response?.data['message'] as String).toLowerCase();

      if (message.contains('token') && message.contains('expired')) {
        // sl<SharedPreferences>().remove('token');
        // sl<GlobalKey<NavigatorState>>().currentState?.pushNamedAndRemoveUntil(Routes.LOGIN, (route) => false);
      }
    }
  }
}
