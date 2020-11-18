//

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Models/recipie.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_auth/models/Labels.dart';

class Services {
  //
     static const String url = "http://192.168.1.18:3012/";
    static const String baseUrl = 'http://192.168.43.198:3012/';
  static Future<List<Labels>> getLabels() async {
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        final List<Labels> labels = labelsFromJson(response.body);
        return labels;
      } else {
        return List<Labels>();
      }
    } catch (e) {
      return List<Labels>();
    }
  }

   static Future logIn(String email, String password) async {
     try {
       var res = await http.post(

         baseUrl + 'users/signin',

         headers: <String, String>{
           'Content-Type': 'application/json ; charset=UTF-8'
         },
         body: jsonEncode(<String, String>{
           "email": email,
           "password": password
         }),
       );
       print(baseUrl + 'users/signin');
          //return convertedDatatoJson;
       if (res.statusCode == 200) {
         var convertedDatatoJson = jsonDecode(res.body);
         return convertedDatatoJson;
       } else {
         return null;
       }
     } catch (e)
     {
       return null;
     }
   }

     static Future Register ( String username ,String email, String password) async {

         var res = await http.post(

           baseUrl + 'users/insert',

           headers: <String, String>{
             'Content-Type': 'application/json ; charset=UTF-8'
           },
           body: jsonEncode(<String, String>{
             "username" : username ,
             "email": email,
             "password": password
           }),
         );
         print(baseUrl + 'users/insert');

         if (res.statusCode == 200) {
           var convertedDatatoJson = jsonDecode(res.body);
           return convertedDatatoJson;
         } else {
           return null;
         }

     }

     static Future<List<Recipe>> getTopRecipes() async {
       var res = await http.get(baseUrl + 'recipes/top');
       print(baseUrl + 'recipes/top');
       if (res.statusCode == 200) {
         List jsonResponse = jsonDecode(res.body);
         print(res.body);
         return jsonResponse.map((recipe) => Recipe.fromJson(recipe))
             .toList();
       } else {
         throw "Failed to load Recipe list";
       }
     }
}
