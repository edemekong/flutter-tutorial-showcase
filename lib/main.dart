import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: PersitentAppbar(
                appbarHeight: 200,
              ),
              floating: true,
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((_, index) => Item()),
            ),
          ],
        ),
      ),
    );
  }
}

class ListItems extends StatelessWidget {
  final ScrollController controller;

  const ListItems({Key key, this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      itemCount: 9999,
      itemBuilder: (_, i) {
        return Item();
      },
    );
  }
}

class Item extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: 100,
      width: width - 48,
      child: RandomColorBox(),
    ).addPadding();
  }
}

// you are allowed to break up this widget into smaller individual ones;
class ExtendedItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 8,
          ),
          Container(
              height: 50,
              width: width - 48,
              padding: const EdgeInsets.only(bottom: 8),
              child: RandomColorBox()),
        ],
      ),
    );
  }
}

class TitleTextSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 8),
          height: 50,
          width: 50,
          child: RandomColorBox(),
        ),
        Text(
          'Title Text',
        ).addPadding(),
      ],
    );
  }
}

class RandomColorBox extends StatelessWidget {
  final Color color;

  RandomColorBox()
      : color = Colors.primaries[Random().nextInt(Colors.primaries.length)];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}

class ShrunkItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Padding(
            padding: const EdgeInsets.only(left: 8), child: TitleTextSection()),
        const SizedBox(height: 4),
      ],
    );
  }
}

extension _padding on Widget {
  Widget addPadding() => Padding(
        padding: EdgeInsets.all(8),
        child: this,
      );
}

class PersitentAppbar extends SliverPersistentHeaderDelegate {
  final double appbarHeight;
  final double offset;
  final FloatingHeaderSnapConfiguration snap;
  final tabber;
  PersitentAppbar({
    @required this.appbarHeight,
    this.offset,
    this.snap,
    this.tabber,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final firstBarOffset = (-shrinkOffset * 0.01) - shrinkOffset;
    final secondBarOffset = (-shrinkOffset * 0.01) - shrinkOffset + 60;
    return Container(
      color: Colors.white,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: secondBarOffset < -1.00 ? -1 : secondBarOffset,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Wrap(
                children: [
                  ShrunkItem(),
                  ExtendedItem(),
                ],
              ),
            ),
          ),
          Positioned(
            top: firstBarOffset,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Wrap(
                children: [
                  ExtendedItem(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => appbarHeight;

  @override
  double get minExtent => 60;

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => snap;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
