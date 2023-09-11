import 'dart:async';
import 'package:equatable/equatable.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc {
  BottomNavigationBloc() {
    _eventController.stream.listen(_mapEventToState);
  }

  final StreamController<BottomNavigationEvent> _eventController =
      StreamController<BottomNavigationEvent>.broadcast();
  final StreamController<BottomNavigationState> _stateController =
      StreamController<BottomNavigationState>.broadcast();

  Sink<BottomNavigationEvent> get event => _eventController.sink;
  Stream<BottomNavigationState> get state => _stateController.stream;

  void _mapEventToState(BottomNavigationEvent event) async {
    if (event is TabChangeEvent) {
      _stateController.add(BottomNavigationSuccessState(event.currentIndex));
    }
  }
}
