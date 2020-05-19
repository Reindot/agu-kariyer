import 'package:agucareer/models/user_model.dart';
import 'package:agucareer/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirebaseAuthService implements AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<User> currentUser() async {
      FirebaseUser user = await _auth.currentUser();
      return _userFromFirebase(user);
  }

  User _userFromFirebase(FirebaseUser fUser) {
    if (fUser == null) return null;
    debugPrint("LoginInfo: ${fUser.email}");
    return User(userID: fUser.uid, email: fUser.email);
  }

  @override
  Future<User> signIn(String email, String password) async {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return currentUser();
  }

  @override
  Future<bool> signOut() async {
      await _auth.signOut();
      return true;
  }

  @override
  Future<bool> resetPassword(String email) async {
      await _auth.sendPasswordResetEmail(email: email);
      return true;
  }

  @override
  Future<User> createUser(String email, String password) async {
      AuthResult authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return _userFromFirebase(authResult.user);
  }

}
