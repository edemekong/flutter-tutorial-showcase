import 'package:flutter/cupertino.dart';
import 'package:flutter_tutorials/models/compliment/compliment.dart';

class ComplimentModel extends ChangeNotifier {
  var toController = TextEditingController();
  var subjectController = TextEditingController();
  var messageController = TextEditingController();

  void setComplimentToField(Compliment compliment) {
    subjectController.text = compliment?.subject;
    messageController.text = compliment?.message;
    notifyListeners();
  }

  List<Compliment> compliments = [
    Compliment(
      subject: 'Merry Christmas, Little One.',
      message:
          'My Christmas wish came true — I get to spend it with you! Here’s to a splendid present and cherished past, Merry Christmas and Happy New Year.',
    ),
    Compliment(
      subject: 'Love you, and Merry Christmas!',
      message:
          'Be sure to count all your blessings this Christmas, as there are more than you think. You’re a blessing to many, and I treasure you very much!',
    ),
    Compliment(
      subject: 'Merry Christmas and God bless you!',
      message:
          'Christmas is surrounded by love, joy and hope. Pass along this message to everyone to spread the light of this wonderful holiday',
    ),
    Compliment(
      subject: 'Enjoy the season!',
      message:
          'May this Christmas bring you many reasons to smile. Share this wonderful time of year with those near and dear to your heart.',
    ),
    Compliment(
      subject: 'Joy of the Season!',
      message:
          'After the tree, ornaments and tinsel, the true meaning of Christmas shows. Gathering with family is incredibly special, Merry Christmas.',
    ),
    Compliment(
      subject: 'Spreading love from here!',
      message:
          'I don’t want much this Christmas, I just want the person reading this to feel loved. Have a wonderful holiday season!',
    ),
  ];
}
