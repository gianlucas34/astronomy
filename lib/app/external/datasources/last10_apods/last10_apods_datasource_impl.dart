import 'package:astronomy/app/infra/datasources/last10_apods/last10_apods_datasource.dart';
import 'package:astronomy/app/infra/models/apod_model.dart';
import 'package:astronomy/core/interfaces/http.dart';
import 'package:astronomy/core/returns/errors.dart';
import 'package:intl/intl.dart';

class Last10ApodsDatasourceImpl implements Last10ApodsDatasource {
  final Http http;

  Last10ApodsDatasourceImpl(this.http);

  @override
  Future<List<ApodModel>> fetchLast10Apods() async {
    final todayDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    final tenDaysAgo = DateFormat('yyyy-MM-dd')
        .format(DateTime.now().subtract(const Duration(days: 9)));
    final result = await http.get("/apod", {
      "start_date": tenDaysAgo,
      "end_date": todayDate,
    });

    if (result.statusCode == 200) {
      final list = (result.data as List);

      return list.map((item) => ApodModel.fromJson(item)).toList();
    } else {
      throw const DatasourceError();
    }
  }
}
