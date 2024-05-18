import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mediaid/core/api/api_service_impl.dart';
import 'package:mediaid/features/auth/data/repository/auth_repo_impl.dart';
import 'package:mediaid/features/home/data/repository/home_repo_impl.dart';

final getIt = GetIt.instance;

void getItSetup() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<ApiServicesImplementation>(
      ApiServicesImplementation(getIt()));
  getIt.registerSingleton<AuthRepositoryImpl>(
      AuthRepositoryImpl(apiServices: getIt()));
  getIt.registerSingleton<HomeRepositoryImple>(
      HomeRepositoryImple(apiServicesImplementation: getIt()));
}
