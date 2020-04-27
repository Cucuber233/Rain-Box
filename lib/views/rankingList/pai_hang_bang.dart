import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rainbox/conponents/home_item/home_img.dart';
import 'package:rainbox/net_work/api.dart';
import 'package:rainbox/views/songlist/songList.dart';
import 'model_data.dart';

class RankingList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RankingListState();
  }
}

class RankingListState extends State<RankingList> {

  List<RankList> _official = [];
  List<RankList> _recommend = [];
  List<RankList> _global = [];
  List<RankList> _more = [];
  int count = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Request.$http('toplist/detail').then((res) {
      List<dynamic> sub = res['list'];
      for (var i in sub) {
        this.count++;
        String name = i['name'];
      if (name == "云音乐飙升榜" || name == "云音乐新歌榜" || name == "网易原创歌曲榜" || name == "云音乐热歌榜") {
        setState(() {
          this._official.add(RankList.fromMap(i));
        });
        } else if (name == "江小白YOLO云音乐说唱榜" || name == "说唱TOP榜" || name == "云音乐电音榜" || name == "云音乐ACG音乐榜" || name == "云音乐欧美新歌榜" || name == "抖音排行榜") {
          setState(() {
            this._recommend.add(RankList.fromMap(i));
          });
        } else if (name == "美国Billboard周榜" || name == "UK排行榜周榜" || name == "Beatport全球电子舞曲榜" || name == "日本Oricon周榜" || name == "iTunes榜" || name == "香港电台中文歌曲龙虎榜") {
          setState(() {
            this._global.add(RankList.fromMap(i));
          });
        } else {
        setState(() {
          this._more.add(RankList.fromMap(i));
        });
        }
    }
    });
  }

  @override
  Widget build(BuildContext context) {

    jump(String name) {
      int id;
      if (name == "云音乐新歌榜") {
        id = 0;
      }
      if (name == "云音乐热歌榜") {
        id = 1;
      }
      if (name == "网易原创歌曲榜") {
        id = 2;
      }
      if (name == "云音乐飙升榜") {
        id = 3;
      }
      if (name == "云音乐电音榜") {
        id = 4;
      }
      if (name == "UK排行榜周榜") {
        id = 5;
      }
      if (name == "美国Billboard周榜") {
        id = 6;
      }
      if (name == "KTV嗨榜") {
        id = 7;
      }
      if (name == "iTunes榜") {
        id = 8;
      }
      if (name == "Hit FM Top榜") {
        id = 9;
      }
      if (name == "日本Oricon周榜") {
        id = 10;
      }
      if (name == "韩国Melon排行榜周榜") {
        id = 11;
      }
      if (name == "韩国Mnet排行榜周榜") {
        id = 12;
      }
      if (name == "韩国Melon原声周榜") {
        id = 13;
      }
      if (name == "中国TOP排行榜(港台榜)") {
        id = 14;
      }
      if (name == "中国TOP排行榜(内地榜)") {
        id = 15;
      }
      if (name == "香港电台中文歌曲龙虎榜") {
        id = 16;
      }
      if (name == "华语金曲榜") {
        id = 17;
      }
      if (name == "中国嘻哈榜") {
        id = 18;
      }
      if (name == "法国 NRJ EuroHot 30周榜") {
        id = 19;
      }
      if (name == "台湾Hito排行榜") {
        id = 20;
      }
      if (name == "Beatport全球电子舞曲榜") {
        id = 21;
      }
      if (name == "云音乐ACG音乐榜") {
        id = 22;
      }
      if (name == "云音乐嘻哈榜") {
        id = 23;
      }
      Navigator.push(context, MaterialPageRoute(builder: (context) => new SongList(id, 1)));
    }

    // TODO: implement build
    return this.count == 0 ? Scaffold(
        appBar: AppBar(title: Text('排行榜')),body: Center(child: Text('加载中...', style: TextStyle(color: Colors.red[400], fontSize: 30, shadows: <Shadow>[Shadow(color: Colors.pink, offset: Offset(1, 2))], )))) : Scaffold(
      appBar: AppBar(
        title: Text('排行榜'),
      ),
      body: ListView(
        children: <Widget>[
          Container(padding: EdgeInsets.fromLTRB(10, 5, 0, 0),child: Text('官方榜', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900))),
           Column(
             children: List.generate(this._official.length, (int index){
               return Container(
                 padding: EdgeInsets.all(5),
                 child: GestureDetector(
                   child: Row(
                     children: <Widget>[
                       Container(padding: EdgeInsets.fromLTRB(5, 0, 15, 0),child: ClipRRect(child: Image.network(this._official[index].imgUrl, width: 130, fit: BoxFit.fill,), borderRadius: BorderRadius.circular(10))),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('1.${this._official[index].tracks[0]['first']}-${this._official[index].tracks[0]['second']}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                              SizedBox(height: 15),
                              Text('2.${this._official[index].tracks[1]['first']}-${this._official[index].tracks[1]['second']}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                              SizedBox(height: 15),
                              Text('3.${this._official[index].tracks[2]['first']}-${this._official[index].tracks[2]['second']}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600))
                            ],
                          )
                     ],
                   ),
                   onTap: (){
                     jump(this._official[index].name);
                   },
                 ),
               );
             }),
           ),
          Container(
            child: GestureDetector(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(padding: EdgeInsets.fromLTRB(10, 2, 0, 0),child: Text('推荐榜', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600))),
                  SizedBox(height: 6),
                   Container(
                     padding: EdgeInsets.all(8),
                     child: Home_item_img(context, this._recommend),
                   )
                ],
              ),
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(padding: EdgeInsets.fromLTRB(10, 2, 0, 0),child: Text('全球榜', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600))),
                SizedBox(height: 6),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Home_item_img(context, this._global),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(padding: EdgeInsets.fromLTRB(10, 2, 0, 0),child: Text('更多榜单', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600))),
                SizedBox(height: 6),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Home_item_img(context, this._more),
                )
              ],
            ),
          ),
        ],
      )
    );
  }
}