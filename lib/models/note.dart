
class Note {

  int _id;
  String _title;
  String _description;
  String _date;
  int _total;
  int _missed;


  Note(this._title,this._date,  this._total,this._missed,[this._description]);

  Note.withId(this._id,this._date, this._title,  this._total,this._missed, [this._description]);

  int get id => _id;

  String get title => _title;

  String get description => _description;

  int get total => _total;

  int get missed => _missed;

  String get date => _date;

  set title(String newTitle) {
    if (newTitle.length <= 255) {
      this._title = newTitle;
    }
  }

  set description(String newDescription) {
    if (newDescription.length <= 255) {
      this._description = newDescription;
    }
  }

  set total(int newTotal) {
    if(newTotal>=0)
      this._total = newTotal;
  }

  set missed(int newMissed){
    if(newMissed>=0)
      this._missed = newMissed;
  }

  set date(String newDate) {
    this._date = newDate;
  }

  // Convert a Note object into a Map object
  Map<String, dynamic> toMap() {

    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['description'] = _description;
    map['total'] = _total;
    map['missed'] = _missed;
    map['date'] = _date;

    return map;
  }

  // Extract a Note object from a Map object
  Note.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
    this._description = map['description'];
    this._total = map['total'];
    this._missed = map['missed'];
    this._date = map['date'];
  }
}