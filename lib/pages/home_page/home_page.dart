import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Align(
              alignment: Alignment.topCenter,
              child: ExpandableWidget(
                child: Column(
                  children: List.generate(
                      5,
                      (index) => ListTile(
                            title: Text('I\'m Index $index'),
                          )),
                ),
              ),
            ),
            SizedBox(height: 40),
            Align(
              alignment: Alignment.topCenter,
              child: ExpandableWidget(
                child: Column(
                  children: List.generate(
                      5,
                      (index) => ListTile(
                            title: Text('I\'m Index $index'),
                          )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpandableWidget extends StatefulWidget {
  final Widget child;

  const ExpandableWidget({Key key, @required this.child}) : super(key: key);

  @override
  _ExpandableWidgetState createState() => _ExpandableWidgetState();
}

class _ExpandableWidgetState extends State<ExpandableWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            spreadRadius: 5,
            blurRadius: 10,
            color: Colors.grey.shade700.withOpacity(.3),
          ),
        ],
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() => _isExpanded = !_isExpanded);
            },
            child: Container(
              padding: EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width * 0.85,
              height: 45,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Expandable Widget'),
                  Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
                ],
              ),
            ),
          ),
          Divider(height: 0),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 400),
            transitionBuilder: (child, animation) => SizeTransition(
              sizeFactor: animation,
              child: child,
            ),
            child: Container(
              key: ValueKey(_isExpanded),
              height: _isExpanded ? null : 0,
              alignment: Alignment.topCenter,
              child: Wrap(
                clipBehavior: Clip.hardEdge,
                children: [
                  Container(
                      child: Builder(
                    builder: (context) => widget.child,
                  ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
