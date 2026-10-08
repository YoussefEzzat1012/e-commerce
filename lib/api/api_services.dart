import 'package:dio/dio.dart';
import 'package:e_commerce/api/models/request/login_request_dto.dart';
import 'package:e_commerce/api/models/request/register_request_dto.dart';
import 'package:e_commerce/api/models/response/auth_response_dto.dart';
import 'package:retrofit/retrofit.dart';

import 'end_points.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  @POST(EndPoints.loginApi)
  Future<AuthResponseDTO> login(@Body() LoginRequestDto loginRequest);

  @POST(EndPoints.registerApi)
  Future<AuthResponseDTO> register(@Body() RegisterRequestDto registerRequest);
}

