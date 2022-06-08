import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../control/x_o_controller.dart';

class PlayBoard extends StatelessWidget {
  const PlayBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top);
    final double width = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top);
    XOController controller = Get.find();

    GestureDetector square(int index) {
      return GestureDetector(
        child: Container(
          color: Colors.black,
          child: FittedBox(
            alignment: Alignment.center,
            fit: BoxFit.fitHeight,
            child: controller.displayTheChoice(index),

          ),
        ),
        onTap: () {
          if (controller.isPressed[index] == true) {
            return;
          }
          controller.isPressed[index] = true;
          controller.squareValues[index] = controller.x ? "X" : "O";
          controller.counter++;
          controller.checkWinner();
          controller.changePlayer();
        },
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            height: height * 0.8,
            width: width * 0.8,
            margin: EdgeInsets.all(width * 0.05),
            // color: Colors.black,
            child: LayoutBuilder(
              builder: (ctx, constraints) => GetBuilder<XOController>(
                builder: (_) => GridView(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: (constraints.maxWidth -
                            2 * constraints.maxHeight * 0.025) /
                        3,
                    childAspectRatio: 1,
                    crossAxisSpacing: constraints.maxHeight * 0.025,
                    mainAxisSpacing: constraints.maxHeight * 0.025,
                  ),
                  children: [
                    square(1),
                    square(2),
                    square(3),
                    square(4),
                    square(5),
                    square(6),
                    square(7),
                    square(8),
                    square(9),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
