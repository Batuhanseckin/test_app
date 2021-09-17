import 'package:stacked/stacked.dart';
import 'package:test_app/models/base_model.dart';
import 'package:test_app/models/departure_model.dart';
import 'package:test_app/services/concrete/departure_imp.dart';
import 'package:injectable/injectable.dart';

@singleton
class HomeViewModel extends FutureViewModel<List<DepartureModel>> {
  String imageLink =
      "https://images.unsplash.com/photo-1528728329032-2972f65dfb3f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=80";
  String noFountImageLink =
      "https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1";
  bool hasError = false;

  String getDays(List<String> daysOfWeek) {
    String temp = "";
    daysOfWeek.forEach((element) {
      var index = daysOfWeek.indexOf(element);
      temp += element + (index == daysOfWeek.length - 1 ? "" : " - ");
    });
    return temp;
  }

  @override
  Future<List<DepartureModel>> futureToRun() async {
    try {
      var baseModel = await DepartureService.instance.getDepartures();
      if (baseModel is BaseModel && baseModel.success) {
        return (baseModel.data as List)
            .map((e) => DepartureModel.fromJson(e))
            .toList();
      } else {
        hasError = true;
        setBusy(false);
      }
    } catch (e) {
      hasError = true;
      setBusy(false);
    }
    return Future.error("error");
  }
}
