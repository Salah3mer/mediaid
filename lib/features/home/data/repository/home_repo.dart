import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:mediaid/core/errors/failure.dart';
import 'package:mediaid/features/home/data/models/home_model/doctor.dart';
import 'package:mediaid/features/home/data/models/home_model/home_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, HomeModel>> getHome({required String token});
  Future<Either<Failure, List<Doctor>>> search({required String token, required String name });
}
