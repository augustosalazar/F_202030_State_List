import 'dart:collection';

import 'package:F_202030_ListWithState/model/todo.dart';
import 'package:flutter/material.dart';

class ProviderListState with ChangeNotifier {
  final List<Todo> _data = [];

  UnmodifiableListView<Todo> get items => UnmodifiableListView(_data);

  void addData(Todo t) {
    _data.add(t);
    notifyListeners();
  }

  void deleteData(Todo t) {
    _data.remove(t);
    notifyListeners();
  }

  void doSomething() async {
    await Future.delayed(Duration(seconds: 2));
    notifyListeners();
  }
}
