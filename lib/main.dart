import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_tutorials/ui/get_it/get_it_setup.dart';
import 'package:flutter_tutorials/ui/views/home_view/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setUpGetIt();
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
