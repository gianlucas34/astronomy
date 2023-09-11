import 'package:astronomy/app/infra/models/apod_model.dart';

abstract class Last10ApodsDatasource {
  Future<List<ApodModel>> fetchLast10Apods();
}
