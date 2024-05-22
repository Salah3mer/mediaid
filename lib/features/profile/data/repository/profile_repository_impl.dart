import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mediaid/config/constants.dart';
import 'package:mediaid/core/api/api_service_impl.dart';
import 'package:mediaid/core/api/end_point.dart';
import 'package:mediaid/core/errors/failure.dart';
import 'package:mediaid/features/profile/data/model/profile_model/profile_model.dart';
import 'package:mediaid/features/profile/data/repository/profile_repository.dart';

class ProfileRepositoryImpl extends ProfleRepository {
  final ApiServicesImplementation apiServicesImplementation;

  ProfileRepositoryImpl(this.apiServicesImplementation);
  @override
  Future<Either<Failure, ProfileModel>> getProfile(
      {required String token}) async {
    try {
      var resulte = await apiServicesImplementation.get(
          endPoint: EndPoints.profileEndPoint, token: AppConstans.token);

      return Right(ProfileModel.fromJson(resulte.data));
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure(e.message!));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
