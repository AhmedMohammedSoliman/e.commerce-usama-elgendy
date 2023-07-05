class CategoryModel {

  String title ;
  String image ;
  String id ;

  CategoryModel ({required this.title , required this.image , this.id = ""});

  CategoryModel.fromJson (Map <String , dynamic>? json) :
      this (
        title: json!["title"] as String ,
        image: json["image"] as String ,
        id:  json ["id"] as String
      );

  Map<String , dynamic> toJson (){
    return {
      "title" : title ,
      "image" : image ,
      "id" : id
    };
  }
}