import 'package:e_commerce_usama_elgendy/app/data/best_products_model.dart';
import 'package:e_commerce_usama_elgendy/app/data/card_model.dart';
import 'package:e_commerce_usama_elgendy/app/modules/auth/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../card/controllers/card_controller.dart';
import '../controllers/details_controller.dart';

class DetailsView extends GetView<DetailsController> {
  BestProductsModel bestProduct ;
  int index ;

  DetailsView({Key? key , required this.bestProduct , required this.index}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Scaffold(
        persistentFooterButtons: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textWidget(
                        text: "Price" ,
                        color: Color(0xff929292),
                        fontSize: 12,
                        fontWeight: FontWeight.normal
                      ),
                      textWidget(
                          text: "\$" + bestProduct.price ,
                          color: Colors.green,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ],
                  ),
                ) ,
                GetBuilder(
                  init: CardController(),
                    builder: (controller){
                    return Expanded(
                      child: Container(
                        height: 50,
                        width: 150,
                        child: ElevatedButton(onPressed: (){
                          controller.addCardFromFire(
                              bestProduct.id,
                              bestProduct.title,
                              bestProduct.price,
                              bestProduct.image ,
                             );
                        }, child: textWidget(
                          fontWeight: FontWeight.bold ,
                          fontSize: 14 ,
                          color: Colors.white ,
                          text: "ADD" ,
                        ) , style: ElevatedButton.styleFrom(backgroundColor: Colors.green),),
                      ),
                    );
                    })
              ],
            ),
          )
        ],
        body: Column (
          children: [
              Image.network(bestProduct.image , width: double.infinity, height:
                MediaQuery.of(context).size.height*0.3, fit: BoxFit.fill,),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  textWidget(
                    color: Colors.black ,
                    fontSize: 26 ,
                    fontWeight: FontWeight.bold,
                    text: bestProduct.title
                  ),
                ],
              ),
            ) ,
            SizedBox(height: 20,),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20) ,
            child: Row (
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey)
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: textWidget(
                              color: Colors.black ,
                              fontSize: 14 ,
                              fontWeight: FontWeight.normal,
                              text: "Size"
                          ),
                        ),
                        SizedBox(width: 20,),
                        Expanded(
                          child: textWidget(
                              color: Colors.black ,
                              fontSize: 14 ,
                              fontWeight: FontWeight.bold,
                              text: bestProduct.size
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey)
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: textWidget(
                              color: Colors.black ,
                              fontSize: 14 ,
                              fontWeight: FontWeight.normal,
                              text: "Color"
                          ),
                        ),
                        SizedBox(width: 20,),
                        Expanded(
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(int.parse(bestProduct.color))
                            ),
                          )
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            ),
             SizedBox(height: 20,),
             Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20),
             child: Row(
             children: [
             textWidget(
                color: Colors.black ,
                fontSize: 18 ,
                fontWeight: FontWeight.bold,
                text: "Details"
            ),
          ],
          )),
            SizedBox(height: 20,),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: textWidget(
                          color: Colors.black ,
                          fontSize: 14 ,
                          height: 2.5,
                          fontWeight: FontWeight.normal,
                          text: bestProduct.details
                      ),
                    ),
                  ],
                )),
          ],
        )
      ),
    );
  }
}
