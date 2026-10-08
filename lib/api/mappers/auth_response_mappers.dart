import 'package:e_commerce/api/mappers/user_dto_mappers.dart';
import 'package:e_commerce/api/models/response/auth_response_dto.dart';
import 'package:e_commerce/core/exceptions/app_exceptions.dart';
import 'package:e_commerce/domain/entities/response/auth_response.dart';

extension AuthResponseMappers on AuthResponseDTO{
  AuthResponse toAuthResponse() {
    if (token !=null || token!.isNotEmpty || user != null){
      return AuthResponse(
          message: message,
          user: user?.toUser(),
          token: token
      );
    }else {
      throw ServerException(message: "Faild Authentication");
    }

  }
}