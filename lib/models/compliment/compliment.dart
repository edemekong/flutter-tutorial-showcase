class Compliment {
  String id;
  String subject;
  String message;
  Compliment({this.id, this.subject, this.message});

  Map<String, dynamic> toDoc() {
    final data = Map<String, dynamic>();
    data['id'] = id ?? '';
    data['subject'] = subject ?? '';

    data['message'] = message ?? '';

    return data;
  }
}
