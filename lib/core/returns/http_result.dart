import 'package:equatable/equatable.dart';

class HttpResult extends Equatable {
  final Map<String, dynamic> data;
  final int statusCode;

  const HttpResult({
    required this.data,
    required this.statusCode,
  });

  @override
  List<Object?> get props => [
        data,
        statusCode,
      ];
}
