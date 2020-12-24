import 'package:cloud_firestore/cloud_firestore.dart';

class ComplimentApi {
  var complimentsRef = FirebaseFirestore.instance.collection('compliments');

  Future<void> sendCompliments(
      String complimentsId, Map<String, dynamic> doc) async {
    await complimentsRef.doc(complimentsId).set(doc);
  }
}
