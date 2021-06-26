import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:git_profile/screens/home_screen.dart';
import 'package:git_profile/screens/user_details_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String userDetails = "/user-details";

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return _buildRoute(HomeScreen(), settings);
      case userDetails:
        return _buildRoute(UserDetails(), settings);

      default:
        return _buildRoute(Scaffold(), settings);
    }
  }


  static _buildRoute(Widget widget, RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => widget, settings: settings);
  }
}
