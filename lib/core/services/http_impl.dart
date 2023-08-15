import 'dart:convert';
import 'package:astronomy/core/interfaces/http.dart';
import 'package:astronomy/core/returns/http_result.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class HttpImpl implements Http {
  final service = http.Client();

  @override
  Future<HttpResult> get(String url) async {
    final baseUrl = dotenv.get("BASE_URL");
    final apiKey = dotenv.get("API_KEY");
    final result = await service.get(
      Uri.parse("$baseUrl$url?api_key=$apiKey&thumbs=true"),
    );

    return HttpResult(
      data: jsonDecode(result.body),
      statusCode: result.statusCode,
    );
  }
}
