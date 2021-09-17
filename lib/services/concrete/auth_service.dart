import 'package:test_app/core/constants/app_constants.dart';
import 'package:test_app/core/manager/api_network_manager.dart';
import 'package:test_app/models/base_model.dart';
import 'package:test_app/services/abstract/auth_service.dart';

class AuthService extends IAuthService {
  static AuthService _instance = AuthService._init();

  static AuthService get instance => _instance;

  AuthService._init();

  var _apiNetwork = ApiNetworkManager.instance.dio;
  @override
  Future<BaseModel> submitLogin(String email, String password) async {
    var data = {"email": email, "password": password};
    var response = await _apiNetwork.post(
      ApiConstants.LOGIN,
      data: data,
    );
    if (response.data != null && response.statusCode == 200) {
      return BaseModel.fromJson(response.data);
    } else {
      return null;
    }
  }
}
