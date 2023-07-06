import 'package:e_commerce_usama_elgendy/app/config/fireBase_fun.dart';
import 'package:e_commerce_usama_elgendy/app/data/best_products_model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../data/category_model.dart';


class ExploreController extends GetxController {

  List <String> names = ["men" , "women", "ahmed" , "ahmed"];

   List<CategoryModel> _categoryList = [];

  List<CategoryModel> get categoryList => _categoryList ;

  List<BestProductsModel> _bestProductsList = [] ;

  List<BestProductsModel> get bestProductsList => _bestProductsList ;

  List<BestProductsModel> _foundList = [] ;

  List<BestProductsModel> get foundList => _foundList ;

  bool isCategoryLoading = false ;
  bool isBestLoading = false ;

  @override
  void onInit() {
    // final newVersion = NewVersion(
    //     androidId: "com.snapShat.android"
    // );
    // Timer(Duration (seconds: 1) , () => checkNewVersion(newVersion),);
    getCategoriesFromFireStore();
    getBestProductsFromFireStore();
    print(_foundList);
    super.onInit();
  }

  // void checkNewVersion (NewVersion newVersion)async {
  //   final status = await newVersion.getVersionStatus();
  //   if (status != null){
  //     newVersion.showUpdateDialog(
  //         context: Get.context!,
  //         versionStatus: status ,
  //         updateButtonText: "Update" ,
  //     dismissButtonText: "Skip" ,
  //     dialogTitle: "Update !!" ,
  //     dialogText: "New version is available on store ${status.storeVersion}");
  //   }
  // }

  void getCategoriesFromFireStore ()async{
    isCategoryLoading = true ;
     await FireBaseFun.getCategoriesFromFire().then((category) {
       print(category);
       _categoryList = category ;
     });
     isCategoryLoading = false ;
     update();
  }

  void getBestProductsFromFireStore() async {
    isBestLoading = true ;
    await FireBaseFun.getBestProductsFromFire().then((bestProduct){
      print(bestProduct);
      _bestProductsList = bestProduct ;
      _foundList = _bestProductsList;
    });
    isBestLoading = false ;
    update();
  }

  void searchFun (String input){
   List <BestProductsModel> results = [] ;
    if (input.isEmpty){
      results = _bestProductsList ;
    }else {
      results = _bestProductsList.where((product) => product.title.toLowerCase().
      contains(input.toLowerCase())).toList();
    }
    _foundList = results ;
    print(results);
    update();
  }

}