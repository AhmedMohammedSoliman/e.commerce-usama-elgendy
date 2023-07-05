class CardModel {

  String id ;
  String title ;
  String image  ;
  String price ;
  CardModel ({required this.price , required this.title , required this.image ,this.id = "",});

  CardModel.fromJson (Map <String , dynamic>? json) :
        this (
          id: json!["id"] as String ,
          image: json["image"] as String ,
          title:  json ["title"] as String ,
          price: json ["price"] as String ,

      );

  Map<String , dynamic> toJson (){
    return {
      "title" : title ,
      "image" : image ,
      "id" : id ,
      "price" : price
    };
  }
}