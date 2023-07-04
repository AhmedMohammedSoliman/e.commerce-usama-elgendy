import 'package:e_commerce_usama_elgendy/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigatorWidget extends StatefulWidget {
   BottomNavigatorWidget({Key? key}) : super(key: key);

  HomeController controller = Get.find();

  @override
  State<BottomNavigatorWidget> createState() => _State();
}

class _State extends State<BottomNavigatorWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar (
      selectedItemColor: Colors.green,
      currentIndex: widget.controller.selectedIndex.value,
      onTap: (index){
        widget.controller.selectedIndex.value = index ;
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
    );
  }
}
