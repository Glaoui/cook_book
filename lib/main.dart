import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_auth/Screens/splash.dart';
import 'UI/nav_bar.dart';
import 'package:flutter_auth/Utils/app_properties.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Cook Book ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        canvasColor: Colors.yellow [50],
        primarySwatch: Colors.red,
        fontFamily: "Montserrat",
      ),
      home: SplashScreen(),
    );
  }
}
