import 'package:flutter/material.dart';
import 'package:nested_navigation/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (c) => GeneralProvider(),
      child: MaterialApp(
        title: 'Nested nav',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeRootPage(),
      ),
    );
  }
}
