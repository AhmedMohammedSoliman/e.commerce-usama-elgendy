import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
typedef Validator = String? Function(String?)?;
typedef OnChanged = void Function(String)?;

class TextFieldWidget extends StatelessWidget{

  String hint;
  TextEditingController? controller ;
  Validator validator ;
  OnChanged onChanged ;
  TextFieldWidget ({required this.hint , required this.controller , required this.validator ,
  required this.onChanged});

@override
  Widget build(BuildContext context) {
return TextFormField(
  onChanged: onChanged,
  validator: validator,
  controller: controller,
  decoration: InputDecoration(
    border: UnderlineInputBorder() ,
    hintText: hint ,
  ),
);
  }

}
