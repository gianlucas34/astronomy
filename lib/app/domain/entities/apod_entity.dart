import 'package:equatable/equatable.dart';

class ApodEntity extends Equatable {
  final String? title;
  final String? explanation;
  final String? thumbnailUrl;
  final String? url;
  final String? hdurl;
  final String? copyright;
  final DateTime? date;
  final String? mediaType;
  final String? serviceVersion;

  const ApodEntity({
    this.title,
    this.explanation,
    this.thumbnailUrl,
    this.url,
    this.hdurl,
    this.copyright,
    this.date,
    this.mediaType,
    this.serviceVersion,
  });

  @override
  List<Object?> get props => [
        title,
        explanation,
        thumbnailUrl,
        url,
        hdurl,
        copyright,
        date,
        mediaType,
        serviceVersion
      ];
}
