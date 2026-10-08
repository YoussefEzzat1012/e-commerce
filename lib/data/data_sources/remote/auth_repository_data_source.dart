
import 'package:e_commerce/domain/entities/request/login_request.dart';
import 'package:e_commerce/domain/entities/request/register_request.dart';
import 'package:e_commerce/domain/entities/response/auth_response.dart';
import 'package:injectable/injectable.dart';


abstract class AuthRemoteDataSource{
  Future<AuthResponse> login(LoginRequest loginRequest);
  Future<AuthResponse> register(RegisterRequest registerRequest);
}