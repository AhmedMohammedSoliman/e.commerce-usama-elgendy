import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../data/best_products_model.dart';
import '../data/card_model.dart';
import '../data/category_model.dart';
import '../data/user_model.dart';
class FireBaseFun {

  static CollectionReference<UserModel> getCollectionFromFirebase (){
    return FirebaseFirestore.instance.collection('user').withConverter<UserModel>(
      fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()),
      toFirestore: (user, _) => user.toJson(),
    );
  }

  static Future<void> addUserToFireStore (UserModel userModel)async{
    String userId = FirebaseAuth.instance.currentUser!.uid ;
    var collection = getCollectionFromFirebase();
    var doc = collection.doc() ;
    userModel.id = userId ;
    return await doc.set(userModel);
  }

  /// category

 static CollectionReference <CategoryModel> getCategoryCollectionFromFire (){
    return FirebaseFirestore.instance.collection("categories").withConverter(
        fromFirestore: (snapshot, _) => CategoryModel.fromJson(snapshot.data()),
        toFirestore: (category ,  _) => category.toJson());
 }

 static Future<List<CategoryModel>> getCategoriesFromFire ()async{
    var querySnapshot = await getCategoryCollectionFromFire().get();
    return querySnapshot.docs.map((e) => e.data()).toList() ;
 }
 /// bestProducts
 
 static CollectionReference<BestProductsModel> getBestProductsCollectionFromFire (){
    return FirebaseFirestore.instance.collection("bestProducts").withConverter(
        fromFirestore:(snapshot, _) => BestProductsModel.fromJson(snapshot.data()),
        toFirestore: (bestProduct ,  _) => bestProduct.toJson());
 }

 static Future<List<BestProductsModel>> getBestProductsFromFire () async {
    var querySnapshot = await getBestProductsCollectionFromFire().get();
    return querySnapshot.docs.map((e) => e.data()).toList();
 }

 /// card
  static CollectionReference<CardModel> getCardCollectionFromFire (){
    return FirebaseFirestore.instance.collection("card").withConverter(
        fromFirestore:(snapshot, _) => CardModel.fromJson(snapshot.data()),
        toFirestore: (card ,  _) => card.toJson());
  }

  static Future<void> addToCardFireStore (CardModel cardModel , String productId) async {
    var collection = getCardCollectionFromFire();
    var doc = collection.doc();
    cardModel.id = productId;
    return await doc.set(cardModel);
  }

  static Future<List<CardModel>> getCardFromFireBase ()async{
    var querySnapShot = await getCardCollectionFromFire().get();
    return querySnapShot.docs.map((e) => e.data()).toList();
  }

  static Future<void> deleteProductFromCard (String productId)async{
    return await getCardCollectionFromFire().doc(productId).delete();
  }

  static Future <void> updateCardProduct (String productId ,int newQuantity ,
      String price) async {
   return await getCardCollectionFromFire().doc(productId).update({
      "price" : "${int.parse(price)*newQuantity}",
      "quantity" : newQuantity
    });
  }
}