// [ This is an auto generated file ]

import 'package:flutter/material.dart';
import 'package:test_app/core/router_constants.dart';

import 'package:test_app/views/main/main_view.dart' as view0;
import 'package:test_app/views/home/home_view.dart' as view1;
import 'package:test_app/views/ticket/ticket_view.dart' as view2;
import 'package:test_app/views/my_dialog/my_dialog_view.dart' as view3;

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainViewRoute:
        return MaterialPageRoute(builder: (_) => view0.MainView());
      case homeViewRoute:
        return MaterialPageRoute(builder: (_) => view1.HomeView());
      case ticketViewRoute:
        return MaterialPageRoute(builder: (_) => view2.TicketView());
      case myDialogViewRoute:
        return MaterialPageRoute(builder: (_) => view3.MyDialogView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}