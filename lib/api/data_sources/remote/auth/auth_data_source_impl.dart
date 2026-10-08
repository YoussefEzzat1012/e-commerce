import 'package:e_commerce/api/api_services.dart';
import 'package:e_commerce/api/mappers/auth_response_mappers.dart';
import 'package:e_commerce/api/mappers/register_request_mappers.dart';
import 'package:e_commerce/data/data_sources/remote/auth_repository_data_source.dart';
import 'package:e_commerce/domain/entities/request/login_request.dart';
import 'package:e_commerce/domain/entities/request/register_request.dart';
import 'package:e_commerce/domain/entities/response/auth_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiServices apiServices;
  AuthRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<AuthResponse> login(LoginRequest loginRequest) async{
    // TODO: implement login
   var authResponse = await apiServices.login(loginRequest.toLoginRequestDto());
   return authResponse.toAuthResponse();
  }

  @override
  Future<AuthResponse> register(RegisterRequest registerRequest) async{
    // TODO: implement register
    var authResponse = await apiServices.register(registerRequest.toRegisterRequestDto());
    return authResponse.toAuthResponse();
  }

}