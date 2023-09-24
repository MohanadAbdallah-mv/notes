import 'dart:developer';

import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:notes/new_architecture/datasource/auth_data.dart';
import 'package:notes/new_architecture/repo/auth_logic.dart';
import 'package:notes/services/Cashe_Helper.dart';
import '';
import '../../models/user_model.dart';

class AuthController extends ChangeNotifier {
  // I handle collecting data from the user interface and passing it to the logic layer
  // I also handle the logic layer's response and pass it to the user interface
  CacheData cache;
  AuthHandlerImplement repo;

  AuthController({required this.cache, required this.repo});

  Future<void> login(String? email, String? password) async {
    UserForm userForm = UserForm(email: email!, password: password!);
    Either<String, MyUser> res = await repo.login(userForm);
    if (res.isRight) {
      log("finally,logged in");
      print(res.right);
    }else{log("failed at controller");}
    notifyListeners();
  }

  Future<void> register(String? name, String? email, String? password) async{
    UserForm userForm = UserForm(email: email!, password: password!);
    Either<String, MyUser> res = await repo.register(userForm);
    if (res.isRight) {
      log("finally,registered");
      print(res.right);
    }else{
      log(res.left);
      log("failed at controller");}
    notifyListeners();
  }

  void logout() {
    notifyListeners();
  }
// void isLogged(User? user){
// }
}
