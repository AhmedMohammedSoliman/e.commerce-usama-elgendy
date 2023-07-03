import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

class AuthController extends GetxController {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  GoogleSignIn googleSignIn = GoogleSignIn( scopes: ["email"] ) ;
  FirebaseAuth auth = FirebaseAuth.instance;
  FacebookLogin facebookSignIn = FacebookLogin();


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void signInGoogle () async {
    final GoogleSignInAccount? googleAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication? googleSignInAuthentication = await googleAccount?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication?.accessToken,
      idToken: googleSignInAuthentication?.idToken
    );
    await auth.signInWithCredential(credential);
  }

  void signInFacebook () async {
   final FacebookLoginResult result =  await facebookSignIn.logIn(customPermissions: ["email"]);
   final String token = result.accessToken!.token ;
   if (result.status == FacebookLoginStatus.success){
     final credential = FacebookAuthProvider.credential(token);
     await auth.signInWithCredential(credential);
   }
  }

}
