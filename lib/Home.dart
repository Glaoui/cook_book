import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  getRecipes() async {
    var res = await http.get("http://192.168.1.18:3012/recipes/labels");



    if (res.statusCode == 200) {
      var jsonObj = json.decode(res.body);

      return jsonObj;
    }
    getLabels() async {
      List<String> list = new List<String>();
      list.add('Healthy');
      list.add('Vegetarian');
      var resdeux;
      var jsonObjdeux;

      resdeux = await http.get("http://192.168.1.18:3012/recipes/labels");

      if (resdeux.statusCode == 200) {
        var jsonObjdeux = json.decode(resdeux.body);
        print(resdeux.data);

        return jsonObjdeux;
      }
      print("2222222");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('message')),
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
                          child: Card(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(snapshot.data[index]["category"]),

                                Text(snapshot.data[index]["labels"][0]),
                                //Text(snapshot.data[index]["labels"][1]),
                                //Text(snapshot.data[index]["name"]),
                              ],
                            ),
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
}
