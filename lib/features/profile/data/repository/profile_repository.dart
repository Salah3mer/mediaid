import 'package:dartz/dartz.dart';
import 'package:mediaid/core/errors/failure.dart';
import 'package:mediaid/features/profile/data/model/profile_model/profile_model.dart';

abstract class ProfleRepository {
  Future<Either<Failure, ProfileModel>> getProfile({required String token});
}
