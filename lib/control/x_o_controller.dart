import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:x_o_game/view/winner_board.dart';

class XOController extends GetxController {

  bool _x = true;
  bool get x => _x;
  bool onePlayer = false;
  // to count the number of filled squares
  int counter = 0 ;

  List _isPressed = new List<bool>.filled(10, false, growable: false);
  List __squareValues = new List<String>.filled(10, "", growable: false);
  List get squareValues => __squareValues;
  List get isPressed => _isPressed;
  late int choice;
  String _winner = "";
  String get winner => _winner;
  void setWinner(String winner){
    _winner = winner;
  }

  void changePlayer() {
    _x = !_x;
    if(onePlayer && counter != 9){
      // to get number from 1 to 9
      choice = Random().nextInt(8)+1;
      while(_isPressed[choice]){
        choice = Random().nextInt(8)+1;
      }

      _isPressed[choice] = true;
      __squareValues[choice] = _x?"X":"O" ;
      counter++;
      checkWinner();
      _x = !_x ;

    }
    update();
  }

  Text displayTheChoice(int index) {
    // we write is not x because he will change the player before displaying the
    // tapped square value
    return squareValues[index] == ""
        ? const Text("")
        : Text(
            squareValues[index],
            style: TextStyle(
              // fontSize: width*0.1,
              fontWeight: FontWeight.bold,
              color: squareValues[index] == "X" ? Colors.red : Colors.green,
            ),
          );
    // ? const Text(
    //     "X",
    //     style: TextStyle(color: Colors.red),
    //   )
    // : const Text("O", style: TextStyle(color: Colors.green));
  }

  void checkWinner() {
    if (__squareValues[1] == __squareValues[3] &&
        __squareValues[2] == __squareValues[3] &&
        __squareValues[1] != "") {
      _winner = __squareValues[1];

      Get.off(WinnerBoard());
    }
    if (__squareValues[4] == __squareValues[6] &&
        __squareValues[5] == __squareValues[6] &&
        __squareValues[4] != "") {
      _winner = __squareValues[4];

      Get.off(WinnerBoard());
    }
    if (__squareValues[7] == __squareValues[9] &&
        __squareValues[8] == __squareValues[9] &&
        __squareValues[7] != "") {
      _winner = __squareValues[7];

      Get.off(WinnerBoard());
    }
    if (__squareValues[1] == __squareValues[4] &&
        __squareValues[4] == __squareValues[7] &&
        __squareValues[1] != "") {
      _winner = __squareValues[1];

      Get.off(WinnerBoard());
    }
    if (__squareValues[2] == __squareValues[5] &&
        __squareValues[5] == __squareValues[8] &&
        __squareValues[2] != "") {
      _winner = __squareValues[2];

      Get.off(WinnerBoard());
    }
    if (__squareValues[3] == __squareValues[6] &&
        __squareValues[6] == __squareValues[9] &&
        __squareValues[3] != "") {
      _winner = __squareValues[3];

      Get.off(WinnerBoard());
    }
    if (__squareValues[1] == __squareValues[5] &&
        __squareValues[5] == __squareValues[9] &&
        __squareValues[1] != "") {
      _winner = __squareValues[1];

      Get.off(WinnerBoard());
    }
    if (__squareValues[3] == __squareValues[5] &&
        __squareValues[5] == __squareValues[7] &&
        __squareValues[3] != "") {

      _winner = __squareValues[3];

      Get.off(WinnerBoard());

    }

    for (int i = 1; i < 10; i++) {
      if (__squareValues[i] == "") {
        return;
      }
    }

    Get.off(WinnerBoard());
  }
}
