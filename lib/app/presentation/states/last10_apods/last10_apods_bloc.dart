import 'dart:async';
import 'package:astronomy/app/domain/entities/apod_entity.dart';
import 'package:astronomy/app/domain/usecases/last10_apods/fetch_last10_apods_usecase.dart';
import 'package:astronomy/core/interfaces/usecase.dart';
import 'package:equatable/equatable.dart';

part 'last10_apods_event.dart';
part 'last10_apods_state.dart';

class Last10ApodsBloc {
  FetchLast10ApodsUsecase fetchLast10ApodsUsecase;

  Last10ApodsBloc(this.fetchLast10ApodsUsecase) {
    _eventController.stream.listen(_mapEventToState);
  }

  final StreamController<Last10ApodsEvent> _eventController =
      StreamController<Last10ApodsEvent>.broadcast();
  final StreamController<Last10ApodsState> _stateController =
      StreamController<Last10ApodsState>.broadcast();

  Sink<Last10ApodsEvent> get event => _eventController.sink;
  Stream<Last10ApodsState> get state => _stateController.stream;

  void _mapEventToState(Last10ApodsEvent event) async {
    _stateController.add(Last10ApodsLoadingState());

    if (event is FetchLast10ApodsEvent) {
      final result = await fetchLast10ApodsUsecase(NoParams());

      result.fold(
        (failure) => _stateController.add(
          Last10ApodsErrorState(failure.message),
        ),
        (apods) => _stateController.add(Last10ApodsSucessState(apods)),
      );
    }
  }
}
