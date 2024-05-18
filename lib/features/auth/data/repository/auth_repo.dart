import 'package:dartz/dartz.dart';
import 'package:mediaid/core/errors/failure.dart';
import 'package:mediaid/features/auth/data/models/auth_Model/auth_responce_body_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResponceBodyModel>> login({
    required String email,
    required String password,
  });
  Future<Either<Failure, AuthResponceBodyModel>> register({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
    required String gender,
  });
}
