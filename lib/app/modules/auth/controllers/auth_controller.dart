import 'package:e_commerce_usama_elgendy/app/config/fireBase_fun.dart';
import 'package:e_commerce_usama_elgendy/app/data/user_model.dart';
import 'package:e_commerce_usama_elgendy/app/modules/auth/views/control_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../config/local_storage_prefs.dart';


class AuthController extends GetxController {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  var loginFormKey = GlobalKey<FormState>();
  var registerFormKey = GlobalKey<FormState>();

  GoogleSignIn googleSignIn = GoogleSignIn( scopes: ["email"] ) ;

  FirebaseAuth auth = FirebaseAuth.instance;
  String email = "" ;
  String password = "" ;
  String name = "" ;

  final Rx<User?> _user = Rxn<User>();

  String? get userEmail => _user.value?.email ;

  @override
  void onInit() {

    _user.bindStream(auth.authStateChanges());
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
    await auth.signInWithCredential(credential).then((value) async{
      await FireBaseFun.addUserToFireStore(UserModel(
          name: auth.currentUser!.displayName!,
          email: auth.currentUser!.email!,
          pic: ""));
      
      LocalStoragePrefs.saveUser(UserModel(
          name: auth.currentUser!.displayName!,
          email: auth.currentUser!.email!,
          pic: ""));
    });
    Get.offAll(ControllView());
  }

  void signInEmailPassword ()async{
    await auth.signInWithEmailAndPassword(email: email, password: password).then((value) async {
      await FireBaseFun.getUserFromFire(value.user!.uid).then((value) async {
       if (value != null){
         await LocalStoragePrefs.saveUser(value);
       }
       print("not user");
      });
      Get.offAll(ControllView());
    });
  }

  void createAccountEmailPassword ()async{
    await auth.createUserWithEmailAndPassword(email: email, password: password).then((value)async {
      await FireBaseFun.addUserToFireStore(UserModel(
          name: name, email: email, pic: ""));
      await LocalStoragePrefs.saveUser(UserModel(
          name: name, email: email, pic: ""));
      Get.offAll(ControllView());
    });
  }
}
