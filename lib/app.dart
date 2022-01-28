import 'package:flutter/material.dart';
import 'package:showcasing_flutter/pages/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Showcasing Flutter',
      home: HomePage(),
    );
  }
}
