import 'package:flutter/material.dart';
import 'package:flutter_tutorials/services/user_api.dart';
import 'package:flutter_tutorials/ui/views/home_view.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeView(),
    );
  }
}
