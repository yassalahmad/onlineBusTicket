// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Busseats2 extends StatefulWidget {
  const Busseats2({Key? key}) : super(key: key);

  @override
  _BusseatsState createState() => _BusseatsState();
}

class _BusseatsState extends State<Busseats2> {
  final _chairStatus = [
    [1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 3, 1, 1],
    [1, 1, 1, 1, 1, 3, 3],
    [2, 2, 2, 1, 3, 1, 1],
    [1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1],
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for (int i = 0; i < 5; i++)
          Container(
            margin: EdgeInsets.only(top: i == 0 ? 50 : 0),
            child: Row(
              children: <Widget>[
                for (int x = 1; x < 6; x++)
                  Expanded(
                    child: (x == 3) || (x == 2)
                        ? Container()
                        : Container(
                            height: 60,
                            margin: const EdgeInsets.all(5),
                            child: _chairStatus[i][x - 1] == 1
                                ? availableChair(i, x - 1)
                                : _chairStatus[i][x - 1] == 2
                                    ? selectedChair(i, x - 1)
                                    : reservedChair(),
                          ),
                  ),
              ],
            ),
          ),
      ],
    );
  }

  Widget selectedChair(int a, int b) {
    return InkWell(
      onTap: () {
        _chairStatus[a][b] = 1;
        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(3.0)),
      ),
    );
  }

  Widget availableChair(int a, int b) {
    return InkWell(
      onTap: () {
        _chairStatus[a][b] = 2;
        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.0),
          
          border: Border.all(
            color: Colors.blue,
            width: 1,
          ),
        ),
      ),
    );
  }
  

  Widget reservedChair() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(3.0)),
    );
  }
}
