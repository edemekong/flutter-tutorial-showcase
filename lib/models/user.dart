class User {
  String uid;
  String email;
  String name;
  String referCode;
  String referLink;
  int reward;

  User({
    required this.uid,
    required this.email,
    required this.name,
    required this.referCode,
    required this.referLink,
    required this.reward,
  });

  factory User.fromJson(String docId, Map<String, dynamic> data) {
    return User(
      uid: docId,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      referCode: data['refer_code'] ?? '',
      referLink: data['refer_link'] ?? '',
      reward: data['reward'] ?? 0,
    );
  }

  factory User.empty() {
    return User(
      uid: '',
      name: '',
      email: '',
      referCode: '',
      referLink: '',
      reward: 100,
    );
  }
}
