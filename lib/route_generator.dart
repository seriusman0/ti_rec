import 'package:flutter/material.dart';
import 'package:ti_rec/update_item.dart';

import 'add_item.dart';
import 'main_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MainPage());
      case '/add':
        return MaterialPageRoute(builder: (_) => AddItem());
      case '/update':
        return MaterialPageRoute(builder: (_) => UpdateItem());
      default:
        return MaterialPageRoute(builder: (_) => MainPage());
    }
  }
}
