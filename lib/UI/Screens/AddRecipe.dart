import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth/UI/widgets/AddR.dart';
import 'package:flutter_auth/UI/widgets/AjoutR.dart';
import 'package:http/http.dart' as http;

class AddRecipe extends StatefulWidget {
  @override
  _AddRecipeState createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  Widget _buildTabBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 20.0),
            //Text('Tabs Inside Body', textAlign: TextAlign.center, style: TextStyle(fontSize: 22)),
            DefaultTabController(
                length: 3, // length of tabs
                initialIndex: 0,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: TabBar(
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.blueGrey,
                          tabs: [
                            Tab(icon: Icon(Icons.directions_car)),
                            Tab(icon: Icon(Icons.directions_transit)),
                            Tab(icon: Icon(Icons.directions_bike)),
                          ],
                        ),
                      ),
                      Container(
                          height: 400, //height of TabBarView
                          decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: Colors.grey, width: 0.5))),
                          child: TabBarView(children: <Widget>[
                            AddR(), //exemple
                            AjoutR(),

                            Container(
                              child: Center(
                                child: Text('Display Tab 3',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ]))
                    ])),
          ]),
    );
  }

  Widget _buildSeparator(Size screenSize) {
    return Container(
      width: screenSize.width / 1.6,
      height: 2.0,
      color: Colors.black54,
      margin: EdgeInsets.only(top: 4.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: screenSize.height / 6.4),

                  //_buildStatus(context),
                  //_buildStatContainer(),
                  //_buildBio(context),
                  _buildSeparator(screenSize),
                  _buildTabBar()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
