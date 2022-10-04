import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:showcasing_flutter/ui/route/route_generator.dart';
import '../ui/get_it/get_it_setup.dart';
import '/ui/views/auth_view/start_view.dart';
import '/view_models/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:showcasing_flutter/ui/get_it/get_it_setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setUpGetIt();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: HomeViewModel(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: GeneratedRoute.navigatorKey,
        initialRoute: StartView.routeName,
        onGenerateRoute: GeneratedRoute.onGenerate,
      ),
    );
  }
}
