enum TodoType {
  DEFAULT,
  CALL,
  HOME_WORK,
}

class Todo {
  int id;
  String title;
  String body;
  int completed;
  TodoType type;
  Todo({this.title, this.body, this.completed, this.type = TodoType.DEFAULT});

  static TodoType visibilityFromString(String value) {
    return TodoType.values.firstWhere(
        (e) => e.toString().split('.')[1].toUpperCase() == value.toUpperCase());
  }

  // convenience constructor to create a Word object
  Todo.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    body = map['body'];
    completed = map['completed'];
  }

  // convenience method to create a Map from this Word object
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'title': title,
      'body': body,
      'completed': completed,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }
}
