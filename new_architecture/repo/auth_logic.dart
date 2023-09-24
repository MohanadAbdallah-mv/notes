import 'dart:developer';

import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:notes/new_architecture/datasource/auth_data.dart';
import '../../models/user_model.dart';
import '../../services/Cashe_Helper.dart';

// I do the business logic here
// Represented in storing data locally when there is no internet connection
// I store data remotely when there is internet connection
// I need a interface to define my responsibilities
abstract class AuthHandler {
  bool isLoggedin;
  AuthImplement authImplement;
  CacheData cacheData;

  AuthHandler(
      {required this.authImplement,
      required this.cacheData,
      this.isLoggedin = false});

  Future<Either<String, MyUser>> login(UserForm userForm);

  Future<Either<String, MyUser>> register(UserForm userForm);
}

class AuthHandlerImplement extends AuthHandler {
  AuthHandlerImplement(
      {required super.authImplement, required super.cacheData});

  MyUser? user;

  @override
  Future<Either<String, MyUser>> login(UserForm userForm) async {
    // TODO: do some shit once the data is back from repo/cashe maybe
    try {
      Either<String, UserCredential> potentialuser =
          await authImplement.login(userForm);
      if (potentialuser.isRight) {
        user = MyUser(
            id: potentialuser.right.user!.uid,
            name: potentialuser.right.user!.displayName!,
            notes:[],//TODO this will be firestore calling notes from there
            isLogged: true);
        //TODO :call cache and save here
        log("we got user");
        return Right(user!);
      } else {
        log("we don't have user");
        return Left(potentialuser.left);}
    } catch (e) {return Left("we fucked up");}
  }

  @override
  Future<Either<String, MyUser>> register(UserForm userForm) async {
    // TODO: do some shit once the data is back from repo/cashe maybe

    try {
      Either<String, UserCredential> potentialuser =
      await authImplement.register(userForm);
      if (potentialuser.isRight) {
        user = MyUser(
            id: potentialuser.right.user!.uid,
            name: potentialuser.right.user!.displayName!,
            notes:[],//TODO this will be firestore calling notes from there
            isLogged: true);
        //TODO :call cache and save here
        log("we got user");
        return Right(user!);
      } else {
        log("we don't have user");
        return Left(potentialuser.left);}
    } catch (e) {return Left("we fucked up");}
  }
}

// i send
