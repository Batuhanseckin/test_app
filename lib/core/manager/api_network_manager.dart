import 'package:dio/dio.dart';
import 'package:test_app/core/constants/app_constants.dart';

class ApiNetworkManager {
  static ApiNetworkManager _instance;
  Dio dio;

  static ApiNetworkManager get instance {
    if (_instance == null) _instance = ApiNetworkManager._init();
    return _instance;
  }

  ApiNetworkManager._init() {
    final baseOptions = BaseOptions(
      baseUrl: ApiConstants.BASE_URL,
      headers: {
        "Content-Type": "application/json",
      },
    );
    dio = Dio(baseOptions);
  }
}
