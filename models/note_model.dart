import 'package:intl/intl.dart';

class Note {
  late String _title;

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  late String _description;

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  //DateTime time=DateTime.now();
  String _creationTime = DateFormat.jm().format(DateTime.now());

  String get creationTime => _creationTime;

  set creationTime(String value) {
    _creationTime = value;
  }

  Note(this._title, this._description);
}
