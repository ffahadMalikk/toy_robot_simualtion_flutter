# toy_robot_simualtion_flutter
A toy robot Simulation which moves robot on table without falling it on ground and you can get report about toy position at any time.

## Getting Started
Application built on flutter using dart so it will work on both iOS and android platform.

### Prerequisite
1- Android Studio or any other editor for dart.
2- FLutter must be installed and SDK path must be setUp for installation please check https://flutter.dev/docs/get-started/install.
4- Open terminal and go to any of your project directory
5- Write Command flutter create "toy_robot"
6- Copy and replace all these files within your project.
7- Open main application folder in any Compiler and run the application. (you can run it either on device or on simulator).


## About App

The application is a simulation of a toy robot moving on a square tabletop, of
dimensions 5 units x 5 units.
● There are no other obstructions on the table surface.
● The robot is free to roam around the surface of the table, but must be prevented from
falling to destruction. Any movement that would result in the robot falling from the
table must be prevented, however further valid movement commands must still be
allowed.
● Create an application that can read in commands of the following form:
○ PLACE X,Y,F
○ MOVE
○ LEFT
○ RIGHT
○ REPORT
● PLACE will put the toy robot on the table in position X,Y and facing NORTH, SOUTH,
EAST or WEST.
● The origin (0,0) can be considered to be the SOUTH WEST most corner.
● The first valid command to the robot is a PLACE command, after that, any sequence
of commands may be issued, in any order, including another PLACE command. The
application should discard all commands in the sequence until a valid PLACE
command has been executed.
● MOVE will move the toy robot one unit forward in the direction it is currently facing.
● LEFT and RIGHT will rotate the robot 90 degrees in the specified direction without
changing the position of the robot.
● REPORT will announce the X,Y and F of the robot. This can be in any form, but
standard output is sufficient.
● A robot that is not on the table can choose the ignore the MOVE, LEFT, RIGHT and
REPORT commands.




