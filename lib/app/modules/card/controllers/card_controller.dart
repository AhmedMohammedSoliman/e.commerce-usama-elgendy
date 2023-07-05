import 'package:e_commerce_usama_elgendy/app/config/fireBase_fun.dart';
import 'package:e_commerce_usama_elgendy/app/data/card_model.dart';
import 'package:get/get.dart';

class CardController extends GetxController {

  List<String> names = ["pesa" , "pesa", "pesa" , "pesa", "pesa" , "pesa"];
  List<String> images = ["assets/images/Image.png", "assets/images/Image.png",
    "assets/images/Image.png", "assets/images/Image.png", "assets/images/Image.png",
    "assets/images/Image.png", ];
  List<String> prices = ["\$200" , "\$200" , "\$200" , "\$200" , "\$200" , "\$200" , ];

  List<CardModel> _cardList = [] ;
  List<CardModel> get cardList => _cardList ;
  bool isLoading = false ;

  List<String> productIds = [] ;

  @override
  void onInit() {
    getCardFromFire();
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


  void addCardFromFire(String productId , String title , String price , String image ,)async{
    for (var product in cardList){
      productIds.add(product.id);
    }
    bool isExist = productIds.contains(productId);
    if (isExist == true){
      print(productIds);
      Get.back();
      Get.snackbar("Added failed", "Product already exist in card");
    }else {
      try{
        await FireBaseFun.addToCardFireStore(CardModel(
            price: price,
            title: title,
            image: image,
            quantity: 1),
            productId ,).then((value) {
          print("added");
          Get.back();
          Get.snackbar("Added success", "Product added to card");
        });
      }catch (e){
        rethrow ;
      }
    }
    update();
  }

  void getCardFromFire ()async{
   isLoading = true ;
   print("cardList");
    await FireBaseFun.getCardFromFireBase().then((value) {
      _cardList = value ;
      print(value);
    });
   isLoading = false ;
   update();
  }

  void deleteProductFromFire (String productId) async {
    await FireBaseFun.deleteProductFromCard(productId).then((value) {
      Get.back();
      Get.snackbar("deleted success", "Product deleted to card");
    });
  }

  void increaseCount (int index )async{
    cardList[index].quantity ++ ;
    update();
  }
  void decreaseCount (int index){
    if (cardList[index].quantity > 1){
      cardList[index].quantity -- ;
    }
    update();
  }


  int sumPrice(List<CardModel> list){
    int sum = 0 ;
    for(var item in list){
      sum += int.parse(item.price);
    }
    return sum ;
  }
}
