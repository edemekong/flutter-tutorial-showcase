import 'package:flutter/material.dart';

class MyAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final String buttonText1;
  final String? buttonText2;
  final void Function(bool v) callback;

  const MyAlertDialog(
      {Key? key,
      required this.title,
      required this.content,
      required this.buttonText1,
      this.buttonText2,
      required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
          child: Text(buttonText1, style: const TextStyle(color: Colors.white)),
          onPressed: () {
            ///When a user taps on [YES]
            callback(true);
            Navigator.pop(context);
          },
        ),
        if (buttonText2 != null)
          TextButton(
            child: Text("$buttonText2", style: const TextStyle(color: Colors.black)),
            onPressed: () {
              ///When a user taps on [NO]
              callback(false);
              Navigator.pop(context);
            },
          ),
      ],
    );
  }
}
