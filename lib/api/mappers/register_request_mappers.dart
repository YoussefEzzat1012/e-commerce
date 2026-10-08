import 'package:e_commerce/api/models/request/register_request_dto.dart';
import 'package:e_commerce/domain/entities/request/register_request.dart';

extension RegisterRequestMappers on RegisterRequest{
  RegisterRequestDto toRegisterRequestDto(){
    return RegisterRequestDto(
      email: email,
      name: name,
      password: password,
      rePassword: rePassword,
      phone: phone
    );
  }
}