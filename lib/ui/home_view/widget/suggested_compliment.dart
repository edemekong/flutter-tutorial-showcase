import 'package:flutter/material.dart';
import 'package:flutter_tutorials/models/compliment/compliment.dart';
import 'package:flutter_tutorials/ui/widgets/expanded_text.dart';
import 'package:flutter_tutorials/view_models/complement_model/compliment_model.dart';
import 'package:provider/provider.dart';

class SuggestedCompliment extends StatelessWidget {
  const SuggestedCompliment({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final complimentModel =
        Provider.of<ComplimentModel>(context, listen: false);
    return Container(
        child: Column(
      children: List.generate(
        complimentModel.compliments.length,
        (index) =>
            ComplimentCard(compliment: complimentModel.compliments[index]),
      ),
    ));
  }
}

class ComplimentCard extends StatelessWidget {
  const ComplimentCard({
    Key key,
    this.compliment,
  }) : super(key: key);
  final Compliment compliment;

  @override
  Widget build(BuildContext context) {
    return Consumer<ComplimentModel>(
      builder: (_, complimentModel, child) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: () {
            complimentModel.setComplimentToField(compliment);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${compliment.subject}',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.green[900]),
              ),
              SizedBox(height: 10),
              ExpandableText('${compliment.message}',
                  textColor: Colors.red[800], trimLines: 2),
            ],
          ),
        ),
      ),
    );
  }
}
