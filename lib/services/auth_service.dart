import 'package:firebase_auth/firebase_auth.dart' as auth;

class AuthService {
  AuthService._();
  static AuthService? _instance;

  static AuthService? get instance {
    _instance ??= AuthService._();
    return _instance;
  }

  final _auth = auth.FirebaseAuth.instance;

  Future<String?> signUp(String email, String password) async {
    final currentUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    final uid = currentUser.user?.uid;
    return uid;
  }

  Future<auth.User?> logIn(String email, String password) async {
    try {
      auth.UserCredential authResult = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return authResult.user;
    } catch (_) {
      return null;
    }
  }

  Future<void> logOut() async {
    await _auth.signOut();
  }
}
