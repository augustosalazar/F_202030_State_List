import 'package:F_202030_ListWithState/pages/providerList.dart';
import 'package:flutter/material.dart';

import 'internalList.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _row(context, "Lista con datos internos", InternalList()),
          _row(context, "Lista con datos con Provider", ProviderList()),
        ],
      ),
    ]);
  }

  Widget _row(BuildContext context, String text, Widget destination) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      margin: EdgeInsets.all(20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            FlatButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => destination),
                )
              },
              child: Text(text,
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
          ]),
    );
  }
}
