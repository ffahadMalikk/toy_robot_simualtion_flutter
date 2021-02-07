
import 'package:flutter/material.dart';


Widget appButton(BuildContext context,String title,Function onnTap,{bool isEnable = false}){
  return InkWell(
    onTap: (){
      isEnable ?onnTap():print('Do Nothing');
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,

        decoration: BoxDecoration(
          color: isEnable ? Colors.blueAccent:Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(8))
        ),
        child: Center(
          child: Text(title,
            style: TextStyle(
              fontSize: 19,
              color: Colors.white
            ),),
        ),
      ),
    ),
  );

}