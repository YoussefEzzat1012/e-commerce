
import 'package:dio/dio.dart';
import 'package:e_commerce/api/api_services.dart';
import 'package:e_commerce/api/end_points.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class GetItModule{

 @singleton
 @injectable
 BaseOptions provideBaseOption() {
   return BaseOptions(
     baseUrl: EndPoints.baseUrl,
     receiveTimeout: Duration(seconds: 30),
     connectTimeout: Duration(seconds: 30),
     receiveDataWhenStatusError: true
   );
 }


 @singleton
 @injectable
PrettyDioLogger providePrettyDioLogger(){
   return PrettyDioLogger(
     request: true,
     requestHeader: true,
     responseBody: true,
     requestBody: true,
     responseHeader: true,
     error: true
   );
 }

 @singleton
 @injectable
 Dio providedDio(BaseOptions baseOptions,PrettyDioLogger prettyDioLogger) {
   var dio = Dio(baseOptions);
   dio.interceptors.add(prettyDioLogger);
   return dio;
 }

 ApiServices providedApiServices(dio) => ApiServices(dio);
}