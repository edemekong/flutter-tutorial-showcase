import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:showcasing_flutter/repositories/user_repository.dart';
import 'package:showcasing_flutter/services/deep_link_service.dart';
import 'package:showcasing_flutter/view/reward/reward.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  DeepLinkService.instance?.handleDynamicLinks();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    UserRepository.instance?.listenToCurrentAuth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reward App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RewardWidget(),
    );
  }
}
