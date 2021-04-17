import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tutorials/widget/get_box_offset.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<double> item = [];
  ScrollController scrollController;
  @override
  void initState() {
    scrollController = ScrollController();

    item = List.generate(10, (index) => index.toDouble());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: scrollController,
              child: Container(
                child: Column(
                  children: List.generate(
                    item.length,
                    (index) => Align(
                      alignment: Alignment.center,
                      child: GetBoxOffse(
                        offset: (offset) {
                          item[index] = offset.dy;
                        },
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          height: 300,
                          width: 600,
                          color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                          child: Center(
                              child: Text("Card Index $index", style: TextStyle(color: Colors.white, fontSize: 18))),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.all(16),
                height: 45,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: List.generate(
                    item.length,
                    (index) => Expanded(
                      child: InkWell(
                        onTap: () {
                          scrollController.animateTo(item[index],
                              duration: Duration(milliseconds: 400), curve: Curves.easeIn);
                        },
                        child: Container(
                          margin: const EdgeInsets.all(4),
                          color: Colors.white,
                          child: Center(child: Text("Tab $index", style: TextStyle(fontSize: 18))),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
