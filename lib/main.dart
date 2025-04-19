import 'package:flutter/material.dart';
import 'translator_home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Translator',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: TranslatorHomePage(),
    );
  }
}
