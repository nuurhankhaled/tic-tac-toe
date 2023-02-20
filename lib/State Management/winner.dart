
import 'package:tictactoe/State%20Management/statemanagement.dart';

import '../scaffolds/gamescreen.dart';

class Check {
  // bool winnerCheck(
  //     String player, int index, List<int> scoreboard, int gridSize) {
  //   //first let's declare the row and col
  //   int row = index ~/ 3;
  //   int col = index % 3;
  //   int score = player == "X" ? 1 : -1;
  //
  //   scoreboard[row] += score;
  //   scoreboard[gridSize + col] += score;
  //   if (row == col) scoreboard[2 * gridSize] += score;
  //   if (gridSize - 1 - col == row) scoreboard[2 * gridSize + 1] += score;
  //
  //   //checking if we have 3 or -3 in the score board
  //   if (scoreboard.contains(3) || scoreboard.contains(-3)) {
  //     return true;
  //   }
  //   ;
  //   //by default it will return false
  //   return false;
  // }
  String? checkWinner() {



    // Checking rows
    if (displayElement[0]['image'] == displayElement[1]['image'] &&
        displayElement[0]['image'] == displayElement[2]['image'] &&
        displayElement[0]['image'] != '') {

      return (displayElement[0]['image']);
    }
    if (displayElement[3]['image'] == displayElement[4]['image'] &&
        displayElement[3]['image'] == displayElement[5]['image'] &&
        displayElement[3] != '') {
      return (displayElement[3]['image']);
    }
    if (displayElement[6]['image'] == displayElement[7]['image'] &&
        displayElement[6]['image']== displayElement[8]['image'] &&
        displayElement[6]['image'] != '') {
      return (displayElement[6]['image']);
    }

    // Checking Column
    if (displayElement[0]['image'] == displayElement[3]['image'] &&
        displayElement[0]['image'] == displayElement[6]['image'] &&
        displayElement[0]['image'] != '') {
      return (displayElement[0]['image']);
    }
    if (displayElement[1]['image'] == displayElement[4]['image'] &&
        displayElement[1]['image'] == displayElement[7]['image'] &&
        displayElement[1]['image'] != '') {
      return (displayElement[1]['image']);
    }
    if (displayElement[2]['image'] == displayElement[5]['image'] &&
        displayElement[2]['image'] == displayElement[8]['image'] &&
        displayElement[2]['image'] != '') {
      return (displayElement[2]['image']);
    }

    // Checking Diagonal
    if (displayElement[0]['image'] == displayElement[4]['image'] &&
        displayElement[0]['image'] == displayElement[8]['image'] &&
        displayElement[0]['image'] != '') {
      return (displayElement[0]['image']);
    }
    if(displayElement[2]['image'] == displayElement[4]['image'] &&
        displayElement[2]['image'] == displayElement[6]['image'] &&
        displayElement[2]['image'] != '') {
      return (displayElement[2]['image']);
    }

  }

}
