import 'package:F_202030_ListWithState/model/providerStateHandler.dart';
import 'package:F_202030_ListWithState/model/todo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Data"),
      ),
      body: Consumer<ProviderListState>(builder: (context, model, child) {
        return _list(context, model);
      }),
      floatingActionButton:
          Consumer<ProviderListState>(builder: (context, model, child) {
        return FloatingActionButton(
            onPressed: () => _addTodo(model),
            tooltip: 'Add task',
            child: new Icon(Icons.add));
      }),
    );
  }

  _addTodo(ProviderListState model) async {
    Todo todo = Todo(
        body: 'the Body ' + model.items.length.toString(),
        title: 'the Item ',
        completed: 0);

    if (todo != null) {
      model.addData(todo);
    }
  }

  Widget _list(BuildContext context, ProviderListState model) {
    var model = context.watch<ProviderListState>();
    List<Todo> todos = model.items;
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, posicion) {
        var element = todos[posicion];
        return _item(context, element, posicion);
      },
    );
  }

  Widget _item(BuildContext context, Todo element, int posicion) {
    return Card(
      margin: EdgeInsets.all(4.0),
      color: element.completed == 1
          ? Colors.blueGrey
          : Theme.of(context).accentColor,
      child: ListTile(
        contentPadding: EdgeInsets.all(10.0),
        title: _itemTitle(element),
        subtitle: _itemSubTitle(element),
        onTap: () => _onTap(context, element, posicion),
      ),
    );
  }

  void _onTap(BuildContext context, Todo location, int posicion) {
    print('Tap on ' + 'title: ${location.title} posicion ' + '$posicion');
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
