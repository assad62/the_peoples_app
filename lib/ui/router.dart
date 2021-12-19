import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_app/ui/views/persons_map_view/persons_map_view.dart';
import 'views/home_view.dart';

class AppRoutes{
  static const String homeRoute ="home";
  static const String singlePersonMap = "singlePersonMap";

}


class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeRoute:
        return MaterialPageRoute(builder: (_) => HomeView());
      case AppRoutes.singlePersonMap:
        var singlePerson = settings.arguments as SelectedPerson;
        return MaterialPageRoute(builder: (_) => PersonsMapsView(id:singlePerson.id));

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    }
  }
}