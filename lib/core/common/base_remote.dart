// Dart imports:
import 'dart:developer';
import 'dart:io';

// Package imports:
import 'package:dio/dio.dart';
import 'package:teatally/core/common/endpoints.dart';
import 'package:teatally/core/infrastructure/remote_response.dart';
import 'package:teatally/core/injection/injection.dart';

// Project imports:

// Flutter imports:

enum RequestType { post, patch, get, put, delete }

mixin BaseRemote {
  BaseReturnType post<T>(
    String url, {
    T? body,
    bool isAuth = false,
    Map<String, dynamic>? queryParameters,
    dynamic Function(int, int)? onSendProgress,
  }) async {
    return sendRequest(
      url,
      body,
      RequestType.post,
      queryParameters: queryParameters,
      onSendProgress: onSendProgress,
    );
  }

  BaseReturnType put<E>(String url, {dynamic body}) async {
    return sendRequest<E>(url, body, RequestType.put);
  }

  BaseReturnType patch<E>(String url, Map<String, dynamic> body) async {
    return sendRequest<E>(url, body, RequestType.patch);
  }

  BaseReturnType get<E>(
    String url, {
    Function(int, int)? onReceiveProgress,
    ResponseType? responseType,
    Map<String, dynamic>? queryParameters,
    bool? isAuth,
  }) async {
    return sendRequest<E>(
      url,
      null,
      RequestType.get,
      onReceiveProgress: onReceiveProgress,
      responseType: responseType,
      queryParameters: queryParameters,
    );
  }

  BaseReturnType delete<E>(String url, {dynamic body}) async {
    return sendRequest<E>(url, body, RequestType.delete);
  }

  BaseReturnType sendRequest<E>(
    String url,
    Object? body,
    RequestType type, {
    Map<String, dynamic>? queryParameters,
    Function(int, int)? onReceiveProgress,
    Function(int, int)? onSendProgress,
    ResponseType? responseType,
  }) async {
    try {
      String baseUrl = Endpoints.baseUrl;
      final Dio dio = getIt<Dio>(
        instanceName: "commonInstance",
      );
      dio.options.baseUrl = baseUrl;
      var validationOptions = Options(
        followRedirects: true,
        responseType: responseType,
      );

      var response = switch (type) {
        RequestType.get => await dio.get(
            url,
            onReceiveProgress: onReceiveProgress,
            options: validationOptions,
          ),
        RequestType.post => await dio.post(
            url,
            data: body ?? {},
            options: validationOptions,
            onSendProgress: onSendProgress,
            queryParameters: queryParameters,
          ),
        RequestType.patch => await dio.patch(url, data: body ?? {}),
        RequestType.put => await dio.put(
            url,
            data: body ?? {},
            options: validationOptions,
          ),
        RequestType.delete => await dio.delete(url, data: body ?? {}),
      };

      // debugPrint(response.statusCode.toString());
      // debugPrint(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        return RemoteResponse.failure(response.data);
      } else {
        return RemoteResponse.success(response.data);
      }
    } catch (e) {
      if (e is SocketException) {
        rethrow;
      }
      rethrow;
    }
  }
}
