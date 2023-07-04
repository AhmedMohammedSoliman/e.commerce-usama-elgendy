import 'package:e_commerce_usama_elgendy/app/modules/auth/views/register_view.dart';
import 'package:e_commerce_usama_elgendy/app/modules/auth/views/widgets/button_widget.dart';
import 'package:e_commerce_usama_elgendy/app/modules/auth/views/widgets/text_field_widget.dart';
import 'package:e_commerce_usama_elgendy/app/modules/auth/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container (
            padding: EdgeInsets.symmetric(vertical: 20 , horizontal: 10),
            width: MediaQuery.of(context).size.width*0.8,
            height: MediaQuery.of(context).size.height*0.8,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                 blurRadius: 2 ,
                  spreadRadius: 2 ,
                  color: Colors.black.withOpacity(0.2),
                )
              ]
            ),
            child: Form(
              key: controller.loginFormKey,
              child: SingleChildScrollView(
                child: Column (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       textWidget(
                         text: "Welcome" ,
                         fontWeight: FontWeight.bold ,
                         fontSize: 20,
                       ),
                       InkWell(
                         onTap: (){
                           Get.to(RegisterView());
                         },
                         child: textWidget(
                           text: "Sign up" ,
                           fontWeight: FontWeight.bold ,
                           color: Colors.green
                         ),
                       ),
                     ],
                   ) ,
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        textWidget(
                          text: "Sign in to continue" ,
                          fontSize: 16,
                        ),
                      ],
                    ) ,
                    SizedBox(height: 40,),
                    Row(
                      children: [
                        textWidget(
                          text: "Email" ,
                          fontWeight: FontWeight.bold ,
                          fontSize: 16,
                        ),
                      ],
                    ),
                    TextFieldWidget(hint: "ahmedellewaa@gmail.com", controller:
                      controller.emailController,
                    validator: (text){
                      if (text == null || text.trim().isEmpty){
                        return "Please email is required" ;
                      }else {
                        return null ;
                      }
                    }, onChanged: (text){
                       controller.email = text ;
                      },),
                    SizedBox(height: 40,),
                    Row(
                      children: [
                        textWidget(
                          text: "Password" ,
                          fontWeight: FontWeight.bold ,
                          fontSize: 16,
                        ),
                      ],
                    ),
                    TextFieldWidget(hint: "**********",
                    controller: controller.passwordController,
                      validator: (text){
                        if (text == null || text.trim().isEmpty){
                          return "Please password is required" ;
                        }else {
                          return null ;
                        }
                      }, onChanged: (text){
                        controller.password = text ;
                      },) ,
                      SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        textWidget(
                          text: "Forget password ? " ,
                          fontWeight: FontWeight.normal ,
                          fontSize: 16,
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: MediaQuery.of(context).size.width*0.7,
                      child: buttonWidget (
                        text: "SIGN IN",
                        textColor: Colors.white,
                        onPressed: (){
                         if (controller.loginFormKey.currentState!.validate() == true){
                           controller.signInEmailPassword();
                         }
                        } ,
                      ),
                    ) ,
                    SizedBox(height: 20,),
                    textWidget(
                      text: "--- OR ---" ,
                      fontWeight: FontWeight.normal ,
                      fontSize: 16,
                    ),
                    SizedBox(height: 40,),
                    Container(
                      width: MediaQuery.of(context).size.width*0.7,
                      child: buttonWidget (
                        backGround: Colors.white,
                        border: Colors.black,
                        text: "Sign in with faceBook",
                        textColor: Colors.black,
                        onPressed: (){
                        } ,
                      ),
                    ) ,
                    SizedBox(height: 10,),
                    Container(
                      width: MediaQuery.of(context).size.width*0.7,
                      child: buttonWidget (
                        backGround: Colors.white,
                        border: Colors.black,
                        text: "Sign in with google",
                        textColor: Colors.black,
                        onPressed: (){
                           controller.signInGoogle();
                        } ,
                      ),
                    ) ,
                  ],
                ),
              ),
            ),
          ),
        )
      ),
    );
  }
}
