import 'package:dio/dio.dart';
import 'package:e_commerce/core/exceptions/app_exceptions.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    AppException exception;
    final responseData = err.response?.data;
    String message = 'Something went wrong';
    if (responseData is Map) {
      message = (responseData['errors']?['msg'] as String?) ??
          (responseData['message'] as String?) ??
            message;
    }

    if (err.type == DioExceptionType.connectionError || err.type == DioExceptionType.connectionTimeout) {
      exception = NetworkException(message: "No Internet Connection");
    } else if (err.response?.statusCode != null) {
      exception = ServerException(message: message, stausCode: err.response?.statusCode );
    } else{
      exception = UnexpectedException(message: message);
    }




    handler.next(DioException(
        requestOptions: err.requestOptions,
        error: exception),
    );

  }
}