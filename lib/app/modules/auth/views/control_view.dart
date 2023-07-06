import 'package:e_commerce_usama_elgendy/app/modules/auth/controllers/auth_controller.dart';
import 'package:e_commerce_usama_elgendy/app/modules/home/views/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'login_view.dart';

class ControllView extends GetWidget <AuthController> {


  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: AuthController (),
        builder: (controller){
        return controller.userEmail != null ? HomeView() : LoginView();
        });
  }
}