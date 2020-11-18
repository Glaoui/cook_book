import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_auth/UI/widgets/BestFoodWidget.dart';
import 'package:flutter_auth/UI/widgets/PopularFoodsWidget.dart';
class ProfilePage extends StatefulWidget{

  @override
  UserProfilePage createState() => UserProfilePage();
}


class UserProfilePage extends State<ProfilePage> {




  final String _status = "Software Developer";
  final String _bio =
      "\"Hi, I am a Freelance\n"
      " developer \n working for hourly basis. If you wants to contact me to build your product leave a message.\"";
  final String _followers = "173";
  final String _posts = "24";
  final String _scores = "450";

   String _fullName = "" ;

  @override
  void initState() {
    super.initState();
    getValue();
  }
  /****** clear all values stored *****/
  /*Future reset() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    prefs.clear();
  }*/


 getValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String stringValue = prefs.getString('username');
    this.setState(() {
      _fullName = stringValue;
    });
  }

  Widget _buildCoverImage(Size screenSize) {
    return Container(
      height: screenSize.height / 3,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

 Widget _buildTabBar(){
   return Container(
     decoration: BoxDecoration(
       color: Colors.white,
     ),
     child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
       SizedBox(height: 20.0),
       //Text('Tabs Inside Body', textAlign: TextAlign.center, style: TextStyle(fontSize: 22)),
       DefaultTabController(
           length: 3, // length of tabs
           initialIndex: 0,
           child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
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
                     border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
                 ),
                 child: TabBarView(children: <Widget>[

                   BestFoodWidget(), //exemple

                   Container(
                     child: Center(
                       child: Text('Display Tab 2', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                     ),
                   ),
                   Container(
                     child: Center(
                       child: Text('Display Tab 3', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                     ),
                   ),

                 ])
             )
           ])
       ),
     ]),

   );
 }


  Widget _buildProfileImage() {
    return Center(
      child: Container(
        width: 140.0,
        height: 140.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/profile.jpg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(80.0),
          border: Border.all(
            color: Colors.white,
            width: 10.0,
          ),
        ),
      ),
    );
  }



    Widget _buildFullName() {

     // SharedPreferences prefs = await SharedPreferences.getInstance();
      //Return String
      //final String _fullName =  prefs.getString('username');

    TextStyle _nameTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 28.0,
      fontWeight: FontWeight.w700,
    );

    return Text(
      _fullName,
      style: _nameTextStyle,
    );
  }




  Widget _buildStatItem(String label, String count) {
    TextStyle _statLabelTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 16.0,
      fontWeight: FontWeight.w200,
    );

    TextStyle _statCountTextStyle = TextStyle(
      color: Colors.black54,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          count,
          style: _statCountTextStyle,
        ),
        Text(
          label,
          style: _statLabelTextStyle,
        ),
      ],
    );
  }

  /*Widget _buildStatContainer() {
    return Container(
      height: 60.0,
      margin: EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(
        color: Color(0xFFEFF4F7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildStatItem("Followers", _followers),
          _buildStatItem("Posts", _posts),
          _buildStatItem("Scores", _scores),
        ],
      ),
    );
  }*/



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
          _buildCoverImage(screenSize),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: screenSize.height / 6.4),
                  _buildProfileImage(),
                  _buildFullName(),
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