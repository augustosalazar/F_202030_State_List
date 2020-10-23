import 'package:F_202030_SimpleStateProvider/model/single_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class W1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SingleModel>(
        create: (context) => SingleModel(),
        child: Container(
            color: Colors.blueGrey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Widget 1",
                    style: TextStyle(
                      color: Colors.white,
                    )),
                OneRow()
              ],
            )));
  }
}

class OneRow extends StatelessWidget {
  const OneRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [P1(), P2()],
    );
  }
}

class P2 extends StatelessWidget {
  const P2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SingleModel>(
      builder: (context, model, child) {
        return Text('${model.get_some_value}',
            style: TextStyle(
              color: Colors.white,
            ));
      },
    );
  }
}

class P1 extends StatelessWidget {
  const P1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SingleModel>(
      builder: (context, model, child) {
        return FlatButton(
          color: Theme.of(context).accentColor,
          child: Text('Click Me',
              style: TextStyle(
                color: Colors.white,
              )),
          onPressed: () {
            Provider.of<SingleModel>(context, listen: false).setSomeValue();
          },
        );
      },
    );
  }
}
