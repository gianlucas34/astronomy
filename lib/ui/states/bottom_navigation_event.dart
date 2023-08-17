part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationEvent extends Equatable {
  final int currentIndex;

  const BottomNavigationEvent(this.currentIndex);

  @override
  List<Object?> get props => [currentIndex];
}

class TabChangeEvent extends BottomNavigationEvent {
  const TabChangeEvent(super.currentIndex);
}
