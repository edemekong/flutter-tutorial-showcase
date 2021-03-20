import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sticky_web_scroll/sticky_web_scroll.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  final scrollController = ScrollController();
  @override
  void initState() {
    scrollController.addListener(() {
      print('Listening');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StickyWebScroll(
        landingHeight: 200,
        controller: scrollController,
        stickyHeight: 50,
        landing: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1489843704329-b420d20a0b43?ixid=MXwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXwyMzA0MDE1fHxlbnwwfHx8&ixlib=rb-1.2.1&w=1000&q=80'),
                fit: BoxFit.cover),
          ),
        ),
        stickyAppBar: Container(
          color: Colors.blue,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Text('Stick Web Scroll - by Flutter Fairy',
                style: Theme.of(context).textTheme.headline4),
          ),
        ),
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: List.generate(
                100,
                (index) => Container(
                  height: 500,
                  width: 500,
                  color: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
