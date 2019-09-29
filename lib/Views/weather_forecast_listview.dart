import 'package:flutter/material.dart';

class WeatherForeCastListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return             Container(
      decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 0.5, color: Color(0xFFFFFFFFFF)),
            bottom: BorderSide(width: 0.5, color: Color(0xFFFFFFFFFF)),
          )
      ),
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
              width: 80.0,
              color: Colors.transparent,
              child: ListView(
                padding: const EdgeInsets.all(0),
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  Container(
                    height: 25,
                    child: const Center(child: Text('現在')),
                  ),
                  Container(
                    height: 50,
                    child: const Center(child: Icon(Icons.wb_sunny,color: Colors.yellow,)),
                  ),
                  Container(
                    height: 25,
                    child: const Center(child: Text('30°')),
                  ),
                ],
              )

          ), // 天気の要素

        ],
      ),
    );
  }
}
