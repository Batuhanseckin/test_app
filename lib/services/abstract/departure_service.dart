import 'package:test_app/models/base_model.dart';

abstract class IDepartureService {
  Future<BaseModel> getDepartures();
}
