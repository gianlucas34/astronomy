import 'package:astronomy/app/domain/entities/apod_entity.dart';
import 'package:astronomy/app/domain/repositories/last10_apods/last10_apods_repository.dart';
import 'package:astronomy/app/infra/datasources/last10_apods/last10_apods_datasource.dart';
import 'package:astronomy/core/interfaces/failure.dart';
import 'package:astronomy/core/interfaces/network_info.dart';
import 'package:astronomy/core/returns/errors.dart';
import 'package:dartz/dartz.dart';

class Last10ApodsRepositoryImpl implements Last10ApodsRepository {
  final Last10ApodsDatasource datasource;
  final NetworkInfo networkInfo;

  Last10ApodsRepositoryImpl(this.datasource, this.networkInfo);

  @override
  Future<Either<Failure, List<ApodEntity>>> fetchLast10Apods() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await datasource.fetchLast10Apods();

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
