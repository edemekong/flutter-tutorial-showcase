import 'package:flutter/material.dart';
import 'package:showcasing_flutter/components/show_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message, style: const TextStyle(color: Colors.black, fontSize: 30)),
            const SizedBox(height: 18),
            TextButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
              onPressed: onTapShowDialog,
              child: const Text(
                'Show Dialog',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onTapShowDialog() {
    showAlertDialogs(
      context,
      title: 'Showcasing Flutter',
      content: 'Purely for learning & teaching...',
    ).then((value) {
      setState(() {
        if (value == true) {
          message = '[Yes] was tapped!!!';
        } else if (value == false) {
          message = '[NO] was tapped!!!';
        } else {
          message = '[Nothing] was Tapped!!!';
        }
      });
      debugPrint(value.toString());
    });
  }
}
