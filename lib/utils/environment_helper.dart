import 'package:codeswipe/configurations/configurations.dart';
import 'package:djangoflow_app/djangoflow_app.dart';

class EnvironmentHelper {
  String getDatabaseId() => getEnvId();

  String getStorageBucketId() => getEnvId();

  String getEnvId() =>
      AppCubit.instance.state.environment == AppEnvironment.sandbox
          ? envIdDev
          : envIdProd;
}
