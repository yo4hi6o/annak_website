import 'package:flutter/material.dart';
import 'home_page.dart';
import 'AI_page.dart';
import 'query.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Company Website',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/tags': (context) => AIPage(),
      },
    );
  }
}
