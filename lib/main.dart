import 'package:flutter/material.dart';
import 'package:flutter_final_project/usernamepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColor: Colors.white,
          accentColor: Colors.red[400],
          textTheme: TextTheme(
              headline1: TextStyle(
                  color: Colors.red[400],
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold))),
      home: UsernamePage(),
    );
  }
}
