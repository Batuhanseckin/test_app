import 'package:test_app/models/base_model.dart';

abstract class IUserService {
  Future<BaseModel> getMyTicket(String userId);
}
