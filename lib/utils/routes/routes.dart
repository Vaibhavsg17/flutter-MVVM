import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myapp/home_screen.dart';
import 'package:myapp/login_screen.dart';
import 'package:myapp/utils/routes/routes_name.dart';

class Routes {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
