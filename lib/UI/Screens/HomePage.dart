import 'package:flutter/material.dart';
import 'package:flutter_auth/UI/widgets/SearchWidget.dart';

import 'package:flutter_auth/UI/widgets/BestFoodWidget.dart';
import 'package:flutter_auth/UI/widgets/PopularFoodsWidget.dart';
//import 'package:flutter_auth/widgets/BottomNavBarWidget.dart';
import 'package:flutter_auth/Animation/ScaleRoute.dart';


class HomePage1 extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SearchWidget(),

            PopularFoodsWidget(),
            BestFoodWidget(),
          ],
        ),
      ),
      //bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}
