import 'package:flutter/material.dart';


class MainTopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return               Container(
      height: 400.0,
      child: Center(
        child: Container(
          height: 150,
          width: 150,
          child: ListView(
              padding: const EdgeInsets.all(0),
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                Container(
                  height: 50,
                  child: const Center(
                      child: Text(
                        '武蔵野市',
                        style:
                        TextStyle(fontSize: 25, color: Colors.white),
                      )),
                ),
                Container(
                  height: 100,
                  child: const Center(
                      child: Text(
                        '30°',
                        style:
                        TextStyle(fontSize: 50, color: Colors.white),
                      )),
                ),
              ]),
        ),
      ),
    );
  }
}
