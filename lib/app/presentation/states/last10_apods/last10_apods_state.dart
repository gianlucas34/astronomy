part of 'last10_apods_bloc.dart';

abstract class Last10ApodsState extends Equatable {
  const Last10ApodsState();

  @override
  List<Object?> get props => [];
}

class Last10ApodsSucessState extends Last10ApodsState {
  final List<ApodEntity> apods;

  const Last10ApodsSucessState(this.apods);

  @override
  List<Object?> get props => [apods];
}

class Last10ApodsErrorState extends Last10ApodsState {
  final String message;

  const Last10ApodsErrorState(this.message);

  @override
  List<Object?> get props => [message];
}

class Last10ApodsLoadingState extends Last10ApodsState {}
