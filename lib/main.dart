import 'package:flutter/material.dart';
import 'package:flutter_tutorials/ui/views/home_view.dart';
import 'package:flutter_tutorials/view_model/user_model.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserModel(),
      child: MaterialApp(
        home: HomeView(),
      ),
    );
  }
}
