import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mediaid/core/api/api_service_impl.dart';
import 'package:mediaid/core/errors/api_error_model.dart';
import 'package:mediaid/core/errors/failure.dart';
import 'package:mediaid/core/api/end_point.dart';
import 'package:mediaid/features/auth/data/models/auth_Model/auth_responce_body_model.dart';
import 'package:mediaid/features/auth/data/repository/auth_repo.dart';

class AuthRepositoryImpl extends AuthRepository {
  final ApiServicesImplementation apiServices;

  AuthRepositoryImpl({required this.apiServices});

  @override
  Future<Either<Failure, AuthResponceBodyModel>> login(
      {required String email, required String password}) async {
    try {
      var resulte =
          await apiServices.post(endPoint: EndPoints.loginEndPoint, data: {
        "email": email,
        "password": password,
      });
      return Right(AuthResponceBodyModel.fromJson(resulte.data));
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure(e.response!.statusMessage!));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, AuthResponceBodyModel>> register(
      {required String name,
      required String email,
      required String phone,
      required String password,
      required String confirmPassword,
      required String gender}) async {
    try {
      var resulte =
          await apiServices.post(endPoint: EndPoints.registerEndPoint, data: {
        "name": name,
        "email": email,
        "phone": phone,
        "gender": gender,
        "password": password,
        "password_confirmation": confirmPassword,
      });
      return Right(AuthResponceBodyModel.fromJson(resulte.data));
    } catch (e) {
      if (e is DioError) {
        print(ApiErrorModel.fromJson(e.response!.data).data);
        return Left(
            ServerFailure(ApiErrorModel.fromJson(e.response!.data).message!));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
