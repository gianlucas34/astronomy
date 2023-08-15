import 'package:astronomy/core/interfaces/network_info.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkInfoImpl extends NetworkInfo {
  final internetConnectionChecker = InternetConnectionChecker();

  @override
  Future<bool> get isConnected async =>
      await internetConnectionChecker.hasConnection;
}
