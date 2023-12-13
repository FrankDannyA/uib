import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get getCurrentUser => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String pass,
  }) async {
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: pass,
    );
  }

  Future<void> createWithEmailAndPassword({
    required String email,
    required String pass,
  }) async {
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: pass,
    );
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
