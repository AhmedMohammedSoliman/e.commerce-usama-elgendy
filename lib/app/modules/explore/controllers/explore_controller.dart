import 'package:e_commerce_usama_elgendy/app/config/fireBase_fun.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../data/category_model.dart';

class ExploreController extends GetxController {

  List <String> names = ["men" , "women", "ahmed" , "ahmed"];

   List<CategoryModel> _categoryList = [];

  List<CategoryModel> get categoryList => _categoryList ;

  void getCategoriesFromFireStore ()async{
     await FireBaseFun.getCategoriesFromFire().then((category) {
       print(category);
       _categoryList = category ;
     });
  }
  @override
  void onInit() {
    getCategoriesFromFireStore();
    super.onInit();
  }

}