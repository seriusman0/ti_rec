import 'package:flutter/material.dart';

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
      default:
        return MaterialPageRoute(builder: (_) => MainPage());
    }
  }
}
