import 'package:astronomy/app/domain/repositories/apod_today/apod_today_repository.dart';
import 'package:astronomy/app/domain/repositories/last10_apods/last10_apods_repository.dart';
import 'package:astronomy/app/domain/usecases/apod_today/fetch_apod_today_usecase.dart';
import 'package:astronomy/app/domain/usecases/last10_apods/fetch_last10_apods_usecase.dart';
import 'package:astronomy/app/external/datasources/apod_today/apod_today_datasource_impl.dart';
import 'package:astronomy/app/external/datasources/last10_apods/last10_apods_datasource_impl.dart';
import 'package:astronomy/app/infra/datasources/apod_today/apod_today_datasource.dart';
import 'package:astronomy/app/infra/datasources/last10_apods/last10_apods_datasource.dart';
import 'package:astronomy/app/infra/repositories/apod_today/apod_today_repository_impl.dart';
import 'package:astronomy/app/infra/repositories/last10_apods/last10_apods_repository_impl.dart';
import 'package:astronomy/app/presentation/states/apod_today/apod_today_bloc.dart';
import 'package:astronomy/app/presentation/states/last10_apods/last10_apods_bloc.dart';
import 'package:astronomy/core/interfaces/http.dart';
import 'package:astronomy/core/interfaces/network_info.dart';
import 'package:astronomy/core/services/http_impl.dart';
import 'package:astronomy/core/services/network_info_impl.dart';
import 'package:astronomy/routes/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

GetIt getIt = GetIt.instance;

Future<void> setupProviders() async {
  //services
  getIt.registerLazySingleton<Http>(() => HttpImpl());
  getIt.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker(),
  );
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
  getIt.registerLazySingleton<BottomNavigationBloc>(
      () => BottomNavigationBloc());

  //futures
  apodToday();
  last10Apods();
}

void apodToday() {
  getIt.registerLazySingleton<ApodTodayDatasource>(
    () => ApodTodayDatasourceImpl(getIt()),
  );
  getIt.registerLazySingleton<ApodTodayRepository>(
    () => ApodTodayRepositoryImpl(getIt(), getIt()),
  );
  getIt.registerLazySingleton<FetchApodTodayUsecase>(
    () => FetchApodTodayUsecase(getIt()),
  );
  getIt.registerFactory<ApodTodayBloc>(() => ApodTodayBloc(getIt()));
}

void last10Apods() {
  getIt.registerLazySingleton<Last10ApodsDatasource>(
    () => Last10ApodsDatasourceImpl(getIt()),
  );
  getIt.registerLazySingleton<Last10ApodsRepository>(
    () => Last10ApodsRepositoryImpl(getIt(), getIt()),
  );
  getIt.registerLazySingleton<FetchLast10ApodsUsecase>(
    () => FetchLast10ApodsUsecase(getIt()),
  );
  getIt.registerFactory<Last10ApodsBloc>(() => Last10ApodsBloc(getIt()));
}
