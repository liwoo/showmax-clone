import 'package:flutter/material.dart';
import 'package:showmax_clone/screens/root.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Showmax Clone',
        theme:
            ThemeData(primarySwatch: Colors.pink, canvasColor: Colors.black87),
        home: const RootScreen());
  }
}
