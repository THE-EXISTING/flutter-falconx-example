import 'package:core/app.dart';

/// Singleton
class AppHttpClient extends HttpClientX {
  AppHttpClient._singleton({required super.dio});

  static AppHttpClient instance = AppHttpClient._singleton(dio: Dio());

  @override
  void setupConfig(Dio dio, BaseOptions config) {
    super.setupConfig(dio, config);
    config
      ..connectTimeout = 20000
      ..receiveTimeout = 20000;
  }

  @override
  void setupInterceptors(Dio dio, Interceptors interceptors) {
    super.setupInterceptors(dio, interceptors);
    interceptors.addAll([
      // AccessTokenInterceptor(
      //   dio: dio,
      //   retryAccessTokenLimit: 3,
      // ), // Should call before another interceptor.
      // NetworkErrorHandlerInterceptor(),
      HttpLogInterceptor(), // Add to last
    ]);
  }
}
