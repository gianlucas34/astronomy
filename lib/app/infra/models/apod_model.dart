import "package:astronomy/app/domain/entities/apod_entity.dart";

class ApodModel extends ApodEntity {
  const ApodModel({
    required super.title,
    required super.explanation,
    super.thumbnailUrl,
    required super.url,
    required super.hdurl,
    required super.copyright,
    required super.date,
    required super.mediaType,
    required super.serviceVersion,
  });

  factory ApodModel.fromJson(Map<String, dynamic> json) => ApodModel(
        title: json["title"],
        explanation: json["explanation"],
        thumbnailUrl: json["thumbnailUrl"],
        url: json["url"],
        hdurl: json["hdurl"],
        copyright: json["copyright"] ?? "Nasa APOD",
        date: DateTime.parse(json["date"]),
        mediaType: json["mediaType"],
        serviceVersion: json["serviceVersion"],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'explanation': explanation,
        'thumbnail_url': thumbnailUrl,
        'url': url,
        'hdurl': hdurl,
        'copyright': copyright,
        'date': date.toString(),
        'media_type': mediaType,
        'service_version': serviceVersion,
      };
}
