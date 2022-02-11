import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ButtonState buttonState = ButtonState.initial;

  set changeButtonState(ButtonState value) {
    setState(() {
      buttonState = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: MyButton(
              title: "Submit",
              onTap: _callApi,
              state: buttonState,
            ),
          ),
        ],
      ),
    );
  }

  _callApi() async {
    changeButtonState = ButtonState.loading;
    await Future.delayed(const Duration(seconds: 3));
    changeButtonState = ButtonState.disabled;
  }
}

enum ButtonState { initial, loading, disabled }

class MyButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  final ButtonState state;

  const MyButton({
    Key? key,
    required this.title,
    required this.onTap,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLoading = state == ButtonState.loading;
    final isDisabled = state == ButtonState.disabled;
    final overallDisabled = [ButtonState.loading, ButtonState.disabled].contains(state);

    return InkWell(
      onTap: overallDisabled || isDisabled ? null : onTap,
      child: Container(
        width: 100,
        decoration:
            BoxDecoration(color: isDisabled ? Colors.grey : Colors.blue, borderRadius: BorderRadius.circular(16)),
        height: 64,
        child: Center(child: Builder(
          builder: (context) {
            if (isLoading) {
              return Transform.scale(
                scale: 0.6,
                child: const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              );
            }
            return Text(
              title,
              style: const TextStyle(color: Colors.white),
            );
          },
        )),
      ),
    );
  }
}
