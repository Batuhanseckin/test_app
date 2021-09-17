import 'package:test_app/models/base_model.dart';

abstract class IAuthService {
  Future<BaseModel> submitLogin(String email, String password);
}
