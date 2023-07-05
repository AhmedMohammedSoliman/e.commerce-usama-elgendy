import 'package:e_commerce_usama_elgendy/app/modules/card/controllers/card_controller.dart';
import 'package:get/get.dart';
import '../../../config/fireBase_fun.dart';
import '../../../data/card_model.dart';

class DetailsController extends GetxController {

  int index = 0 ;

  CardController cardController = Get.find();

  @override
  void onInit() {
    cardController.getCardFromFire();
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


  // bool isExist (int index , CardController cardController){
  //   if (cardController.cardList.contains(cardController.cardList[index])){
  //     return true ;
  //   }else {
  //     return false ;
  //   }
  // }
}
