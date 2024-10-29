import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:pikpo/core/network/api_url.dart';
import 'package:pikpo/core/network/logging_interceptor.dart';

/// A Dio module with mixin capabilities, implementing Dio functionality.
class DioModule with DioMixin implements Dio {
  /// Private constructor for DioModule.
  DioModule._([BaseOptions? options]) {
    options ??= BaseOptions(
      baseUrl: Endpoint.api,
      contentType: 'application/json',
      connectTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );

    this.options = options;
    interceptors.add(LoggingInterceptor());
    httpClientAdapter = IOHttpClientAdapter();
  }

  /// Static method to get an instance of DioModule.
  static Dio getInstance([BaseOptions? options]) => DioModule._(options);
}
