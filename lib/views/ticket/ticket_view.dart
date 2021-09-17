library ticket_view;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';
import 'package:test_app/core/locator.dart';
import 'package:test_app/core/manager/ui_helper.dart';
import 'package:test_app/widgets/error_widgets/something_went_wrog.dart';
import 'ticket_view_model.dart';

part 'ticket_mobile.dart';
part 'ticket_tablet.dart';
part 'ticket_desktop.dart';

class TicketView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TicketViewModel>.reactive(
      viewModelBuilder: () => locator<TicketViewModel>(),
      initialiseSpecialViewModelsOnce: true,
      disposeViewModel: false,
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (BuildContext context, TicketViewModel viewModel, Widget child) {
        return ScreenTypeLayout(
          mobile: _TicketMobile(viewModel),
          desktop: _TicketDesktop(viewModel),
          tablet: _TicketTablet(viewModel),
        );
      },
    );
  }
}
