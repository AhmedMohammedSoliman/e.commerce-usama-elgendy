import 'package:e_commerce_usama_elgendy/app/config/fireBase_fun.dart';
import 'package:e_commerce_usama_elgendy/app/data/category_model.dart';
import 'package:e_commerce_usama_elgendy/app/modules/auth/views/login_view.dart';
import 'package:e_commerce_usama_elgendy/app/modules/details/views/details_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../config/local_storage_prefs.dart';
import '../../auth/views/widgets/text_widget.dart';
import '../controllers/explore_controller.dart';

class ExploreView extends GetWidget<ExploreController> {
  const ExploreView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
   return Padding(
     padding: const EdgeInsets.all(8.0),
     child: ListView (
       children: [
         SizedBox(
           height: 40,
         ),
         GetBuilder(
            init: ExploreController(),
              builder: (controller){
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20) ,
                          color: Colors.grey.shade200
                      ),
                      child: TextFormField(
                        onChanged: (input){
                          controller.searchFun(input);
                        },
                        decoration: InputDecoration(
                            hintText: "Search",
                            border : InputBorder.none ,
                            prefixIcon: Icon(Icons.search , color: Colors.black,)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  InkWell(
                      onTap: ()async{
                        FirebaseAuth auth = FirebaseAuth.instance;
                        await GoogleSignIn().signOut();
                        await auth.signOut();
                        LocalStoragePrefs.deleteUserFromCache();
                        Get.offAll(LoginView());
                      },
                      child: Icon(Icons.logout , color: Colors.black87,))
                ],
              ) ;
              }),
         SizedBox(
           height: 40,
         ),
         Row(
           children: [
             textWidget(color: Colors.black , fontSize: 20 ,
                 fontWeight: FontWeight.bold , text: "Categories"),
           ],
         ) ,
         SizedBox(height: 20,),
         GetBuilder(
           init: ExploreController(),
           builder: (controller) {
             if (controller.isCategoryLoading){
               return const Center(child: CircularProgressIndicator(),);
             }else {
               return SizedBox(
                 height: MediaQuery.of(context).size.height*0.1,
                 child: ListView.separated(
                     scrollDirection: Axis.horizontal,
                     itemBuilder: (context , index) => Column(
                       children: [
                         Container(
                             height : MediaQuery.of(context).size.height*0.05,
                             child: Image.network(controller.categoryList[index].image),
                             width: 80),
                         Container(
                           child: Text(controller.categoryList[index].title),
                         ),
                       ],
                     ),
                     separatorBuilder: (context , index) => SizedBox(width: 10,),
                     itemCount: controller.categoryList.length),
               );
             }
           },
         ) ,
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             textWidget(color: Colors.black , fontSize: 20 ,
                 fontWeight: FontWeight.bold , text: "Best Selling"),

             textWidget(color: Colors.green , fontSize: 18 ,
                 fontWeight: FontWeight.bold , text: "See All"),
           ],
         ) ,
         SizedBox(height: 20,),
         GetBuilder<ExploreController>(
           init: ExploreController(),
           builder: (controller) {
             return controller.isBestLoading ? Center(child: CircularProgressIndicator(),)
               : Container(
               height: MediaQuery.of(context).size.height*0.4,
               child: ListView.separated(
                   scrollDirection: Axis.horizontal,
                   itemBuilder: (context , index) => InkWell(
                     onTap: (){
                       Get.to(DetailsView(bestProduct: controller.foundList[index],
                         index: index,));
                     },
                     child: Column(
                       children: [
                         Container(
                             height: MediaQuery.of(context).size.height*0.3,
                             child: Image.network(controller.foundList[index].image)),
                         Container(
                           child: textWidget(text: controller.foundList[index].title ,
                               fontWeight: FontWeight.w600 , fontSize: 16 ,
                               color: Colors.black),
                         ),
                         Container(
                           child: textWidget(text: controller.foundList[index].description ,
                               fontWeight: FontWeight.normal , fontSize: 16 ,
                               color: Colors.grey),
                         ),
                         Container(
                           child: textWidget(text: "\$" + controller.foundList[index].price ,
                               fontWeight: FontWeight.bold , fontSize: 16 ,
                               color: Colors.green),
                         ),
                       ],
                     ),
                   ),
                   separatorBuilder: (context , index) => SizedBox(width: 10,),
                   itemCount: controller.foundList.length),
             );
           },
         ) ,
       ],
     ),
   );
  }
}