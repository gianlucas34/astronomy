import 'package:astronomy/core/interfaces/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Return, Params> {
  Future<Either<Failure, Return>> call(Params params);
}

class NoParams {}
