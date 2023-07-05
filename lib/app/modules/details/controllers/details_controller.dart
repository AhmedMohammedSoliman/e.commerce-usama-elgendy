import 'package:e_commerce_usama_elgendy/app/data/best_products_model.dart';
import 'package:e_commerce_usama_elgendy/app/modules/card/controllers/card_controller.dart';
import 'package:get/get.dart';
import '../../../config/fireBase_fun.dart';
import '../../../data/card_model.dart';

class DetailsController extends GetxController {

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

  void addCardFromFire(String productId , String title , String price , String image ,
     CardController cardController , CardModel product)async{
    bool isExist = cardController.cardList.contains(product);
    if (isExist == true){
      Get.back();
     Get.snackbar("Added failed", "Product already exist in card");
    }else {
    try{
      await FireBaseFun.addToCardFireStore(CardModel(
          price: price,
          title: title,
          image: image),
          productId).then((value) {
        print("added");
        Get.back();
        Get.snackbar("Added success", "Product added to card");
      });
    }catch (e){
      rethrow ;
    }
    }
  }

  // bool isExist (int index , CardController cardController){
  //   if (cardController.cardList.contains(cardController.cardList[index])){
  //     return true ;
  //   }else {
  //     return false ;
  //   }
  // }
}
