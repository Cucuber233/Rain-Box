import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rainbox/views/rankingList/pai_hang_bang.dart';

// ignore: non_constant_identifier_names
Widget Home_top_bar (BuildContext context) {
  return Container(
    padding: EdgeInsets.all(5),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[
              Image.asset('assets/Home-bar/diantai.png', height: 50),
              SizedBox(height: 5),
              Text('电台')
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Image.asset('assets/Home-bar/gedan.png', height: 50),
              SizedBox(height: 5),
              Text('歌单')
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Image.asset('assets/Home-bar/tuijian.png', height: 50),
              SizedBox(height: 5),
              Text('推荐')
            ],
          ),
        ),
        Expanded(
          child: GestureDetector(
            child: Column(
              children: <Widget>[
                Image.asset('assets/Home-bar/paihangbang.png', height: 50),
                SizedBox(height: 5),
                Text('排行榜')
              ],
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => new RankingList()));
            },
          ),
//            onPressed: () {
//              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => new RankingList())
//              );
//            },
          ),
        Expanded(
          child: Column(
            children: <Widget>[
              Image.asset('assets/Home-bar/zhibo.png', height: 50),
              SizedBox(height: 5),
              Text('直播')
            ],
          ),
        ),
      ],
    ),
  );
}