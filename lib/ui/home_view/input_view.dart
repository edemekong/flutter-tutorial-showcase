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
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: 70),
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: FlatButton.icon(
              label: Text('Send'),
              shape: StadiumBorder(),
              textColor: Colors.white,
              color: Colors.red,
              icon: Icon(Icons.send),
              onPressed: () {
                complimentModel.sendCompliment();
              },
            ),
          )
        ],
      ),
    );
  }
}
