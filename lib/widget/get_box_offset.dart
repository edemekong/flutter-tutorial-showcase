import 'package:flutter/material.dart';

class GetBoxOffse extends StatefulWidget {
  final Widget child;
  final Function(Offset offset) offset;

  const GetBoxOffse({Key key, this.child, this.offset}) : super(key: key);

  @override
  _GetBoxOffseState createState() => _GetBoxOffseState();
}

class _GetBoxOffseState extends State<GetBoxOffse> {
  GlobalKey widgetKey = GlobalKey();

  Offset offset = Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final box = widgetKey.currentContext.findRenderObject() as RenderBox;
      offset = box.localToGlobal(Offset.zero);
      widget.offset(offset);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: widgetKey,
      child: widget.child,
    );
  }
}
