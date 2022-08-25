import 'package:apiteste/models/user_model.dart';
import 'package:flutter/material.dart';

import '../pages/user_details_page.dart';
import '../pages/user_page.dart';

class AppRouter {
  static const String user = '/';
  static const String userDetails = '/user_details';

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case user:
        return MaterialPageRoute(builder: (_) => const UserPage());
      case userDetails:
        return MaterialPageRoute(
            builder: (_) => UserDetailsPage(
                  user: settings.arguments as UserModel,
                ));
      default:
        return _erroRoute();
    }
  }

  static Route _erroRoute() {
    return MaterialPageRoute(
        builder: (context) => Scaffold(
              appBar: AppBar(
                title: const Text('Error'),
              ),
              body: const Center(
                child: Text('Something went wrong'),
              ),
            ));
  }
}
