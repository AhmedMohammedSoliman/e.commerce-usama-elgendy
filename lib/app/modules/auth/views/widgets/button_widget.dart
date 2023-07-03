import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buttonWidget ({void Function()? onPressed , String text = "" ,Color textColor = Colors.white,
Color backGround = Colors.green , Color border = Colors.transparent}){
  return ElevatedButton(onPressed: onPressed, child: Text(text,
  style: TextStyle(color: textColor),) ,
  style: ElevatedButton.styleFrom(
    backgroundColor: backGround ,side: BorderSide(
    color: border ,
    width: 0.5
  )
  ),);
}