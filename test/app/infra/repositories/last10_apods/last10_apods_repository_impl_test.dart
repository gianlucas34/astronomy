import 'package:astronomy/app/infra/datasources/last10_apods/last10_apods_datasource.dart';
import 'package:astronomy/app/infra/models/apod_model.dart';
import 'package:astronomy/app/infra/repositories/last10_apods/last10_apods_repository_impl.dart';
import 'package:astronomy/core/interfaces/network_info.dart';
import 'package:astronomy/core/returns/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'last10_apods_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Last10ApodsDatasource>(), MockSpec<NetworkInfo>()])
void main() {
  final datasource = MockLast10ApodsDatasource();
  final networkInfo = MockNetworkInfo();
  final repository = Last10ApodsRepositoryImpl(datasource, networkInfo);

  setUp(() {
    reset(datasource);
  });

  test(
    'Should return a List<ApodModel> if user network is connected',
    () async {
      when(networkInfo.isConnected).thenAnswer((_) async => true);
      when(datasource.fetchLast10Apods()).thenAnswer((_) async => mockedResult);

      final result = await repository.fetchLast10Apods();

      expect(result, Right(mockedResult));
    },
  );

  test(
      'Should return a DatasourceError if user network is connected but datasource failed',
      () async {
    when(networkInfo.isConnected).thenAnswer((_) async => true);
    when(datasource.fetchLast10Apods()).thenThrow(const DatasourceError());

    final result = await repository.fetchLast10Apods();

    expect(result, const Left(DatasourceError()));
  });

  test(
    'Should return a InternalError if user network is connected but the error is not of type Failure',
    () async {
      when(networkInfo.isConnected).thenAnswer((_) async => true);
      when(datasource.fetchLast10Apods()).thenThrow(Exception());

      final result = await repository.fetchLast10Apods();

      expect(result, const Left(InternalError()));
    },
  );

  test(
    'Should return a NoConnectionError if user network is disconnected',
    () async {
      when(networkInfo.isConnected).thenAnswer((_) async => false);

      final result = await repository.fetchLast10Apods();

      verifyNever(datasource.fetchLast10Apods());

      expect(result, const Left(NoConnectionError()));
    },
  );
}

final mockedResult = [
  ApodModel(
    title: "Spiral Aurora over Icelandic Divide",
    explanation:
        "Admire the beauty but fear the beast. The beauty is the aurora overhead, here taking the form of a great green spiral, seen between picturesque clouds with the bright Moon to the side and stars in the background.  The beast is the wave of charged particles that creates the aurora but might, one day, impair civilization.  In 1859, following notable auroras seen all across the globe, a pulse of charged particles from a coronal mass ejection (CME) associated with a solar flare impacted Earth's magnetosphere so forcefully that it created the Carrington Event. This assault from the Sun compressed the Earth's magnetic field so violently that it created high currents and sparks along telegraph wires, shocking many telegraph operators.  Were a Carrington-class event to impact the Earth today, speculation holds that damage might occur to global power grids and electronics on a scale never yet experienced.  The featured aurora was imaged in 2016 over Thingvallavatn Lake in Iceland, a lake that partly fills a fault that divides Earth's large Eurasian and North American tectonic plates.   Almost Hyperspace: Random APOD Generator",
    url: "https://apod.nasa.gov/apod/image/2307/AuroraPingvllir_Casado_960.jpg",
    hdurl:
        "https://apod.nasa.gov/apod/image/2307/AuroraPingvllir_Casado_1336.jpg",
    date: DateTime.parse("2023-07-30"),
    mediaType: "image",
    serviceVersion: "v1",
    copyright: "Juan Carlos Casado",
  )
];
