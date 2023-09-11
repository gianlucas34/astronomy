part of 'last10_apods_bloc.dart';

abstract class Last10ApodsEvent extends Equatable {
  const Last10ApodsEvent();

  @override
  List<Object?> get props => [];
}

class FetchLast10ApodsEvent extends Last10ApodsEvent {}
