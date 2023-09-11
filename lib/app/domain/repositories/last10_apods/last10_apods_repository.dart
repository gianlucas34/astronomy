import 'package:astronomy/app/domain/entities/apod_entity.dart';
import 'package:astronomy/core/interfaces/failure.dart';
import 'package:dartz/dartz.dart';

abstract class Last10ApodsRepository {
  Future<Either<Failure, List<ApodEntity>>> fetchLast10Apods();
}
