import 'package:flutter/material.dart';
import 'package:showcasing_flutter/repositories/user_repository.dart';
import 'package:showcasing_flutter/services/deep_link_service.dart';

enum SignInState { login, signup }

class AuthState extends ChangeNotifier {
  final userRepo = UserRepository.instance;
  final deepLinkRepo = DeepLinkService.instance;

  SignInState _signInState = SignInState.login;
  bool isLoading = false;

  SignInState get signInState => _signInState;

  set changeState(SignInState v) {
    _signInState = v;
    notifyListeners();
  }

  set changeIsLoading(bool v) {
    isLoading = v;
    notifyListeners();
  }

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> signUpLogin() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      changeIsLoading = true;
      if (_signInState == SignInState.login) {
        await userRepo?.logIn(emailController.text, passwordController.text);
      } else if (_signInState == SignInState.signup) {
        await userRepo?.registerUser(nameController.text, emailController.text, passwordController.text,
            referrerCode: deepLinkRepo?.referrerCode.value ?? '');
      }
      changeIsLoading = false;
    }
  }
}
