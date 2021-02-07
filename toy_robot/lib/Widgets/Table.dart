import 'package:flutter/material.dart';
import 'package:toy_robot/Model/Robot.dart';

class TableWidget extends StatelessWidget {
  final Robot robot;
  TableWidget(this.robot);
  Widget tablePosition(BuildContext context,int index,Robot robot){
    return InkWell(
      onTap: (){
        //Navigator.pushNamed(context);
      },
      child: Container(
        height: ((MediaQuery.of(context).size.width)/5),
        width: ((MediaQuery.of(context).size.width)/5),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white,width: 1),
           // borderRadius: BorderRadius.all(Radius.circular(5)),
            color: index%2 == 0 ? Colors.grey:Colors.black,

        ),
        child: robot.checkIfCurrentPosition(index) ? Center(
          child:
          new RotationTransition(
            turns: new AlwaysStoppedAnimation(robot.getFaceRotationValue()/ 360),
            child: Image(
              image: AssetImage("images/bot.png"),
            ),
          )
        ):Container(height: 1,width: 1,),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ((MediaQuery.of(context).size.width)),
      width: ((MediaQuery.of(context).size.width)),
      child:  IgnorePointer(
        child: GridView.count(
          shrinkWrap: true,
//        mainAxisSpacing: 20,
//        crossAxisSpacing: 20,
          crossAxisCount: 5,
          children: List.generate(25, (index) {
            return Center(
              child: tablePosition(context,index,robot),
            );
          }),
        ),
      ),

    );
  }
}
