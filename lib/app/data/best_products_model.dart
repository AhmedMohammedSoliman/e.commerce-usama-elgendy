class BestProductsModel {

  String id ;
  String title ;
  String description ;
  String size ;
  String color ;
  String image ;
  String price ;
  String details ;

  BestProductsModel ({required this.title , required this.size , this.id = "" ,
  required this.color , required this.description , required this.image ,
  required this.price , required this.details});

  BestProductsModel.fromJson (Map <String , dynamic>? json) :
        this (
        id: json!["id"] as String ,
        title: json["title"] as String ,
        description: json["description"] as String ,
        size: json["size"] as String ,
        color: json["color"] as String ,
        image: json["image"] as String ,
        price: json ["price"] as String,
        details: json ["details"] as String
      );

  Map<String , dynamic> toJson (){
    return {
      "id" : id ,
      "title" : title ,
      "description" : description ,
      "size" : size ,
      "color" : color ,
      "image" : image ,
      "price" : price ,
      "details" : details,
    };
  }
}