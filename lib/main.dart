import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/splash.dart';
import 'Utils/nav_bar.dart';


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
       // canvasColor: Colors.transparent,
       primarySwatch: Colors.blue,
        fontFamily: "Montserrat",
      ),
      home: SplashScreen(),
    );
  }
}
