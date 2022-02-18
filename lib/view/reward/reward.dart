import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:showcasing_flutter/models/user.dart';
import 'package:showcasing_flutter/repositories/user_repository.dart';
import 'package:showcasing_flutter/view/auth/auth.dart';
import 'package:showcasing_flutter/view/reward/reward_state.dart';

class RewardView extends StatelessWidget {
  const RewardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<RewardState>(context);

    return SafeArea(
      child: Scaffold(
        body: ValueListenableBuilder<User>(
          valueListenable: UserRepository.instance.currentUserNotifier,
          builder: (context, value, widget) {
            if (value != User.empty()) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('\$${value.reward}',
                        style: Theme.of(context).textTheme.headline2?.copyWith(color: Colors.green)),
                    const SizedBox(height: 10),
                    Text('MY REWARD', style: Theme.of(context).textTheme.headline6),
                    const SizedBox(height: 20),
                    const Divider(),
                    const SizedBox(height: 40),
                    Text('Name: ${value.name}', style: Theme.of(context).textTheme.headline6),
                    Text('Email: ${value.email}', style: Theme.of(context).textTheme.headline6),
                    const SizedBox(height: 30),
                    SelectableText('Refer Link: ${value.referLink}',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.blue)),
                    const SizedBox(height: 30),
                    TextButton(
                      onPressed: () {
                        state.userRepo.logOutUser();
                      },
                      child: Text('Log out', style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.red)),
                    )
                  ],
                ),
              );
            } else {
              return const AuthWidget();
            }
          },
        ),
      ),
    );
  }
}

class RewardWidget extends StatelessWidget {
  const RewardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = RewardState();
    return ChangeNotifierProvider(
      create: (_) => state,
      child: ChangeNotifierProvider.value(
        value: state,
        child: const RewardView(),
      ),
    );
  }
}
