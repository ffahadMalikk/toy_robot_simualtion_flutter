
import 'package:flutter/material.dart';
import 'package:toy_robot/Helpers/AppStrings.dart';

Widget commandTextFiled(BuildContext context,Function onchange,{String hint,TextEditingController controller}){
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Container(
      height: 36,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(18))
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          onChanged: (value){
            onchange(value);
          },
          decoration: InputDecoration(
            hintText: hint,
          ),
        ),
      ),
    ),
  );


}