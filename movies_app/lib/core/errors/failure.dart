import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection TimeOut");
      case DioExceptionType.sendTimeout:
        return ServerFailure("Send TimeOut with ApiServer");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("Recieve TimeOut with ApiServer");
      case DioExceptionType.badCertificate:
        return ServerFailure("Bad Certificate");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response?.statusCode ?? 0,
            dioException.response?.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceld');
      case DioExceptionType.connectionError:
        return ServerFailure('Error while connecting to server');
      case DioExceptionType.unknown:
        if (dioException.message?.contains('SocketException') ?? false) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('UnExpected Error , try again');
      default:
        return ServerFailure('UnExpected Error , try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later');
    } else {
      return ServerFailure(
          'Opps There was an Error with code $statusCode, Please try again');
    }
  }
}
