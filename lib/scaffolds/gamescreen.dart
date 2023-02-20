import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tictactoe/State%20Management/winner.dart';

import '../State Management/statemanagement.dart';

bool isPlayer = true;
int filledBoxes = 0;
var displayElement = [
  {
    "image": "",
  },
  {
    "image": '',
  },
  {
    "image": '',
  },
  {
    "image": '',
  },
  {
    "image": '',
  },
  {
    "image": '',
  },
  {
    "image": '',
  },
  {
    "image": '',
  },
  {
    "image": '',
  },
];
List<int> listOfPlayerX = [];
List<int> listOfPlayerO = [];
int cont = 0;

class GameScreen extends StatelessWidget {
  GameScreen({Key? key}) : super(key: key);
  MyBlock test = MyBlock();
  String ex = "images/X.png";
  String o = "images/O.png";

  String? check;
  dynamic xORo;
  List<List> winner = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) {
            return test;
          },
          child: Builder(
            builder: (context2) {
              dynamic bloc = BlocProvider.of<MyBlock>(context2);
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0, left: 20.0),
                    child: Row(
                      children: [
                        Container(
                          width: 80,
                          height: 40,
                          decoration: BoxDecoration(boxShadow: const [
                            BoxShadow(
                              color: Colors.black38,
                              blurRadius: 20,
                              spreadRadius: 1.0,
                            )
                          ], borderRadius: BorderRadius.circular(50.0)),
                          child: Container(
                            width: 80,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: BlocBuilder<MyBlock, MyBlockState>(
                                builder: (context3, state) {
                              return Center(
                                  child: Text(
                                countX.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ));
                            }
                                //Center(child: Text('0', style:TextStyle(fontWeight: FontWeight.bold, fontSize: 20) ,)),
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 170.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Image.asset(
                                  'images/X.png',
                                  color: Colors.black,
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                              const Text('Player',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 100.0, bottom: 90),
                    child: Container(
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 10.0,
                          spreadRadius: 2.0,
                        ),
                      ]),
                      width: 350,
                      height: 350,
                      child: GridView.builder(
                        padding: const EdgeInsets.all(10),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 1.0,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10),
                        itemCount: 9,
                        itemBuilder: (context, i) => SizedBox(
                            child: MaterialButton(
                          color: Colors.white,
                          child: BlocBuilder<MyBlock, MyBlockState>(
                              builder: (context3, state) {
                            return Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(testttttttt[i]["image"]!),
                              )),
                            );
                          }),
                          onPressed: () {
                            if (isPlayer == true) {
                              listOfPlayerX.add(i);
                              displayElement[i]['image'] = ex;
                              bloc.add(MyBlockEvent('PlayerX', i));
                              check = Check().checkWinner();
                              filledBoxes++;
                              if (check == ex) {
                                bloc.add(MyBlockEvent("X", 0));
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    content: const Text(
                                      "Winner is X!",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          bloc.add(MyBlockEvent('Reset', 0));
                                          Navigator.of(ctx).pop();
                                        },
                                        child: Container(
                                          color: Colors.deepOrange,
                                          padding: const EdgeInsets.all(14),
                                          child: const Text(
                                            "Reset",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          exit(1);
                                        },
                                        child: Container(
                                          color: Colors.green,
                                          padding: const EdgeInsets.all(14),
                                          child: const Text(
                                            "Exit",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else if (filledBoxes == 9) {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    content: const Text("It's a Tie!!",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700)),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          bloc.add(MyBlockEvent('Reset', 0));
                                          Navigator.of(ctx).pop();
                                        },
                                        child: Container(
                                          color: Colors.deepOrange,
                                          padding: const EdgeInsets.all(14),
                                          child: const Text("Reset",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          exit(1);
                                        },
                                        child: Container(
                                          color: Colors.green,
                                          padding: const EdgeInsets.all(14),
                                          child: const Text("Exit",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                              cont++;
                              var intValue = Random().nextInt(8);
                              while (testttttttt[intValue]["image"]! != '' &&
                                      cont <= 4 ||
                                  intValue == i) {
                                intValue = Random().nextInt(8);

                                if (listOfPlayerX.contains(intValue) ||
                                    listOfPlayerO.contains(intValue) ||
                                    intValue == i) {
                                  intValue = Random().nextInt(8);
                                } else {
                                  break;
                                }
                              }
                              listOfPlayerO.add(intValue);
                              displayElement[intValue]['image'] = o;
                              check = Check().checkWinner();
                              if (cont <= 4 && check != ex) {
                                var timer = new Timer(Duration(milliseconds: 300), () {


                                  bloc.add(MyBlockEvent('PlayerO', intValue));
                                  filledBoxes++;
                                  if (check == "images/O.png") {
                                    bloc.add(MyBlockEvent("O", 0));
                                    showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                        content: const Text("Winner is O!",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700)),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              bloc.add(MyBlockEvent('Reset', 0));
                                              Navigator.of(ctx).pop();
                                            },
                                            child: Container(
                                              color: Colors.deepOrange,
                                              padding: const EdgeInsets.all(14),
                                              child: const Text("Reset",
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              exit(1);
                                            },
                                            child: Container(
                                              color: Colors.green,
                                              padding: const EdgeInsets.all(14),
                                              child: const Text("Exit",
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }


                                });


                              } else
                                return;
                              //
                            }
                          },
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Image.asset(
                                'images/O.png',
                                width: 50,
                                height: 50,
                              ),
                            ),
                            const Text('Player',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 170.0),
                          child: Container(
                            width: 80,
                            height: 40,
                            decoration: BoxDecoration(boxShadow: const [
                              BoxShadow(
                                color: Colors.black38,
                                blurRadius: 20,
                                spreadRadius: 1.0,
                              )
                            ], borderRadius: BorderRadius.circular(50.0)),
                            child: Container(
                              width: 80,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: BlocBuilder<MyBlock, MyBlockState>(
                                  builder: (context3, state) {
                                return Center(
                                    child: Text(
                                  countO.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ));
                              }
                                  //Center(child: Text('0', style:TextStyle(fontWeight: FontWeight.bold, fontSize: 20) ,)),
                                  ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
