import 'package:e_commerce_usama_elgendy/app/modules/auth/controllers/auth_controller.dart';
import 'package:e_commerce_usama_elgendy/app/modules/home/views/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'login_view.dart';

class ControllView extends GetWidget <AuthController> {

  @override
  AuthController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return controller.userEmail != null ? HomeView() : LoginView();
    });
  }
}