import 'package:controller_training/pages/log_in_page.dart';
import 'package:controller_training/pages/sig_up_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LogInPage(),
      routes: {
        LogInPage.id:(context) => LogInPage(),
        SignUpPage.id:(context) => SignUpPage(),
      },
    );
  }
}