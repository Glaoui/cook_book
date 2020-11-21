import 'package:flutter/material.dart';

import '../Screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  final String url;

  CategoryItem(this.id, this.title, this.color, this.url);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () => selectCategory(context),
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
        child: SingleChildScrollView(
          child: Container(
            child: Column(children: [
              Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.green[600]),
              ),
              SizedBox(
                height: 20,
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.green[700], width: 2.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.network(
                    url,
                    height: 90,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
