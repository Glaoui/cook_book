import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth/UI/Screens/AddRecipe.dart';
import 'package:http/http.dart' as http;

class AddR extends StatefulWidget {
  @override
  _AddRState createState() => _AddRState();
}

class _AddRState extends State<AddR> {
  getRecipes() async {
    var res = await http.get("http://192.168.1.2:3012/recipes/");

    ;

    if (res.statusCode == 200) {
      var jsonObj = json.decode(res.body);

      return jsonObj;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: FutureBuilder(
              future: getRecipes(),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Container(
                          color: Colors.red,
                          margin: EdgeInsets.all(10),
                          height: 200,
                          width: 350,
                          child: Card(
                            child: Row(
                                //crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Text(snapshot.data[index]["name"]),
                                  SizedBox(height: 20.0),

                                  //Text(snapshot.data[index]["description"]),
                                  SizedBox(height: 20.0),
                                  //  Text(snapshot.data[index]["calories"]
                                  //   .toString()),
                                  //Text(snapshot.data[index]["servings"]),
                                  Image.network(
                                    "http://192.168.1.2:3012/public/images/" +
                                        snapshot.data[index]["image_url"],
                                    fit: BoxFit.fill,
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () => confirmDelete(
                                        snapshot.data[index]["id"]),
                                  )

                                  //Text(snapshot.data[index]["time"]),
                                  //Text(snapshot.data[index]["rating"]),
                                  //Text(snapshot.data[index]["labels"][1]),
                                  //Text(snapshot.data[index]["name"]),
                                ]),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return CircularProgressIndicator();
                }
              }),
        ),
      ),
    );
  }

  confirmDelete(id) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text("Delete"),
              content: Text("Are you sure?"),
              actions: [
                FlatButton(
                  child: Text("Yes"),
                  onPressed: () async {
                    await http.delete("http://192.168.1.2:3012/recipes/$id");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddRecipe()));
                  },
                ),
                FlatButton(
                  child: Text("No"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ));
  }
}
