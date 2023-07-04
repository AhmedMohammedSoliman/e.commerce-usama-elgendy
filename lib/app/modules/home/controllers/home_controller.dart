import 'package:e_commerce_usama_elgendy/app/modules/card/views/card_view.dart';
import 'package:e_commerce_usama_elgendy/app/modules/explore/views/explore_view.dart';
import 'package:e_commerce_usama_elgendy/app/modules/person/views/person_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  RxList<Widget> tabsList =[const ExploreView() , const CardView() , const PersonView()].obs ;

  RxInt selectedIndex = 0.obs ;

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

}
