import 'package:flutter/cupertino.dart';

import 'package:rainbox/net_work/api.dart';
import 'home_item_model.dart';
import 'home_img.dart';

// ignore: camel_case_types
class Home_Item extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new Home_Item_State();
  }
}

// ignore: camel_case_types
class Home_Item_State extends State<Home_Item> {

  List<Home_item_model> list_1 = [];
  List<Home_item_model> list_2 = [];
  List<Home_item_model> list_3 = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //推荐歌单
    Request.$http('personalized?limit=6').then((res){
      final sub = res['result'];
      for(var i in sub){
        setState(() {
          list_1.add(Home_item_model.fromMap(i,1));
        });
      }
    });
    //新歌
    Request.$http('personalized/newsong').then((res){
      final sub = res['result'];
      for(var i in sub){
        setState(() {
          list_2.add(Home_item_model.fromMap(i,2));
        });
      }
    });
    //新碟
    Request.$http('album/newest').then((res){
      final sub = res['albums'];
      for(var i in sub){
        setState(() {
          list_3.add(Home_item_model.fromMap(i,3));
        });
    }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(5),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(child: Text('推荐歌单', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600))),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                    decoration: BoxDecoration(
                      border: new Border.all(color: Color.fromARGB(255 ,189, 195, 199), width: 1.2),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Text('歌单广场'),
                  ),
                ],
              ),
              SizedBox(height: 6),
              Container(
                child: Home_item_img(context, this.list_1),
              ),
              Row(
                children: <Widget>[
                  Expanded(child: Text('新歌', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600))),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                    decoration: BoxDecoration(
                        border: new Border.all(color: Color.fromARGB(255 ,189, 195, 199), width: 1.2),
                        borderRadius: BorderRadius.circular(15)
                    ),
                      child: Text('新歌推荐'),
                    ),
                  ],
                ),
                  SizedBox(height: 6),
                  Container(
                    child: Home_item_img(context, this.list_2),
                  ),
              Row(
                children: <Widget>[
                  Expanded(child: Text('新碟', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600))),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                    decoration: BoxDecoration(
                        border: new Border.all(color: Color.fromARGB(255 ,189, 195, 199), width: 1.2),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Text('更多新碟'),
                  ),
                ],
              ),
              SizedBox(height: 6),
              Container(
                child: Home_item_img(context, this.list_3),
              ),
            ],
          ),
        ),
      ],
    );
  }
}