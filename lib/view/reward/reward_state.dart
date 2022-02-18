import 'package:flutter/material.dart';
import 'package:showcasing_flutter/repositories/user_repository.dart';

class RewardState extends ChangeNotifier {
  final userRepo = UserRepository.instance;
}
