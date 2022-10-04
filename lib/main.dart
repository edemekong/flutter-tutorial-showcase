import 'package:flutter/material.dart';
import 'package:showcasing_flutter/ui/search_view.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SearchView(),
    );
  }
}
