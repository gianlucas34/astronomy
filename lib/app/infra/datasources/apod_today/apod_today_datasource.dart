import 'package:astronomy/app/infra/models/apod_model.dart';

abstract class ApodTodayDatasource {
  Future<ApodModel> fetchApodToday();
}
