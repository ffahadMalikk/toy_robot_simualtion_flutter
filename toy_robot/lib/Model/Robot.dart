
import 'package:toy_robot/Helpers/AppConstants.dart';
import 'package:toy_robot/Helpers/AppEnums.dart';

class Robot{

  var x = -1;
  var y = -1;
  RobotFace currentFace = RobotFace.NotSet;
  RobotFace poleFace = RobotFace.NotSet;

  bool checkIfCurrentPosition(int index){
    return index == (x*5) + y;
  }
  bool checkIfRobotPlaced(){
    //This Function will restrict users to perform any other task before placing a  roboto on table

    return (x >= 0 && y >= 0);
  }
  bool allowPlace(int x,int y){
    //Handling of enable disable state of Place button on UI

    return (x >= 0 && y >= 0 && x < 5 && y < 5 && poleFace != RobotFace.NotSet);
  }
  bool checkValueInRange(int val){
    //Validation for range

    return val >= 0 && val < 5;
  }
  void robotMove(RobotMoves action,int tempX,int tempY){
    //Take USer action and call respective functions

    switch (action){
      case RobotMoves.Place:
        _setRobotWithValues(tempX,tempY);
        break;
      case RobotMoves.Left:
        _changeRobotFaceRotation(-1);
        break;
      case RobotMoves.Right:
        _changeRobotFaceRotation(1);
        break;
      case RobotMoves.Move:
        _moveRobot();
        break;
    }
  }

  void _moveRobot(){
    //A valid move will set new values to robot
    var moves = _calculateMoves();
    this.x = moves[0];
    this.y = moves[1];
  }

  void _changeRobotFaceRotation(int value){
    //Handling Left Right action from user by setting condition base circular effect

    var index = this.currentFace.index + value;
    if (index == -1){
      index = 3;
    }else if (index == 4){
      index = 0;
    }
    this.currentFace = AppConstants.robotFaces[index];
  }

  List<int> _calculateMoves(){
    //Calculates if the new ranges for move.

    var newX = x;
    var newY = y;
    switch (currentFace){
      case RobotFace.North:
        newX -= 1;
        break;
      case RobotFace.East:
        newY += 1;
        break;
      case RobotFace.South:
        newX += 1;
        break;
      case RobotFace.West:
        newY -= 1;
        break;
    }
    return [newX,newY];
  }
  bool checkIfMoveAllowed(){
    //Checks if the new move is valid or not

    var moves = _calculateMoves();
    return (moves[0] >= 0 && moves[0] < 5 && moves[1] >= 0 && moves[1] < 5);
  }
  void _setRobotWithValues(int x,int y){
    //Will Set place values for robot on board

    this.x = x;
    this.y = y;
    currentFace = poleFace;
    poleFace = RobotFace.NotSet;
  }

  int getFaceRotationValue(){
    //returns the angle for rotation of robot
    return currentFace.index * 90;
  }
  void setRobotFace(String text){
    //Initialize Robot face for place and  then for user actions.

    switch (text){
      case "North":
        this.poleFace = RobotFace.North;
        break;
      case "East":
        this.poleFace = RobotFace.East;
        break;
      case "West":
        this.poleFace = RobotFace.West;
        break;
      case "South":
        this.poleFace = RobotFace.South;
        break;
    }
  }
}