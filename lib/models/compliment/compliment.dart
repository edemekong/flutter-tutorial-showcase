class Compliment {
  String id;
  String subject;
  String to;

  String message;
  Compliment({this.id, this.to, this.subject, this.message});

  Map<String, dynamic> toDoc() {
    final data = Map<String, dynamic>();
    data['id'] = id ?? '';
    data['to'] = to ?? '';

    data['subject'] = subject ?? '';

    data['message'] = message ?? '';

    return data;
  }
}
