import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeScaffold extends StatefulWidget {
  const HomeScaffold({Key? key}) : super(key: key);


  @override
  State<HomeScaffold> createState() => _HomeScaffoldState();
}

class _HomeScaffoldState extends State<HomeScaffold> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
        builder: (controller) {
        return SafeArea(
            child: Scaffold(
              bottomNavigationBar: BottomNavigationBar (
                selectedItemColor: Colors.green,
                currentIndex: controller.selectedIndex.value,
                onTap: (index){
                  controller.selectedIndex.value = index ;
                  setState(() {
                  });
                },
                items: [
                  BottomNavigationBarItem(
                      activeIcon: Text ("Explore"),
                      icon: Icon(Icons.explore) , label: "") ,
                  BottomNavigationBarItem(
                      activeIcon: Text ("Card"),
                      icon: Icon(Icons.shopping_cart_outlined) , label: "") ,
                  BottomNavigationBarItem(
                      activeIcon: Text ("Person"),
                      icon: Icon(Icons.person) , label: "") ,
                ],
              ),
              body: controller.tabsList.value[controller.selectedIndex.value],
            ));
        });
  }
}
