import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';


abstract class BaseAuth {
  Future<String> signInWithEmailAndPassword(String email, String password);
  Future<String> createUserWithEmailAndPassword(String email, String password);
  Future<String> currentUser();
  Future<void> signOut();
  Future<void> resetPassword(String email);
}

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<String> signInWithEmailAndPassword(String email, String password) async {

    final AuthResult userq = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    final FirebaseUser user = await _firebaseAuth.currentUser();
    return user?.uid;
  }

  @override
  Future<String> createUserWithEmailAndPassword(String email, String password) async {
    try{
      final AuthResult users = (await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ));}
    catch(error){

      if(error.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
        return null;
      }
    }
    final FirebaseUser user = await _firebaseAuth.currentUser();
    return user?.uid;
  }

  @override
  Future<String> currentUser() async {
    final FirebaseUser user = await _firebaseAuth.currentUser();
    return user?.uid;
  }

  @override
  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  @override
  Future<void> resetPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

}