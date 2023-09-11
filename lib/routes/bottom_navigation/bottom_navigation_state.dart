part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationState extends Equatable {
  final int currentIndex;

  const BottomNavigationState(this.currentIndex);

  @override
  List<Object?> get props => [currentIndex];
}

class BottomNavigationSuccessState extends BottomNavigationState {
  const BottomNavigationSuccessState(super.currentIndex);
}
