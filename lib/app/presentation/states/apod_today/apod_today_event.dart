part of 'apod_today_bloc.dart';

abstract class ApodTodayEvent extends Equatable {
  const ApodTodayEvent();

  @override
  List<Object?> get props => [];
}

class FetchApodTodayEvent extends ApodTodayEvent {}
