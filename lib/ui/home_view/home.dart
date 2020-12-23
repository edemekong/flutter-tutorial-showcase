import 'package:flutter/material.dart';
import 'package:flutter_tutorials/ui/widgets/text_fields.dart';
import 'package:flutter_tutorials/view_models/complement_model/compliment_model.dart';
import 'package:provider/provider.dart';

class InputView extends StatelessWidget {
  const InputView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final complimentModel =
        Provider.of<ComplimentModel>(context, listen: false);
    return Container(
      child: Column(
        children: [
          SizedBox(height: 100),
          AppTextField(
            title: 'To:',
            controller: complimentModel.toController,
          ),
          SizedBox(height: 10),
          AppTextField(
            title: 'Subject',
            controller: complimentModel.subjectController,
          ),
          SizedBox(height: 10),
          AppTextField(
            title: 'Message',
            maxLine: 10,
            controller: complimentModel.messageController,
          ),
        ],
      ),
    );
  }
}
