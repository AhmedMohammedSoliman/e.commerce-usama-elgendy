import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../auth/views/widgets/text_widget.dart';
import '../controllers/card_controller.dart';

class CardView extends GetView<CardController> {
  const CardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          text: "Total Price" ,
                          color: Color(0xff929292),
                          fontSize: 12,
                          fontWeight: FontWeight.normal
                      ),
                    GetBuilder(
                      init: CardController(),
                        builder: (controller){
                        return textWidget(
                            text: "\$" + "${controller.sumPrice(controller.cardList)}" ,
                            color: Colors.green,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        );
                        })
                    ],
                  ),
                ) ,

                Expanded(
                  child: Container(
                    height: 50,
                    width: 150,
                    child: ElevatedButton(onPressed: (){

                    }, child: textWidget(
                      fontWeight: FontWeight.bold ,
                      fontSize: 14 ,
                      color: Colors.white ,
                      text: "CHECKOUT" ,
                    ) , style: ElevatedButton.styleFrom(backgroundColor: Colors.green),),
                  ),
                )
              ],
            ),
          )
        ],
      body: GetBuilder(
        init: CardController(),
        builder: (controller) => Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20 , horizontal: 20),
                child: ListView.separated(
                    itemBuilder:  (context , index) => Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration (
                        color: Colors.white ,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 2
                          )
                        ]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.network(controller.cardList[index].image , height: MediaQuery.of(context)
                            .size.height*0.2,) ,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              textWidget(
                                text: controller.cardList[index].title,
                                color: Colors.black ,
                                fontSize: 16 ,
                                fontWeight: FontWeight.w400
                              ),
                              SizedBox(height: 10,),
                              textWidget(
                                  text: "\$" + controller.cardList[index].price,
                                  color: Colors.green ,
                                  fontSize: 16 ,
                                  fontWeight: FontWeight.bold
                              ),
                              SizedBox(height: 10,),
                              Container(
                                color: Colors.grey.shade300,
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap :(){
                                        controller.increaseCount();
                                        },
                                  child: Icon(Icons.add , color: Colors.black,)),
                                    SizedBox(width: 10,),
                                    textWidget(
                                        text: "${controller.count}",
                                        color: Colors.black ,
                                        fontSize: 16 ,
                                        fontWeight: FontWeight.bold
                                    ),
                                    SizedBox(width: 10,),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 10),
                                      child: InkWell(
                                          onTap :(){
                                            controller.decreaseCount();
                                          },
                                          child: Icon(Icons.minimize , color: Colors.black,)),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    separatorBuilder: (context , index) => SizedBox(height: 20,),
                    itemCount: controller.cardList.length),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
