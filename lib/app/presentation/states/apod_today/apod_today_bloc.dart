import 'dart:async';
import 'package:astronomy/app/domain/entities/apod_entity.dart';
import 'package:astronomy/app/domain/usecases/apod_today/fetch_apod_today_usecase.dart';
import 'package:astronomy/core/interfaces/usecase.dart';
import 'package:equatable/equatable.dart';

part 'apod_today_event.dart';
part 'apod_today_state.dart';

class ApodTodayBloc {
  FetchApodTodayUsecase fetchApodTodayUsecase;

  ApodTodayBloc(this.fetchApodTodayUsecase) {
    _eventController.stream.listen(_mapEventToState);
  }

  final StreamController<ApodTodayEvent> _eventController =
      StreamController<ApodTodayEvent>.broadcast();
  final StreamController<ApodTodayState> _stateController =
      StreamController<ApodTodayState>.broadcast();

  Sink<ApodTodayEvent> get event => _eventController.sink;
  Stream<ApodTodayState> get state => _stateController.stream;

  void _mapEventToState(ApodTodayEvent event) async {
    _stateController.add(ApodTodayLoadingState());

    if (event is FetchApodTodayEvent) {
      final result = await fetchApodTodayUsecase(NoParams());

      result.fold(
        (failure) => _stateController.add(ApodTodayErrorState(failure.message)),
        (apod) => _stateController.add(ApodTodaySucessState(apod)),
      );
    }
  }
}
