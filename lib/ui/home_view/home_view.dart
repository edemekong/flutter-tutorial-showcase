import 'package:flutter/material.dart';
import 'package:flutter_tutorials/image_asset/image_assets.dart';
import 'package:flutter_tutorials/ui/home_view/widget/suggested_compliment.dart';
import 'package:flutter_tutorials/ui/widgets/painter.dart';

import 'home.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
                color: Colors.transparent,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.2,
                child: CustomPaint(
                  painter: NicelyPaintedAppber(),
                )),
            Container(
              child: Image.asset(ImageAssets.christmas),
            ),
            SafeArea(
              child: SingleChildScrollView(
                  child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputView(),
                    HeaderText(text: 'Suggested Compliments'),
                    SuggestedCompliment(),
                  ],
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}

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
