class CardModel {

  String id ;
  String title ;
  String image  ;
  String price ;
  int quantity ;

  CardModel ({required this.price , required this.title,
  required this.quantity, required this.image ,this.id = "",});

  CardModel.fromJson (Map <String , dynamic>? json) :
        this (
          id: json!["id"] as String ,
          image: json["image"] as String ,
          title:  json ["title"] as String ,
          price: json ["price"] as String ,
         quantity: json ["quantity"] as int ,

      );

  Map<String , dynamic> toJson (){
    return {
      "title" : title ,
      "image" : image ,
      "id" : id ,
      "price" : price ,
      "quantity" : quantity ,
    };
  }
}