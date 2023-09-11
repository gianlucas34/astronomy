import 'package:astronomy/core/returns/http_result.dart';

abstract class Http {
  Future<HttpResult> get(String url, [Map params = const {}]);
}
