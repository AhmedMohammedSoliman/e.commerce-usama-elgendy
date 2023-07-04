import 'package:e_commerce_usama_elgendy/app/modules/auth/controllers/auth_controller.dart';
import 'package:e_commerce_usama_elgendy/app/modules/auth/views/widgets/button_widget.dart';
import 'package:e_commerce_usama_elgendy/app/modules/auth/views/widgets/text_field_widget.dart';
import 'package:e_commerce_usama_elgendy/app/modules/auth/views/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends GetWidget<AuthController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
      ),
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
              key: controller.registerFormKey,
              child: SingleChildScrollView(
                child: Column (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textWidget(
                          text: "Sign up" ,
                          fontWeight: FontWeight.bold ,
                          fontSize: 20,
                        ),
                      ],
                    ) ,
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        textWidget(
                          text: "Sign up to continue" ,
                          fontSize: 16,
                        ),
                      ],
                    ) ,
                    SizedBox(height: 40,),
                    Row(
                      children: [
                        textWidget(
                          text: "Name" ,
                          fontWeight: FontWeight.bold ,
                          fontSize: 16,
                        ),
                      ],
                    ),
                    TextFieldWidget(hint: "ahmed soliman", controller:
                    controller.nameController,
                      validator: (text){
                        if (text == null || text.trim().isEmpty){
                          return "Please email is required" ;
                        }else {
                          return null ;
                        }
                      }, onChanged: (text){
                        controller.name = text ;
                      },),
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
                    Container(
                      width: MediaQuery.of(context).size.width*0.7,
                      child: buttonWidget (
                        text: "SIGN UP",
                        textColor: Colors.white,
                        onPressed: (){
                          if (controller.registerFormKey.currentState!.validate() == true){
                           controller.createAccountEmailPassword();
                          }
                        } ,
                      ),
                    ) ,
                    SizedBox(height: 40,),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
