import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/providerStateHandler.dart';
import 'pages/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProviderListState>(
        create: (context) => ProviderListState(),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: Scaffold(
                appBar: AppBar(
                  title: Text("List examples"),
                ),
                body: HomePage())));
  }
}
