import 'package:dio/dio.dart';

class DioProvider {
  DioProvider._();

  static Dio get() {
    final BaseOptions options = BaseOptions(
      baseUrl:
          'https://raw.githubusercontent.com/SkbkonturMobile/mobile-test-droid/master/json',
      connectTimeout: 10000,
      receiveTimeout: 10000,
    );
    return Dio(options)..interceptors.add(LogInterceptor());
  }
}
