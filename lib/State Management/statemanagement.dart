import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../scaffolds/gamescreen.dart';
int countX = 0;
int countO = 0;
var testttttttt = [
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

class MyBlock extends Bloc<MyBlockEvent, MyBlockState> {
  MyBlock() : super(MyBlockState());

  Stream<MyBlockState> mapEventToState(MyBlockEvent e) async* {
    if (e.playerType == 'PlayerX') {
      if (testttttttt[e.x]["image"] == "") {
        yield MyBlockState().PlayerX(e.x);
      }
    } else if (e.playerType == "PlayerO") {
      if (testttttttt[e.x]["image"] == "") {
        yield MyBlockState().PlayerO(e.x);
      }
    } else if (e.playerType == "Reset") {
      yield MyBlockState().Reset(state);
    } else if (e.playerType == "X") {
      yield MyBlockState().incrementX(state);
    }else if (e.playerType == "O") {
      yield MyBlockState().incrementO(state);
    }
  }
}

class MyBlockEvent {
  int x;

  String playerType = 'PlayerX';

  MyBlockEvent(this.playerType, this.x);
}

class MyBlockState {
  var test = [
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
    {
      "image": '',
    },
  ];


  dynamic photo = Text("");

  MyBlockState PlayerO(int x) {
    List<int> winnerO = [];
    winnerO.add(x);
    MyBlockState setO = MyBlockState();
    setO.photo = testttttttt[x]["image"] = 'images/O.png';
    return setO;
  }

  MyBlockState PlayerX(int y) {
    List<int> winnerX = [];
    winnerX.add(y);
    MyBlockState setX = MyBlockState();
    setX.photo = testttttttt[y]["image"] = 'images/X.png';
    return setX;
  }

  MyBlockState Reset(MyBlockState c) {
    MyBlockState reset = MyBlockState();
    cont = 0;
    filledBoxes = 0;
    displayElement = [
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
    listOfPlayerX = [];
    listOfPlayerO = [];
    testttttttt = [
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
    return reset;
  }

  MyBlockState incrementX(MyBlockState c) {
    MyBlockState x = MyBlockState();
    countX = countX + 1;
    return x;
  }
  MyBlockState incrementO(MyBlockState c) {
    MyBlockState x = MyBlockState();
    countO = countO + 1;
    return x;
  }
}
