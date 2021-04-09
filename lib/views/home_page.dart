import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: HyperLinks('Hello https://facebook.com #Paul Join me on instagram @john')),
    );
  }
}

class HyperLinks extends StatelessWidget {
  final String text;
  const HyperLinks(this.text, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<TextSpan> hyperLinks = [];
    List<String> highlightedWords = text.split(' ');
    List<String> wordToHighLight = [];
    highlightedWords.forEach((element) {
      if (element.startsWith('https://')) {
        print(element);
        hyperLinks.add(TextSpan(text: element, style: TextStyle(color: Colors.blue)));
        wordToHighLight.add(element);
      }
    });

    return RichText(
      text: TextSpan(children: hyperLinks),
    );
  }
}
