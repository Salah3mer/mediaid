import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mediaid/config/constants.dart';
import 'package:mediaid/core/api/api_service.dart';
import 'package:mediaid/core/api/api_service_impl.dart';
import 'package:mediaid/core/api/end_point.dart';
import 'package:mediaid/core/errors/api_error_model.dart';
import 'package:mediaid/core/errors/failure.dart';
import 'package:mediaid/features/home/data/models/home_model/home_model.dart';
import 'package:mediaid/features/home/data/repository/home_repo.dart';

class HomeRepositoryImple extends HomeRepository {
  final ApiServicesImplementation apiServicesImplementation;

  HomeRepositoryImple({required this.apiServicesImplementation});
  @override
  Future<Either<Failure, HomeModel>> getHome({required String token}) async {
    try {
      var response = await apiServicesImplementation.get(
          endPoint: EndPoints.homeEndPoint, token: AppConstans.token);

      return Right(HomeModel.fromJson(response.data));
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure(e.response!.statusMessage!));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
