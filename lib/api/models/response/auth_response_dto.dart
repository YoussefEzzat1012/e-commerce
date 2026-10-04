import 'package:json_annotation/json_annotation.dart';

part 'auth_response_dto.g.dart';

@JsonSerializable()
class AuthResponseDTO {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "user")
  final User? user;
  @JsonKey(name: "token")
  final String? token;

  AuthResponseDTO ({
    this.message,
    this.user,
    this.token,
  });

  factory AuthResponseDTO.fromJson(Map<String, dynamic> json) {
    return _$AuthResponseDTOFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AuthResponseDTOToJson(this);
  }
}

@JsonSerializable()
class User {
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "role")
  final String? role;

  User ({
    this.name,
    this.email,
    this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserToJson(this);
  }
}


