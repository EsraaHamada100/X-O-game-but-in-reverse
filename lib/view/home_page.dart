import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../control/x_o_controller.dart';
import 'play_board.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _height = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top) ;
    double _width = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top) ;

    XOController controller = Get.put(XOController());
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment,
            children: [
              ElevatedButton.icon(
                onPressed: (){
                  controller.onePlayer = true;
                  Get.to(PlayBoard());
                },
                icon: const Icon(Icons.person),
                label: const Text("One player"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  fixedSize: MaterialStateProperty.all(Size(_width*0.3, _height*0.09)),
                ),
              ),

              SizedBox(height: _height*0.1),
              ElevatedButton.icon(
                onPressed: (){

                  Get.off(PlayBoard());
                },
                icon: const Icon(Icons.people),
                label: const Text("Two players"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  fixedSize: MaterialStateProperty.all(Size(_width*0.3, _height*0.09)),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
