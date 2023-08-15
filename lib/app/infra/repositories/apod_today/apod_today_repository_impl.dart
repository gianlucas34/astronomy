import 'package:astronomy/app/domain/entities/apod_entity.dart';
import 'package:astronomy/app/domain/repositories/apod_today/apod_today_repository.dart';
import 'package:astronomy/app/infra/datasources/apod_today/apod_today_datasource.dart';
import 'package:astronomy/core/interfaces/failure.dart';
import 'package:astronomy/core/interfaces/network_info.dart';
import 'package:astronomy/core/returns/errors.dart';
import 'package:dartz/dartz.dart';

class ApodTodayRepositoryImpl implements ApodTodayRepository {
  final ApodTodayDatasource datasource;
  final NetworkInfo networkInfo;

  ApodTodayRepositoryImpl(this.datasource, this.networkInfo);

  @override
  Future<Either<Failure, ApodEntity>> fetchApodToday() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await datasource.fetchApodToday();

        return Right(result);
      } on Failure catch (failure) {
        return Left(failure);
      } catch (e) {
        return const Left(InternalError());
      }
    } else {
      return const Left(NoConnectionError());
    }
  }
}
