part of 'apod_today_bloc.dart';

abstract class ApodTodayState extends Equatable {
  const ApodTodayState();

  @override
  List<Object?> get props => [];
}

class ApodTodaySucessState extends ApodTodayState {
  final ApodEntity apod;

  const ApodTodaySucessState(this.apod);

  @override
  List<Object?> get props => [apod];
}

class ApodTodayErrorState extends ApodTodayState {
  final String message;

  const ApodTodayErrorState(this.message);

  @override
  List<Object?> get props => [message];
}

class ApodTodayLoadingState extends ApodTodayState {}
