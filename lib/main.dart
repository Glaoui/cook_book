import 'package:flutter/material.dart';

import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/Home.dart';
import 'package:flutter_auth/main.dart';

import 'Home_recipes.dart';

void main() => runApp(JsonParseDemo());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Home(),
    );
  }
}
