import 'package:flutter/material.dart';
import 'root_main.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PriceIT',
      home: RootMain(),
    );
  }
}