import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class LoggingInterceptor extends Interceptor {
  final bool enableLogging;
  final Logger _logger;

  LoggingInterceptor({this.enableLogging = true})
      : _logger = Logger(
          printer: PrettyPrinter(
            methodCount: 0,
            errorMethodCount: 5,
            lineLength: 100,
            colors: true,
            printEmojis: true,
          ),
        );

  String _formatJson(dynamic data) {
    try {
      if (data is String) {
        return const JsonEncoder.withIndent('  ').convert(json.decode(data));
      }
      return const JsonEncoder.withIndent('  ').convert(data);
    } catch (e) {
      return data.toString();
    }
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (enableLogging) {
      _logger.w(
        '''
*** Request ***
Method: ${options.method}
URL: ${options.uri}
Data: ${_formatJson(options.data)}
Headers: ${options.headers}
''',
      );
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (enableLogging) {
      _logger.f(
        '''
*** Response ***
Status Code: ${response.statusCode},
URL: ${response.realUri}
Data: ${_formatJson(response.data)}''',
      );
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (enableLogging) {
      _logger.e(
        '''
*** Error ***
URL: ${err.requestOptions.uri}
Type: ${err.type}
Message: ${err.message}
Error: ${err.error}
Response: ${err.response != null ? _formatJson(err.response?.data) : 'N/A'}''',
      );
    }
    handler.next(err);
  }
}
