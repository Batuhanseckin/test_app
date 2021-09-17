library main_view;

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:test_app/core/manager/locale_manager.dart';
import 'package:test_app/core/manager/ui_helper.dart';
import 'package:test_app/views/home/home_view.dart';
import 'package:test_app/views/my_dialog/my_dialog_view.dart';
import 'package:test_app/views/ticket/ticket_view.dart';
import 'package:test_app/widgets/bottom_nav_bar/custom_bottom_navbar.dart';
import 'main_view_model.dart';

part 'main_mobile.dart';
part 'main_tablet.dart';
part 'main_desktop.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
        viewModelBuilder: () => MainViewModel(),
        onModelReady: (viewModel) {
          // Do something once your viewModel is initialized
        },
        builder: (BuildContext context, MainViewModel viewModel, Widget child) {
          return ScreenTypeLayout(
            mobile: _MainMobile(viewModel),
            desktop: _MainDesktop(viewModel),
            tablet: _MainTablet(viewModel),
          );
        });
  }
}
