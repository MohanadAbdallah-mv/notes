import 'note_model.dart';
class MyUser{
  late String id;
  late String name;
  late bool isLogged;
  late List<Note> notes;

  MyUser({required this.id,required this.name,required this.notes,required this.isLogged});

  MyUser.fromJson(Map<String,dynamic> json){
    id=json["id"];
    name=json["name"];
    notes=json["notes"];
    isLogged=json["isLogged"];
  }
}