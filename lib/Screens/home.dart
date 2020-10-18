import 'package:flutter/material.dart';
import 'package:flutter_auth/Utils/store.dart';
import 'package:flutter_auth/Models/recipe.dart';
import 'package:flutter_auth/UI/recipe_card.dart';
class HomePage extends StatefulWidget {
  @override
  HomePageState createState() =>  HomePageState();
}


class HomePageState extends State<HomePage> {

  // New member of the class:
  List<Recipe> recipes = getRecipes();
  List<String> userFavorites = getFavoritesIDs();

  // New method:
  // Inactive widgets are going to call this method to
  // signalize the parent widget HomeScreen to refresh the list view.
  void _handleFavoritesListChanged(String recipeID) {
    // Set new state and refresh the widget:
    setState(() {
      if (userFavorites.contains(recipeID)) {
        userFavorites.remove(recipeID);
      } else {
        userFavorites.add(recipeID);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // New method:
    Padding _buildRecipes(List<Recipe> recipesList) {
      return Padding(
        // Padding before and after the list view:
        padding: const EdgeInsets.symmetric(vertical: 5.0), // New code
        child :Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: recipesList.length,
                itemBuilder: (BuildContext context, int index) {
                  return new  RecipeCard(
                      recipe: recipesList[index],
                      inFavorites: userFavorites.contains(recipesList[index].id),
                      onFavoriteButtonPressed: _handleFavoritesListChanged
                  );
                },
              ),
            ),
          ],
        ),
      );
    }


    const double _iconSize = 20.0;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          // We set Size equal to passed height (50.0) and infinite width:
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            backgroundColor: Colors.yellow [50],
            elevation: 2.0,
            bottom: TabBar(
              labelColor: Theme.of(context).indicatorColor,
              tabs: [
                Tab(icon: Icon(Icons.restaurant, size: _iconSize)),
                Tab(icon: Icon(Icons.local_drink, size: _iconSize)),
                Tab(icon: Icon(Icons.favorite, size: _iconSize)),
                Tab(icon: Icon(Icons.settings, size: _iconSize)),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(5.0),
          child: TabBarView(
            // Replace placeholders:
            children: [
              // Display recipes of type food:
              _buildRecipes(recipes
                  .where((recipe) => recipe.type == RecipeType.food)
                  .toList()),
              // Display recipes of type drink:
              _buildRecipes(recipes
                  .where((recipe) => recipe.type == RecipeType.drink)
                  .toList()),
              // Display favorite recipes:
              _buildRecipes(recipes
                  .where((recipe) => userFavorites.contains(recipe.id))
                  .toList()),
              Center(child: Icon(Icons.settings)),
            ],
          ),
        ),
      ),
    );




    //////// Simple list horizental

    /*final List<int> numbers = [1, 2, 3, 5, 8, 13, 21, 34, 55];
  Widget build (BuildContext context) {
    return Container(

      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 24.0),
      height: MediaQuery
          .of(context)
          .size
          .height * 0.3,
      //child: Text("hhhhhhhf"),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: numbers.length, itemBuilder: (context, index) {
        return Container(

          width: MediaQuery
              .of(context)
              .size
              .width * 0.3,
          child: Card(
            color: Colors.white12,
            child: Container(
              child: Center(child: Text(numbers[index].toString(),
                style: TextStyle(color: Colors.white, fontSize: 36.0),)),
            ),
          ),
        );
      }),
    );

  }*/
  }
}