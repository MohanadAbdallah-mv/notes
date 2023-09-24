// abstract class Auth{
//
//   register(){}
//   login(){}
// }
//
// class FireCall extends Auth{
//   @override
//   login(String email, String password) async {
//     // I Interact directly with the data layer
//     // Firebase - Local Storage
//     // I need a interface to define my responsibilities
//     return true;
//   }
// }
// class LocalCall extends Auth{
//
// }
import 'dart:developer';

import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserForm {
  String email;
  String password;

  UserForm({required this.email, required this.password});
}

abstract class Auth {
  FirebaseAuth firebaseauth;

  Auth({required this.firebaseauth});

  Future<Either<String, UserCredential>> login(UserForm userForm);

  Future<Either<String, UserCredential>> register(UserForm userForm);
}

class AuthImplement extends Auth {
  AuthImplement({required super.firebaseauth});

  @override
  Future<Either<String, UserCredential>> login(UserForm userForm) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userForm.email, password: userForm.password);
      return Right(credential);
    } on FirebaseAuthException catch (e) {
      return Left(e.code);
    }
  }

  @override
  Future<Either<String, UserCredential>> register(UserForm userForm) async {
    //TODO: implement register
    try {
      final UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: userForm.email, password: userForm.password);
      log("auth_data returned successfully");
      return Right(credential);
    } on FirebaseAuthException catch (e) {
      log("auth_data error");
      return Left(e.code);
    }
  }
}
