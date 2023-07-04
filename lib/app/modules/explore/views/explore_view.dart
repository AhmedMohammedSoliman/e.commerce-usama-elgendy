import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_usama_elgendy/app/config/fireBase_fun.dart';
import 'package:e_commerce_usama_elgendy/app/data/category_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../auth/views/widgets/text_widget.dart';
import '../controllers/explore_controller.dart';

class ExploreView extends GetWidget<ExploreController> {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Padding(
     padding: const EdgeInsets.all(8.0),
     child: Column (
       children: [
         SizedBox(
           height: 40,
         ),
         Row(
           children: [
             Expanded(
               child: Container(
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(20) ,
                     color: Colors.grey.shade200
                 ),
                 child: TextFormField(
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
                 await auth.signOut();
               },
                 child: Icon(Icons.logout , color: Colors.black87,))
           ],
         ) ,
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
             if (controller.isLoading){
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
         GetBuilder(
           init: ExploreController(),
           builder: (controller) {
             return Expanded(
               child: ListView.separated(
                   scrollDirection: Axis.horizontal,
                   itemBuilder: (context , index) => Column(
                     children: [
                       Container(
                           height: MediaQuery.of(context).size.height*0.3,
                           child: Image.asset("assets/images/Image.png")),
                       Container(
                         child: textWidget(text: "BeoPlay Speaker" ,
                             fontWeight: FontWeight.w600 , fontSize: 16 ,
                             color: Colors.black),
                       ),
                       Container(
                         child: textWidget(text: "Bang and Olufsen" ,
                             fontWeight: FontWeight.normal , fontSize: 16 ,
                             color: Colors.grey),
                       ),
                       Container(
                         child: textWidget(text: "\$755" ,
                             fontWeight: FontWeight.bold , fontSize: 16 ,
                             color: Colors.green),
                       ),
                     ],
                   ),
                   separatorBuilder: (context , index) => SizedBox(width: 10,),
                   itemCount: controller.names.length),
             );
           },
         ) ,
       ],
     ),
   );
  }
}