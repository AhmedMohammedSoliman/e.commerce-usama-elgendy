import 'package:e_commerce_usama_elgendy/app/config/fireBase_fun.dart';
import 'package:e_commerce_usama_elgendy/app/data/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../home/views/home_view.dart';

class AuthController extends GetxController {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  var loginFormKey = GlobalKey<FormState>();
  var registerFormKey = GlobalKey<FormState>();
  GoogleSignIn googleSignIn = GoogleSignIn( scopes: ["email"] ) ;
  FirebaseAuth auth = FirebaseAuth.instance;
  Rx<User?> _user = Rxn<User>();

  String? get userEmail => _user.value?.email ;

  String email = "" ;
  String password = "" ;
  String name = "" ;

  @override
  void onInit() {
    super.onInit();
  _user.bindStream(auth.authStateChanges());
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
    await auth.signInWithCredential(credential).then((user) async {
      await FireBaseFun.addUserToFireStore(UserModel(
          name: user.user!.displayName ?? "",
          email: user.user!.email ?? "",
          pic: ""));
    });
  }

  void signInEmailPassword ()async{
    try{
     await auth.signInWithEmailAndPassword(email: email, password: password);
     Get.offAll(HomeView());
    }catch (e){
      Get.snackbar("Error login message", e.toString() , snackPosition:
      SnackPosition.BOTTOM);
    }
  }

  void createAccountEmailPassword () async{
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password).then((user)async {
        await FireBaseFun.addUserToFireStore(UserModel(
            name: name,
            email: email,
            pic: ""));
      });
      Get.offAll(HomeView());
    }catch (e){
      Get.snackbar("Error register message", e.toString());
    }
  }

}
