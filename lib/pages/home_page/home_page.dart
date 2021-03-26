import 'package:flutter/material.dart';
import '../../ui/theme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.red,
            ).paddingAll(20),
          ),
          Expanded(
            child: Container(
              color: Colors.red,
            ).paddingVertical(20),
          ),
        ],
      ),
    );
  }
}
