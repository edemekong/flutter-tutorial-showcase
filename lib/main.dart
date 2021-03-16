import 'package:flutter/material.dart';
import 'package:flutter_tutorials/ui/pages/home_page.dart';
import 'package:flutter_tutorials/view_models/home_model.dart';
import 'package:provider/provider.dart';
import 'view_models/home_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeModel>(
      create: (context) => HomeModel(),
      child: MaterialApp(
        theme: ThemeData(primaryColor: Colors.red),
        home: HomeView(),
      ),
    );
  }
}
