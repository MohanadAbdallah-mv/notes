import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class UserForm {
  UserForm({
    required this.email,
    required this.password,
  });

  String email;
  String password;
}

abstract class Auth {
  Auth({
    required this.auth,
  });

  FirebaseAuth auth;

  Future<UserCredential?> register(UserForm userForm);
  Future<UserCredential?> login(UserForm userForm);
}

class AuthImpl extends Auth {
  AuthImpl({required super.auth});

  @override
  Future<UserCredential?> login(UserForm userForm) async {
    try {
      final UserCredential credential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userForm.email,
        password: userForm.password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
      }
    }
    return null;
  }

  @override
  Future<UserCredential?> register(UserForm userForm) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userForm.email,
        password: userForm.password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
