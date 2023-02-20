import 'package:flutter/material.dart';
import 'package:tictactoe/scaffolds/choosesign.dart';
import 'package:tictactoe/scaffolds/gamescreen.dart';
import 'package:tictactoe/widgets/custombutton.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({Key? key}) : super(key: key);
  var size, height, width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.yellow,
              Colors.deepOrange,
              Colors.pink,

            ]
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
               Padding(
                 padding:  EdgeInsets.only(top: height*0.05),
                 child: Text("Tic Tac Toe", style: TextStyle(fontFamily: "lab", fontSize: 45, color: Colors.white),),
               ),
                Padding(padding: EdgeInsets.only(top: height*0.07),
                child: Image.asset("images/xo.png", color: Colors.white, scale: 1.5,),
                ),
                Padding(padding:EdgeInsets.only(top: height*0.2, left: width*0.15, right: width*0.15),
                child : CustomButton("Single Player", Colors.white,
                    Colors.black, () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> GameScreen()));
                    }, 60, 50, 22),),
                Padding(padding:EdgeInsets.only(top: height*0.03, left: width*0.15, right: width*0.15),
                child : CustomButton("Multi Player", Colors.white,
                    Colors.black, () { }, 60, 50, 22),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
