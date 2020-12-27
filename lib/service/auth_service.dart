import 'package:firebase_auth/firebase_auth.dart';

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<bool> SignUpWithEmailAndPassword(String email, String password,String username) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      print( userCredential.user);
      return true;
    } catch (e) {
      print("SignUp error from Auth file:${e.toString()}");
    }
  }
  Future<UserCredential> SignInWithEmailAndPassword(String email, String password) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      UserCredential user =
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return user;
    } catch (e) {
      print(e);
      return null;
    }

  }



  Future resetPass(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print("reset password error from Auth file:${e.toString()}");
    }
  }

  Future signOut(String email) async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print("reset password error from Auth file:${e.toString()}");
    }
  }
}
