import 'package:flutter/material.dart';

import 'customtooltip.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.lightBlue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: CustomTooltip(
                message: 'Hello Tap Me!!',
                child: InkWell(
                  onTap: () {},
                  child: Text('Tap Left'),
                ),
              )),
          Align(
              alignment: Alignment.topRight,
              child: CustomTooltip(
                message: 'am Here',
                child: ElevatedButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  child: Text('Tap Right'),
                ),
              )),
          Align(
              alignment: Alignment.center,
              child: CustomTooltip(
                message: 'Hello Click Me!!',
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  child: Text('Tap Me Center'),
                ),
              )),
        ],
      ),
    );
  }
}

