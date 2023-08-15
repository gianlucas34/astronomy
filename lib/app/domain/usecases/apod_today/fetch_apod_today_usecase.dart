import 'package:astronomy/app/domain/entities/apod_entity.dart';
import 'package:astronomy/app/domain/repositories/apod_today/apod_today_repository.dart';
import 'package:astronomy/core/interfaces/failure.dart';
import 'package:astronomy/core/interfaces/usecase.dart';
import 'package:dartz/dartz.dart';

class FetchApodTodayUsecase extends UseCase<ApodEntity, NoParams> {
  final ApodTodayRepository repository;

  FetchApodTodayUsecase(this.repository);

  @override
  Future<Either<Failure, ApodEntity>> call(NoParams params) async {
    return await repository.fetchApodToday();
  }
}
