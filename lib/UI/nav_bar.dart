import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/home.dart';
import 'package:flutter_auth/Screens/login.dart';
import 'package:flutter_auth/Screens/profile.dart';
import 'package:flutter_auth/Screens/register.dart';
import 'package:flutter_auth/Screens/search.dart';
import 'package:flutter_auth/Screens/splash.dart';
import 'package:flutter_auth/Utils/app_properties.dart';

import '../Models/meal.dart';
import '../Screens/categories_screen.dart';
import '../Screens/favorites_screen.dart';
import '../widgets/main_drawer.dart';

class Home_wid extends StatefulWidget {
  static const routeName = '/nav-screen';
  final List<Meal> favoriteMeals;

  Home_wid(this.favoriteMeals);
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home_wid> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoritesScreen(widget.favoriteMeals),
        'title': 'Your Favorite',
      },
      {
        'page': ProfilePage(),
        'title': 'Your Profile',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
        ],
      ),
    );
  }
}
