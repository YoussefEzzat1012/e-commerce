import 'package:e_commerce/domain/entities/response/user.dart';

import '../models/response/user_dto.dart';

extension UserDtoMappers on UserDto{
  User toUser() {
    return User(
      name: name,
      email: email,
      role: role
    );
  }
}