import 'package:F_202030_ListWithState/model/todo.dart';
import 'package:flutter/material.dart';

class InternalList extends StatefulWidget {
  @override
  _InternalListState createState() => _InternalListState();
}

class _InternalListState extends State<InternalList> {
  List<Todo> todos = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Internal Data"),
      ),
      body: _list(),
      floatingActionButton: new FloatingActionButton(
          onPressed: _addTodo, tooltip: 'Add task', child: new Icon(Icons.add)),
    );
  }

  _addTodo() {
    final todo = Todo(body: "ssss", title: "tttt", completed: 0);

    if (todo != null) {
      setState(() {
        this.todos.add(todo);
      });
    }
  }

  Widget _list() {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, posicion) {
        var element = todos[posicion];
        return _item(element, posicion);
      },
    );
  }

  Widget _item(Todo element, int posicion) {
    return Card(
      margin: EdgeInsets.all(4.0),
      color: element.completed == 1
          ? Colors.blueGrey
          : Theme.of(context).accentColor,
      child: ListTile(
        contentPadding: EdgeInsets.all(10.0),
        title: _itemTitle(element),
        subtitle: _itemSubTitle(element),
      ),
    );
  }

  Widget _itemTitle(Todo item) {
    return Text(item.title,
        style: TextStyle(
            fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white));
  }

  Widget _itemSubTitle(Todo item) {
    return Text(item.body,
        style: TextStyle(fontSize: 12.0, color: Colors.white));
  }
}
