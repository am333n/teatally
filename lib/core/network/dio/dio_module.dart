// Package imports:
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

// this class is used to initialize third party modules

@module
abstract class RegisterModule {
  @Named("commonInstance")
  @Singleton()
  Dio get commonInstance => _createDioInstance();

  Dio _createDioInstance() {
    final dio = Dio();
    // Configure your Dio instance here
    return dio;
  }
}
