import 'package:mediaid/core/errors/api_error_model.dart';

abstract class Failure {
  final String error;

  const Failure(this.error);
}

class ServerFailure extends Failure {
  ApiErrorModel? apiErrorModel;

  ServerFailure(super.error);

  factory ServerFailure.fromDioResponse(int statsCode, dynamic response) {
    switch (statsCode) {
      case 401:
      case 402:
      case 403:
        return ServerFailure(ApiErrorModel.fromJson(response).message!);
      case 404:
        return ServerFailure('Your request not found, Please try later!');
      case 500:
        return ServerFailure('Internal server error, Please try later!');
      default:
        return ServerFailure(response['message']);
    }
  }
}
