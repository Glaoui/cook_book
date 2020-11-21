import 'package:flutter/material.dart';
import 'package:flutter_auth/Animation/RotationRoute.dart';
import 'package:flutter_auth/Models/recipie.dart';

import 'package:flutter_auth/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:flutter_auth/Animation/ScaleRoute.dart';

class PopularFoodsWidget extends StatefulWidget {
  @override
  _PopularFoodsWidgetState createState() => _PopularFoodsWidgetState();
}

class _PopularFoodsWidgetState extends State<PopularFoodsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 265,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          PopularFoodTitle(),
          Expanded(child: (PopularFoodItems()))
        ],
      ),
    );
  }
}

class PopularFoodTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Popluar Foods",
            style: TextStyle(
                fontSize: 20,
                color: Color(0xFF3a3a3b),
                fontWeight: FontWeight.w300),
          ),
          Text(
            "See all",
            style: TextStyle(
                fontSize: 16, color: Colors.blue, fontWeight: FontWeight.w100),
          )
        ],
      ),
    );
  }
}

class PopularFoodItems extends StatelessWidget {
  bool inFavorites;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Recipe>>(
        future: Services.getTopRecipes(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Recipe> data = snapshot.data;

            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      // Navigator.push(context, ScaleRoute(page: FoodDetailsPage()));
                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                              left: 10, right: 5, top: 5, bottom: 5),
                          decoration: BoxDecoration(boxShadow: [
                            /* BoxShadow(
                color: Color(0xFFfae3e2),
                blurRadius: 15.0,
                offset: Offset(0, 0.75),
              ),*/
                          ]),
                          child: Card(
                              color: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5.0),
                                ),
                              ),
                              child: Container(
                                width: 170,
                                height: 210,
                                child: Column(
                                  children: <Widget>[
                                    Stack(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Container(
                                            alignment: Alignment.topRight,
                                            width: double.infinity,
                                            padding: EdgeInsets.only(
                                                right: 3, top: 2),
                                            child: Container(
                                              height: 28,
                                              width: 28,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white70,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color(0xFFfae3e2),
                                                      blurRadius: 25.0,
                                                      offset: Offset(0.0, 0.75),
                                                    ),
                                                  ]),
                                              child: Icon(
                                                inFavorites == true
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                                color: Color(0xFFfb3132),
                                                size: 18,
                                              ),
                                            ),
                                          ),
                                        ),
                                        /**   image URl  ****/
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Center(
                                              child: Image.network(
                                            'http://192.168.1.2:3012/public/images/' +
                                                data[index].imageURL,
                                            width: 130,
                                            height: 140,
                                          )),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          alignment: Alignment.bottomLeft,
                                          padding:
                                              EdgeInsets.only(left: 5, top: 5),
                                          child: Text(data[index].name,
                                              /** name*/
                                              style: TextStyle(
                                                  color: Color(0xFF6e6e71),
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                        Container(
                                          alignment: Alignment.topRight,
                                          padding: EdgeInsets.only(right: 5),
                                          child: Container(
                                            height: 28,
                                            width: 28,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white70,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color(0xFFfae3e2),
                                                    blurRadius: 25.0,
                                                    offset: Offset(0.0, 0.75),
                                                  ),
                                                ]),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Container(
                                                  alignment: Alignment.topLeft,
                                                  padding: EdgeInsets.only(
                                                      left: 5, top: 5),
                                                  child: Row(children: <Widget>[
                                                    /*Text("Calories:", /***Calories***/
                                                        style: TextStyle(
                                                         color: Color(0xFF6e6e71),
                                                          fontSize: 10,
                                                           fontWeight: FontWeight.w500)),*/

                                                    Text(
                                                        data[index]
                                                                .calories
                                                                .toString() +
                                                            " Calories ",
                                                        /***Calories***/
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFF6e6e71),
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400)),
                                                  ])),
                                              Container(
                                                  alignment: Alignment.topLeft,
                                                  padding: EdgeInsets.only(
                                                      left: 5, top: 5),
                                                  child: Row(children: <Widget>[
                                                    Icon(
                                                      Icons
                                                          .supervised_user_circle,
                                                      color: Color(0xFFfb3132),
                                                      size: 16,
                                                    ),
                                                    Text(
                                                        data[index]
                                                            .servings
                                                            .toString(),
                                                        /***** Servings****/
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFF6e6e71),
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400)),
                                                  ]))
                                            ]),
                                        Container(
                                          padding:
                                              EdgeInsets.only(top: 3, left: 5),
                                          child: Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.star,
                                                size: 10,
                                                color: Color(0xFFfb3132),
                                              ),
                                              Icon(
                                                Icons.star,
                                                size: 10,
                                                color: Color(0xFFfb3132),
                                              ),
                                              Icon(
                                                Icons.star,
                                                size: 10,
                                                color: Color(0xFFfb3132),
                                              ),
                                              Icon(
                                                Icons.star,
                                                size: 10,
                                                color: Color(0xFFfb3132),
                                              ),
                                              Icon(
                                                Icons.star,
                                                size: 10,
                                                color: Color(0xFF9b9b9c),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )),
                        ),
                      ],
                    ),
                  );

                  /* PopularFoodTiles(
            name: "Fried Egg",
            imageUrl: "ic_popular_food_1",
            rating: '4.9',
            numberOfRating: '200',
            price: '15.06',
            slug: "fried_egg"),*/
                });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        });
  }
}
