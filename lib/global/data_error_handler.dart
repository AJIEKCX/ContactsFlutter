import 'package:contacts_flutter/generated/l10n.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class DataErrorHandler {
  String handle(Exception e) {
    final strings = S(Intl.getCurrentLocale());
    if (e is DioError) {
      switch (e.type) {
        case DioErrorType.CANCEL:
          return strings.error_request_canceled;
        case DioErrorType.CONNECT_TIMEOUT:
          return strings.error_connection_timeout;
        case DioErrorType.DEFAULT:
          return strings.error_connection;
        case DioErrorType.RECEIVE_TIMEOUT:
          return strings.error_receive_timeout;
        case DioErrorType.SEND_TIMEOUT:
          return strings.error_send_timeout;
        case DioErrorType.RESPONSE:
          return strings.error_response(e.response.statusCode);
      }
    }
    return strings.error_loading_data_title;
  }
}
