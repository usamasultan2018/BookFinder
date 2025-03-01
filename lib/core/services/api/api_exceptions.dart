class ApiException implements Exception {
  final String message;
  ApiException(this.message);

  @override
  String toString() => message;
}

class BadRequestException extends ApiException {
  BadRequestException([super.message = "Bad Request"]);
}

class UnauthorizedException extends ApiException {
  UnauthorizedException([super.message = "Unauthorized"]);
}

class NotFoundException extends ApiException {
  NotFoundException([super.message = "Not Found"]);
}

class ServerException extends ApiException {
  ServerException([super.message = "Internal Server Error"]);
}

class NoInternetException extends ApiException {
  NoInternetException([super.message = "No Internet Connection"]);
}
