import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:test_app/core/manager/locale_manager.dart';
import 'package:test_app/models/base_model.dart';
import 'package:test_app/models/ticket_model.dart';
import 'package:test_app/services/concrete/user_imp.dart';

@singleton
class TicketViewModel extends FutureViewModel<TicketModel> {
  bool hasError = false;

  @override
  Future<TicketModel> futureToRun() async {
    try {
      var userId =
          LocaleManager.instance.getStringValue(PreferencesKeys.USER_ID);
      var baseModel = await UserService.instance.getMyTicket(userId);
      if (baseModel is BaseModel && baseModel.success) {
        return TicketModel.fromJson(baseModel.data);
      } else {
        hasError = true;
        setBusy(false);
      }
    } catch (e) {
      hasError = true;
      setBusy(false);
      print(e);
    }
    return Future.error("error");
  }
}
