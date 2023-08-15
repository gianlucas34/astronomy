import 'package:astronomy/core/interfaces/failure.dart';

class NoConnectionError extends Failure {
  const NoConnectionError({super.message = "Não há conexão com a internet!"});
}

class DatasourceError extends Failure {
  const DatasourceError({
    super.message = "Algo deu errado! Entre em contato com o suporte.",
  });
}

class InternalError extends Failure {
  const InternalError({
    super.message =
        "O servidor encontrou uma situação com a qual não sabe lidar!",
  });
}
