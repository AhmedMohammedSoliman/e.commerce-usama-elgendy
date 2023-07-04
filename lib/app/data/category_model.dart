class CategoryModel {

  String title ;
  String image ;

  CategoryModel ({required this.title , required this.image});

  CategoryModel.fromJson (Map <String , dynamic>? json) :
      this (
        title: json!["title"] as String ,
        image: json["image"] as String ,
      );

  Map<String , dynamic> toJson (){
    return {
      "title" : title ,
      "image" : image ,
    };
  }
}