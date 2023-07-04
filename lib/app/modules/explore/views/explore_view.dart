import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_usama_elgendy/app/config/fireBase_fun.dart';
import 'package:e_commerce_usama_elgendy/app/data/category_model.dart';
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
         Container(
           decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(20) ,
               color: Colors.grey.shade200
           ),
           child: TextFormField(
             decoration: InputDecoration(
                 border : InputBorder.none ,
                 prefixIcon: Icon(Icons.search , color: Colors.black,)
             ),
           ),
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
             return Container(
               height: MediaQuery.of(context).size.height*0.1,
               child: ListView.separated(
                   scrollDirection: Axis.horizontal,
                   itemBuilder: (context , index) => Column(
                     children: [
                       Container(
                           height : MediaQuery.of(context).size.height*0.05,
                           child: Image.asset(controller.names[index],
                               width: 80)),
                       Container(
                         child: Text(controller.names[index]),
                       ),
                     ],
                   ),
                   separatorBuilder: (context , index) => SizedBox(width: 10,),
                   itemCount: controller.names.length),
             );
           },
         ) ,
         Row(
           children: [
             textWidget(color: Colors.black , fontSize: 20 ,
                 fontWeight: FontWeight.bold , text: "Best Selling"),
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