import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:showcasing_flutter/components/text_field.dart';

import 'auth_state.dart';

class AuthView extends StatelessWidget {
  const AuthView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AuthState>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 30),
            if (state.signInState == SignInState.signup) Text('Register', style: Theme.of(context).textTheme.headline3),
            if (state.signInState == SignInState.login) Text('Login', style: Theme.of(context).textTheme.headline3),
            const SizedBox(height: 60),
            if (state.signInState == SignInState.signup)
              CustomTextField(
                label: 'Name',
                controller: state.nameController,
              ),
            const SizedBox(height: 16),
            CustomTextField(
              label: 'Email',
              controller: state.emailController,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: 'Password',
              controller: state.passwordController,
            ),
            const SizedBox(height: 16 * 2),
            state.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : TextButton(
                    onPressed: () async {
                      state.signUpLogin();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        state.signInState == SignInState.signup ? 'Create Account' : 'Login',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                  ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    if (state.signInState == SignInState.login) {
                      state.changeState = SignInState.signup;
                    } else {
                      state.changeState = SignInState.login;
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      state.signInState != SignInState.signup ? 'Register' : 'Login',
                      style: const TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AuthWidget extends StatelessWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = AuthState();
    return ChangeNotifierProvider.value(
      value: state,
      child: const AuthView(),
    );
  }
}
