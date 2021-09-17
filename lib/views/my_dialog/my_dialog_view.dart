library my_dialog_view;

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:test_app/core/manager/ui_helper.dart';
import 'package:test_app/widgets/buttons/my_orange_button.dart';
import 'package:test_app/widgets/inputs/email_input.dart';
import 'package:test_app/widgets/inputs/password_input.dart';
import 'my_dialog_view_model.dart';

part 'my_dialog_mobile.dart';
part 'my_dialog_tablet.dart';
part 'my_dialog_desktop.dart';

class MyDialogView extends StatelessWidget {
  final Function(bool) isLogin;

  const MyDialogView({Key key, this.isLogin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyDialogViewModel>.reactive(
      viewModelBuilder: () => MyDialogViewModel(),
      onModelReady: (viewModel) {
        viewModel.setContext(context);
        // Do something once your viewModel is initialized
      },
      builder:
          (BuildContext context, MyDialogViewModel viewModel, Widget child) {
        return ScreenTypeLayout(
          mobile: _MyDialogMobile(viewModel, isLogin),
          desktop: _MyDialogDesktop(viewModel),
          tablet: _MyDialogTablet(viewModel),
        );
      },
    );
  }
}
