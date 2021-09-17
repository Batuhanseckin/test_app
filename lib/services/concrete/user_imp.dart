import 'package:test_app/core/constants/app_constants.dart';
import 'package:test_app/core/manager/api_network_manager.dart';
import 'package:test_app/models/base_model.dart';
import 'package:test_app/services/abstract/user_service.dart';

class UserService extends IUserService {
  static UserService _instance = UserService._init();

  static UserService get instance => _instance;

  UserService._init();

  var _apiNetwork = ApiNetworkManager.instance.dio;

  @override
  Future<BaseModel> getMyTicket(String userId) async {
    var response = await _apiNetwork.get(
      userId + "/" + ApiConstants.TICKET,
    );
    if (response.data != null && response.statusCode == 200) {
      return BaseModel.fromJson(response.data);
    } else {
      return null;
    }
  }
}
