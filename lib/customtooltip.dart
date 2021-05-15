import 'package:flutter/material.dart';

class CustomTooltip extends StatefulWidget {
  final String message;
  final Widget child;

  const CustomTooltip({Key key, this.child, @required this.message})
      : super(key: key);

  @override
  _CustomTooltipState createState() => _CustomTooltipState();
}

class _CustomTooltipState extends State<CustomTooltip>
    with TickerProviderStateMixin {
  final color = Colors.black.withAlpha(120);
  GlobalKey key;
  Offset _offset;
  Size _size;
  OverlayEntry overlayEntry;

  AnimationController _controller;

  @override
  void initState() {
    key = LabeledGlobalKey(widget.message);
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    super.initState();
  }

  void getWidgetDetails() {
    final renderBox = key.currentContext.findRenderObject() as RenderBox;
    _size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);
    _offset = offset;
    print(_offset.dx);
  }

  OverlayEntry _makeOverlay() {
    return OverlayEntry(
      builder: (context) => Positioned(
        top: _offset.dy + 40,
        left: _offset.dx - 25,
        width: _size.width + 50,
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.5, end: 0.9).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceOut)),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: ClipPath(
                  clipper: ArrowClip(),
                  child: Container(
                    height: 10,
                    width: 15,
                    decoration: BoxDecoration(
                      color: color,
                    ),
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    widget.message,
                    style: TextStyle(color: Colors.white),
                  ),
                  padding: const EdgeInsets.all(4),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: key,
      child: widget.child,
      onTap: () {},
      onHover: (v) {
        if (v) {
          getWidgetDetails();
          overlayEntry = _makeOverlay();
          Overlay.of(context).insert(overlayEntry);
          _controller.forward();
        } else {
          _controller.reverse();
          overlayEntry.remove();
        }
      },
    );
  }
}

class ArrowClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, size.height);
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
