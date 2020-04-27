import 'package:flutter/material.dart';
import 'package:rainbox/conponents/swiper.dart';
import 'package:rainbox/net_work/api.dart';

//首页
import 'package:flutter/cupertino.dart';
import 'package:rainbox/conponents/home_top_bar/home_top_bar.dart';
import 'package:rainbox/conponents/home_item/home_item.dart';

import 'package:rainbox/Http_models_data/Banners/Banners.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new Home_State();
  }
}

// ignore: camel_case_types
class Home_State extends State<Home> {

  // ignore: non_constant_identifier_names
  List<dynamic> Banners;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //http請求
    // ignore: unnecessary_statements
    Request.$http('banner').then((res){
      //print(res);
      final sub = res['banners'];
      List<BannersItem> banners = [];
      for(var i in sub){
        banners.add(new BannersItem.fromMap(i));
      }
      setState(() {
        this.Banners = banners;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return this.Banners == null ? Scaffold(
        appBar: AppBar(title: Text('首页')),body: Center(child: Text('加载中...', style: TextStyle(color: Colors.red[400], fontSize: 30, shadows: <Shadow>[Shadow(color: Colors.pink, offset: Offset(1, 2))], ))))
        : Scaffold(
        appBar: PreferredSize(
          child: AppBar(
            title: Text('首页'),
          ),
          preferredSize: Size.fromHeight(40),             //设置屏幕头部大小
        ),
        body: ListView(
          children: <Widget>[
            ItemS_wiper(Banners),
            Home_top_bar(context),
            new Home_Item(),
          ],
        ),
    );
  }
}
//---------------------------------------------------