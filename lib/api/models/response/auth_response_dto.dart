import 'package:e_commerce/api/models/response/user_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_response_dto.g.dart';

@JsonSerializable()
class AuthResponseDTO {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "user")
  final UserDto? user;
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


