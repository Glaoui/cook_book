class Recipe {
  final int id;
  final String name;
  final String description;
  final int calories;
  final int servings;
  final String imageURL;
  final String date;
  final int views;
  final int favorites;
  final int time;
  final String userID;
  final int rating;

  Recipe({this.id, this.name, this.description, this.calories, this.servings,
      this.imageURL, this.date, this.views, this.favorites, this.time,
      this.userID, this.rating});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
     id : json['id'] as int,
    name : json['name'] as String ,
    description : json['description'] as String,
      calories :json['calories']as int,
     servings : json['servings'] as int,
      imageURL : json['image_url'] as String,

     date :json['date']as String,
     views :json['views']as int,
      favorites : json['favorites'] as int,
      time : json['time']  as int,
      userID :json['user_id'] as String,
    //  rating :json['rating'] as int,
    );
  }

  @override
  String toString() {
    return 'Recipe{id: $id, name: $name, description: $description, calories: $calories, servings: $servings, imageURL: $imageURL, date: $date, views: $views, favorites: $favorites, time: $time, userID: $userID, rating: $rating}';
  }

}