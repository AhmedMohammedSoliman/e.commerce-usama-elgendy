import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
}