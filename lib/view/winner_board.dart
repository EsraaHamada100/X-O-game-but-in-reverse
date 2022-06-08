import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:x_o_game/control/x_o_controller.dart';
import 'package:x_o_game/view/home_page.dart';
import 'package:x_o_game/view/play_board.dart';

class WinnerBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    XOController controller = Get.find();
    final double height = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top);
    final double width = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top);
    return Scaffold(
      body: Container(
        color: Colors.black,
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(width * 0.05),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  controller.winner != ""
                      ? "The winner is ${controller.winner}"
                      : "There is no winner :)",
                  style: TextStyle(color: Colors.white, fontSize: width * 0.1),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.2,
            ),
            Container(
              width: width*0.6,
              height: height*0.5,
              margin: EdgeInsets.symmetric(horizontal :width*0.05),
              child: GridView(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: width*0.15,
                  childAspectRatio: 2,
                  crossAxisSpacing: width*0.15,
                  mainAxisSpacing: width*0.05,
                ),
                children: [
                  ElevatedButton.icon(
                    label: FittedBox(fit: BoxFit.fill, child: Text("Home")),
                    icon: Icon(Icons.home,size: width*0.05,),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.teal),
                      fixedSize: MaterialStateProperty.all(
                          Size(width * 0.3, width * 0.1)),
                      textStyle: MaterialStateProperty.all(TextStyle(fontSize: width*0.05)),

                    ),

                    onPressed: () {
                      for (int i = 1; i < 10; i++) {
                        controller.isPressed[i] = false;
                        controller.squareValues[i] = "";
                      }
                      controller.setWinner("");
                      controller.counter = 0;
                      Get.off(HomePage());
                    },
                  ),
                  ElevatedButton.icon(
                    label: FittedBox(fit: BoxFit.fill, child: Text("Retry")),
                    icon: Icon(Icons.refresh,size: width*0.05,),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.teal),
                      fixedSize: MaterialStateProperty.all(
                          Size(width * 0.3, width * 0.1)),
                      textStyle: MaterialStateProperty.all(TextStyle(fontSize: width*0.05)),

                    ),

                    onPressed: () {
                      for (int i = 1; i < 10; i++) {
                        controller.isPressed[i] = false;
                        controller.squareValues[i] = "";
                      }
                      controller.setWinner("");
                      controller.counter = 0;
                      Get.off(PlayBoard());
                    },
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
