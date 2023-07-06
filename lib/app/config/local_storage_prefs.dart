import 'dart:convert';
import 'package:e_commerce_usama_elgendy/app/data/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStoragePrefs {

    static Future <bool> saveUser (UserModel userModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("user", jsonEncode(userModel.toJson()));
    return true ;
    print("added user to prefs");
  }

   static _getUser ()async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var userString  =  prefs.getString("user");
      return UserModel.fromJson(jsonDecode(userString!));
  }

 static Future <UserModel> get getUser  async {
  try {
    UserModel userModel = await _getUser();
   if (userModel == null){
     print("failed : ${userModel.toJson()}");
   }
    print("success : ${userModel.toJson()}");
   return userModel ;
  }catch (e){
    print(e.toString());
    return _getUser() ;
 }
  }

 static Future <void> deleteUserFromCache() async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      print("deleted user");
  }

}