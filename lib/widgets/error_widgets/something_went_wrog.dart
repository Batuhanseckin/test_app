import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:test_app/core/manager/asset_manager.dart';
import 'package:test_app/core/manager/locale_manager.dart';
import 'package:test_app/core/manager/ui_helper.dart';
import 'package:test_app/core/router_constants.dart';

class SomeThingWentWrong extends StatelessWidget {
  const SomeThingWentWrong({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(
            AssetManager.instance.assetImagePath("something_went_wrong.png"),
            fit: BoxFit.cover,
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: UIHelper.dynamicWidth(30)),
            child: Text(
              "Sorry, something went wrong there. You may not have logged into the app for a long time.",
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: UIHelper.dynamicHeight(20)),
          ElevatedButton(
            onPressed: () {
              LocaleManager.instance.sharedClear();
              NavigationService().pushNamedAndRemoveUntil(mainViewRoute);
            },
            child: Text("Back to home page"),
          ),
        ],
      ),
    );
  }
}
