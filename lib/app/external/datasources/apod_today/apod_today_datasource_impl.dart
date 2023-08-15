import 'package:astronomy/app/infra/datasources/apod_today/apod_today_datasource.dart';
import 'package:astronomy/app/infra/models/apod_model.dart';
import 'package:astronomy/core/interfaces/http.dart';
import 'package:astronomy/core/returns/errors.dart';

class ApodTodayDatasourceImpl implements ApodTodayDatasource {
  final Http http;

  ApodTodayDatasourceImpl(this.http);

  @override
  Future<ApodModel> fetchApodToday() async {
    final result = await http.get("/apod");

    if (result.statusCode == 200) {
      return ApodModel.fromJson(result.data);
    } else {
      throw const DatasourceError();
    }
  }
}
