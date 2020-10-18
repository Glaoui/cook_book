import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/home.dart';
import 'package:flutter_auth/Screens/login.dart';
import 'package:flutter_auth/Screens/profile.dart';
import 'package:flutter_auth/Screens/register.dart';
import 'package:flutter_auth/Screens/search.dart';
import 'package:flutter_auth/Screens/splash.dart';
import 'package:flutter_auth/Utils/app_properties.dart';

class Home_wid extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home_wid> {
  int _currentIndex = 0;
  final List<Widget> _children = [HomePage(),SearchPage(),ProfilePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: transparentYellow,
        title: Text('CookBook'),
      ),
      body: _children[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: transparentYellow,
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        //currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: new Icon(Icons.search),
            title: new Text('Search'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile')
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

