import 'package:e_commerce_usama_elgendy/app/modules/auth/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'bottom_navigetor_widget.dart';

class HomeView extends GetView<HomeController> {

  HomeView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: GetBuilder(
          init: HomeController(),
            builder: (controller) {
            return BottomNavigatorWidget();
            }),
        body: Obx ((){
          return controller.tabsList.value[controller.selectedIndex.value];
        })
      ),
    );
  }
}
