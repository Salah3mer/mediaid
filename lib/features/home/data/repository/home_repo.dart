import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:mediaid/core/errors/failure.dart';
import 'package:mediaid/features/home/data/models/home_model/home_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, HomeModel>> getHome({required String token});
}
