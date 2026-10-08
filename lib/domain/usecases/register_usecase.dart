import 'package:e_commerce/domain/entities/response/auth_response.dart';
import 'package:e_commerce/domain/repositories/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';
import '../entities/request/register_request.dart';

@injectable
class RegisterUseCase {
  AuthRepository authRepository;
  RegisterUseCase({required this.authRepository});

  Future<AuthResponse> invoke(RegisterRequest registerRequest) {
    return authRepository.register(registerRequest);
  }
}