import 'package:F_202030_ListWithState/widgets/w1.dart';
import 'package:F_202030_ListWithState/widgets/w2.dart';
import 'package:flutter/material.dart';

class MainPageStateful extends StatefulWidget {
  @override
  _MainPageStatefulState createState() => _MainPageStatefulState();
}

class _MainPageStatefulState extends State<MainPageStateful> {
  int _id = 0;
  _onPressed() {
    setState(() {
      _id = _id == 0 ? 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Column(
        children: [
          Text("MainPage"),
          FlatButton(
            color: Theme.of(context).accentColor,
            onPressed: () => _onPressed(),
            child: Text(
              "Press to change",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Expanded(child: _id == 0 ? W1() : W2())
        ],
      ),
    ));
  }
}
