import 'package:e_commerce/data/data_sources/remote/auth_repository_data_source.dart';
import 'package:e_commerce/domain/entities/request/login_request.dart';
import 'package:e_commerce/domain/entities/request/register_request.dart';
import 'package:e_commerce/domain/entities/response/auth_response.dart';
import 'package:e_commerce/domain/repositories/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository{
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<AuthResponse> login(LoginRequest loginRequest) {
    // TODO: implement login
   return authRemoteDataSource.login(loginRequest);
  }

  @override
  Future<AuthResponse> register(RegisterRequest registerRequest) {
    // TODO: implement register
    return authRemoteDataSource.register(registerRequest);
  }

}