import 'package:flutter/material.dart';
import 'package:flutter_tutorials/services/compliment_api/compliment_api.dart';
import 'package:flutter_tutorials/ui/home_view/home_view.dart';
import 'package:flutter_tutorials/view_models/complement_model/compliment_model.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  setUpGetId();
}

void setUpGetId() {
  GetIt.I.registerSingleton<ComplimentApi>(ComplimentApi());
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
