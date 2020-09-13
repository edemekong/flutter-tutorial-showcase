import 'package:flutter/material.dart';
import 'package:flutter_tutorials/view_models/home_view_models.dart';
import 'package:flutter_tutorials/views/home_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: HomeViewModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Tutorial',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeViews(),
      ),
    );
  }
}
