import 'package:e_commerce/domain/entities/response/auth_response.dart';

abstract class AuthState{}
class InitialState extends AuthState{}
class AuthLoadingState extends AuthState{}
class AuthSuccessState extends AuthState{
  AuthResponse authResponse;
  AuthSuccessState({required this.authResponse});
}
class AuthErrorState extends AuthState{
  String errorMessage;
  AuthErrorState({required this.errorMessage});
}

