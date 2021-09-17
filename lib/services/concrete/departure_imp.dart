import 'package:test_app/core/constants/app_constants.dart';
import 'package:test_app/core/manager/api_network_manager.dart';
import 'package:test_app/models/base_model.dart';
import 'package:test_app/services/abstract/departure_service.dart';

class DepartureService extends IDepartureService {
  static DepartureService _instance = DepartureService._init();

  static DepartureService get instance => _instance;

  DepartureService._init();

  var _apiNetwork = ApiNetworkManager.instance.dio;
  @override
  Future<BaseModel> getDepartures() async {
    var response = await _apiNetwork.get(
      ApiConstants.DEPARTURE_TIMES,
    );

    if (response.data != null && response.statusCode == 200) {
      return BaseModel.fromJson(response.data);
    } else {
      return null;
    }
  }
}
