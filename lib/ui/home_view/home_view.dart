import 'package:flutter/material.dart';
import 'package:flutter_tutorials/image_asset/image_assets.dart';
import 'package:flutter_tutorials/ui/home_view/widget/suggested_compliment.dart';
import 'package:flutter_tutorials/ui/widgets/header_text.dart';
import 'package:flutter_tutorials/ui/widgets/painter.dart';
import 'package:flutter_tutorials/view_models/complement_model/compliment_model.dart';
import 'package:provider/provider.dart';

import 'input_view.dart';

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
            Positioned(
              top: -20,
              right: 15,
              left: 15,
              child: Container(
                height: 150,
                child: Image.asset(ImageAssets.christmas),
              ),
            ),
            Consumer<ComplimentModel>(
              builder: (_, complimentModel, child) => SafeArea(
                child: SingleChildScrollView(
                    controller: complimentModel.scrollController,
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
            ),
          ],
        ),
      ),
    );
  }
}
