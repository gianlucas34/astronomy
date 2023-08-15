import 'package:astronomy/app/domain/entities/apod_entity.dart';
import 'package:astronomy/core/returns/errors.dart';
import 'package:astronomy/core/interfaces/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:astronomy/app/domain/repositories/apod_today/apod_today_repository.dart';
import 'package:astronomy/app/domain/usecases/apod_today/fetch_apod_today_usecase.dart';
import 'fetch_apod_today_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ApodTodayRepository>()])
void main() {
  final repository = MockApodTodayRepository();
  final usecase = FetchApodTodayUsecase(repository);

  test('Should return a ApodEntity', () async {
    when(repository.fetchApodToday())
        .thenAnswer((_) async => Right(mockedResult));

    final result = await usecase(NoParams());

    expect(result, Right(mockedResult));
  });

  test('Should return a Failure', () async {
    when(repository.fetchApodToday()).thenAnswer(
      (_) async => const Left(NoConnectionError()),
    );

    final result = await usecase(NoParams());

    expect(result, const Left(NoConnectionError()));
  });
}

final mockedResult = ApodEntity(
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
);
