import 'package:app/gen/plants-db-openapi/lib/api.dart' as plants_db;
import 'package:app/gen/user-data-openapi/lib/api.dart' as user_data;

class PlantsDBApi extends plants_db.DefaultApi {
  PlantsDBApi() : super(plants_db.ApiClient());

  PlantsDBApi.withBasePath({required String basePath})
      : super(plants_db.ApiClient(basePath: basePath));
}

class UserDataApi extends user_data.DefaultApi {
  UserDataApi() : super(user_data.ApiClient());
  UserDataApi.withBasePath({required String basePath})
      : super(user_data.ApiClient(basePath: basePath));
}
