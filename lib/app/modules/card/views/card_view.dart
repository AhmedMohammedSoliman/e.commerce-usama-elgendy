import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../auth/views/widgets/text_widget.dart';
import '../controllers/card_controller.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


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
                child: controller.cardList.isEmpty ?
                Center(child: Column (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.list , color: Colors.black,),
                    SizedBox(height: 10,),
                    textWidget(
                      text: "Card is Empty",
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600
                    )
                  ],
                ),) : ListView.separated(
                    itemBuilder:  (context , index) => Slidable(
                      key: const ValueKey(0),
                      startActionPane: ActionPane(
                        // A motion is a widget used to control how the pane animates.
                        motion: const ScrollMotion(),
                        // A pane can dismiss the Slidable.
                        dismissible: DismissiblePane(onDismissed: () {}),
                        // All actions are defined in the children parameter.
                        children: [
                          // A SlidableAction can have an icon and/or a label.
                           SlidableAction(
                            onPressed: (context)async{
                             await showDialog(
                                 context: context,
                                 builder: (context) => SizedBox(
                                   width: 100,
                                   height: 100,
                                   child: AlertDialog(
                                    content: Text("Do you want to delete this product from card ? "),
                                     actions: [
                                       TextButton(onPressed: (){
                                          controller.deleteProductFromFire(controller.cardList[index].id);
                                       }, child: textWidget(
                                         text: "Delete" ,
                                         color: Colors.red
                                       ),

                                       ),
                                       TextButton(onPressed: (){
                                         Get.back();
                                       }, child: textWidget(
                                           text: "Cancel" ,
                                           color: Colors.blue
                                       ),

                                       ),

                                     ],
                                   ),
                                 ));
                            },
                            backgroundColor: Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ],
                      ),
                      child: Container(
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
                                          controller.increaseCount(index ,);
                                          },
                                    child: Icon(Icons.add , color: Colors.black,)),
                                      SizedBox(width: 10,),
                                      textWidget(
                                          text: "${controller.cardList[index].quantity}",
                                          color: Colors.black ,
                                          fontSize: 16 ,
                                          fontWeight: FontWeight.bold
                                      ),
                                      SizedBox(width: 10,),
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 10),
                                        child: InkWell(
                                            onTap :(){
                                              controller.decreaseCount(index);
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
