abstract class AppException implements Exception{
  String message;
  int? stausCode;
  AppException({required this.message, this.stausCode});
}


class ServerException extends AppException{
  ServerException({required super.message, super.stausCode});
}

class NetworkException extends AppException{
  NetworkException({required super.message});
}

class UnexpectedException extends AppException{
  UnexpectedException({required super.message});
}