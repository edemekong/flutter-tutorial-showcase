import 'package:flutter/material.dart';
import 'package:flutter_tutorials/ui/widgets/text_fields.dart';

class InputView extends StatelessWidget {
  const InputView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 100),
          AppTextField(
            title: 'To:',
          ),
          SizedBox(height: 40),
          AppTextField(
            title: 'Subject',
          ),
          SizedBox(height: 10),
          AppTextField(
            title: 'Message',
            maxLine: 10,
          ),
        ],
      ),
    );
  }
}
