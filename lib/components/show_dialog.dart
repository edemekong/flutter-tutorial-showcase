import 'package:flutter/material.dart';
import 'alert_dialog.dart';

Future<bool?> showAlertDialogs(BuildContext context, {required String title, required String content}) async {
  bool? response;
  await showDialog(
    context: context,
    builder: (context) => MyAlertDialog(
      title: title,
      content: content,
      buttonText1: 'Yes',
      buttonText2: 'No',
      callback: (bool v) {
        response = v;
      },
    ),
  );
  return response;
}
