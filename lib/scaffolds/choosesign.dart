import 'package:flutter/material.dart';

class ChooseSign extends StatefulWidget {
  const ChooseSign({Key? key}) : super(key: key);

  @override
  State<ChooseSign> createState() => _ChooseSignState();
}

class _ChooseSignState extends State<ChooseSign> {
  var size, height, width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    SingingSign? sign = SingingSign.PlayerX;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: height * 0.1),
                child: Text(
                  "Pick Your Side",
                  style: TextStyle(
                      fontFamily: "lab", fontSize: 30, color: Colors.black),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height*0.12),
                child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset("images/X.png",scale: 6,color: Colors.deepOrange,),
                    Image.asset("images/O.png",scale: 12, color: Colors.green,),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height*0.12),
                child: Flexible(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text('Player X'),
                        leading: Radio<SingingSign>(
                          value: SingingSign.PlayerX,
                          groupValue: sign,
                          onChanged: (SingingSign? value) {
                            setState(() {
                              sign=  SingingSign.PlayerX;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text('Player X'),
                        leading: Radio<SingingSign>(
                          value: SingingSign.PlayerO,
                          groupValue: sign,
                          onChanged: (SingingSign? value) {
                            setState(() {
                              sign=   SingingSign.PlayerO;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

enum SingingSign { PlayerX, PlayerO }
