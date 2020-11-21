import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth/UI/widgets/AddR.dart';
import 'package:http/http.dart' as http;

class AjoutR extends StatefulWidget {
  @override
  _AjoutRState createState() => _AjoutRState();
}

class _AjoutRState extends State<AjoutR> {
  var formKey = GlobalKey<FormState>();
  var name = TextEditingController();
  var description = TextEditingController();
  insertRecipe() async {
    var res = http.post("http://192.168.1.2:3012/recipes/create",
        body: {"name": name.text, "description": description.text});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == null) {
                            return "Field Cannot be empty";
                          }
                          return null;
                        },
                        controller: name,
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        validator: (value) {
                          if (value == null) {
                            return "Field Cannot be empty";
                          }
                          return null;
                        },
                        controller: description,
                      ),
                      SizedBox(height: 20.0),
                      RaisedButton(
                        child: Text("insert Recipe"),
                        onPressed: () {
                          insertRecipe();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => AddR()));
                        },
                      )
                    ],
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
