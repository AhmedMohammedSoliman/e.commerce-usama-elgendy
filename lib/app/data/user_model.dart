import 'dart:convert';
import 'dart:math';

class UserModel {

  String name ;
  String email ;
  String id ;
  String pic ;

  UserModel ({required this.name , required this.email , this.id = "" ,
  required this.pic});

  UserModel.fromJson (Map <String , dynamic>? json)
  : this (
    name : json!["name"] as String ,
    email : json["email"] as String ,
    id  : json["id"] as String ,
    pic: json ["pic"] as String
  );

  Map<String , dynamic> toJson (){

    return {
      "name" : name ,
      "email" : email ,
      "id" : id ,
      "pic" : pic
    };
  }
}