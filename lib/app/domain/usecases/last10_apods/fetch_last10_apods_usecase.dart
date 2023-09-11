import 'package:astronomy/app/domain/entities/apod_entity.dart';
import 'package:astronomy/app/domain/repositories/last10_apods/last10_apods_repository.dart';
import 'package:astronomy/core/interfaces/failure.dart';
import 'package:astronomy/core/interfaces/usecase.dart';
import 'package:dartz/dartz.dart';

class FetchLast10ApodsUsecase extends UseCase<List<ApodEntity>, NoParams> {
  final Last10ApodsRepository repository;

  FetchLast10ApodsUsecase(this.repository);

  @override
  Future<Either<Failure, List<ApodEntity>>> call(NoParams params) async {
    return await repository.fetchLast10Apods();
  }
}
