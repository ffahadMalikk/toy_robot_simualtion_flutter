
import 'package:flutter/material.dart';
import 'package:toy_robot/Helpers/AppConstants.dart';
import 'package:toy_robot/Helpers/AppEnums.dart';
import 'package:toy_robot/Helpers/AppStrings.dart';
import 'package:toy_robot/Model/Robot.dart';
import 'package:toy_robot/Widgets/Table.dart';
import 'package:toy_robot/Widgets/alert_Box.dart';
import 'package:toy_robot/Widgets/app_button.dart';
import 'package:toy_robot/Widgets/command_textFiled.dart';

class TableScreen extends StatefulWidget {
  @override
  _TableScreenState createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  String faceText;
  TextEditingController xController = TextEditingController();
  TextEditingController yController = TextEditingController();

  int _x = -1;
  int _y = -1;
  Robot robot = Robot();
  void _performRobotAction(RobotMoves action){
    robot.robotMove(action,_x,_y);
    _refreshPage();
  }
  void _clearPlaceData(){
    // This Function will Clear the temp data once user has place robot to a specific point
    _x = -1;
    _y = -1;
    xController.text = "";
    yController.text = "";
    faceText = null;
    _refreshPage();
  }



  void _refreshPage(){
    // State will be refreshed
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('We Guide'),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: [
              // Main Table Board with blocks
              TableWidget(robot),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children:[
                    Expanded(
                      flex:1,
                      child: commandTextFiled(context, (value){
                        _x = int.tryParse(value) ?? -1;

                        //Validation for maximum and minimum limit for X Range
                        if (!robot.checkValueInRange(_x)){
                          _x =  -1;
                          xController.text = "";
                          showAlertDialog(context,title:AppStrings.invalidMove,message: AppStrings.allowedRange);
                        }
                      _refreshPage();
                  },hint: AppStrings.x,controller: xController),
                    ),
                    Expanded(
                      flex:1,
                      child: commandTextFiled(context, (value){
                        _y = int.tryParse(value) ?? -1;
                        //Validation for maximum and minimum limit for Y Range

                        if (!robot.checkValueInRange(_y)){
                          _y =  -1;
                          yController.text = "";
                          showAlertDialog(context,title:AppStrings.invalidMove,message: AppStrings.allowedRange);
                        }
                        _refreshPage();
                      },hint: AppStrings.y,controller: yController),

                    ),
                    Expanded(
                      flex: 1,
                      child: new DropdownButton<String>(
                        underline: Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                        value: faceText ,
                        hint: Text(AppStrings.facing),
                        isExpanded: true,
                        items: AppConstants.facesArray.map((String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          robot.setRobotFace(value);
                          faceText = value;
                          _refreshPage();
                        },
                      ),
                    ),
                ]
                ),
              ),
              appButton(context,AppStrings.place,(){
                _performRobotAction(RobotMoves.Place);
                _clearPlaceData();
              },isEnable: robot.allowPlace(_x,_y)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: appButton(context,AppStrings.left,(){
                      _performRobotAction(RobotMoves.Left);
                    },isEnable: robot.checkIfRobotPlaced()),
                  ),
                  Expanded(
                    child: appButton(context,AppStrings.right,(){
                      _performRobotAction(RobotMoves.Right);
                    },isEnable: robot.checkIfRobotPlaced()),
                  ),
                ],
              ),
              appButton(context,AppStrings.move,(){
                if (robot.checkIfMoveAllowed()) {
                  _performRobotAction(RobotMoves.Move);
                }else{
                  showAlertDialog(context,title:AppStrings.invalidMove,message: "");
                }
              },isEnable: robot.checkIfRobotPlaced()),
              appButton(context,AppStrings.report,(){
                showAlertDialog(context,title:AppStrings.report,message: "X: ${robot.x}\nY: ${robot.y}\nCurrent Face: ${AppConstants.facesArray[robot.currentFace.index]}");
              },isEnable: robot.checkIfRobotPlaced()),
            ],
        ),
      ),
    );
  }
}
