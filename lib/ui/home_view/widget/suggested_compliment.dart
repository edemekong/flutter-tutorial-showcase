import 'package:flutter/material.dart';
import 'package:flutter_tutorials/ui/widgets/expanded_text.dart';

class SuggestedCompliment extends StatelessWidget {
  const SuggestedCompliment({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: List.generate(
        5,
        (index) => Container(
          height: 100,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: const EdgeInsets.all(8),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.8),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Compliment Title',
                style: TextStyle(fontSize: 16),
              ),
              ExpandableText('Hello', textColor: Colors.black),
            ],
          ),
        ),
      ),
    ));
  }
}
