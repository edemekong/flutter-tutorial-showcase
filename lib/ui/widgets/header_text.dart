import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({
    Key key,
    this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Text(
        '$text',
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey[800]),
      ),
    );
  }
}
