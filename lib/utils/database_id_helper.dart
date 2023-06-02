import 'package:codeswipe/configurations/configurations.dart';
import 'package:djangoflow_app/djangoflow_app.dart';

class DataBaseIdHelper {
  String getId() =>
      AppCubit.instance.state.environment == AppEnvironment.sandbox
          ? databaseIdDev
          : databaseIdProd;
}
