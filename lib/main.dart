import 'package:flutter/material.dart';
import 'package:flutter_tutorials/ui/home_view/home_view.dart';
import 'package:flutter_tutorials/view_models/complement_model/compliment_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ComplimentModel(),
        ),
      ],
      child: MaterialApp(
        home: HomeView(),
      ),
    );
  }
}
