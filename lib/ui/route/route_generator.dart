import 'package:flutter/material.dart';
import '/ui/views/auth_view/sign_up.dart';
import '/ui/views/auth_view/start_view.dart';
import '/ui/views/home_view/home_view.dart';

class GeneratedRoute {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Future<dynamic> navigateTo(String routeName, {Object? args}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: args);
  }

  static goBack() {
    return navigatorKey.currentState?.pop();
  }

  static Route<dynamic> onGenerate(RouteSettings settings) {
    final arg = settings.arguments;
    switch (settings.name) {
      case StartView.routeName:
        return MaterialPageRoute(builder: (_) => StartView());
      case SignUpView.routeName:
        if (arg is String) {
          return MaterialPageRoute(builder: (_) => SignUpView(referrarCode: arg));
        }
        return MaterialPageRoute(
            builder: (_) => SignUpView(
                  referrarCode: '',
                ));

      case HomeView.routeName:
        return MaterialPageRoute(builder: (_) => HomeView());
      default:
        return _onPageNotFound();
    }
  }

  static Route<dynamic> _onPageNotFound() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text('Page Not Found'),
        ),
      ),
    );
  }
}
