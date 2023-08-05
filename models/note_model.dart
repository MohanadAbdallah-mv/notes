class Note{
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
  Note(this._title,this._description);
}