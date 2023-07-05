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
  int count = 1 ;

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

  void getCardFromFire ()async{
   isLoading = true ;
    await FireBaseFun.getCardFromFireBase().then((value) {
      _cardList = value ;
      print(value);
    });
   isLoading = false ;
   update();
  }

  void increaseCount (){
    count ++ ;
    update();
  }
  void decreaseCount (){
    if (count > 1){
      count -- ;
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
