import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rainbox/views/songlist/songList.dart';

// ignore: non_constant_identifier_names
Widget Home_item_img (context, List<dynamic> list) {
  return GridView.count(
      physics: new NeverScrollableScrollPhysics(),         //多嵌套下不能滚动解决方法
      shrinkWrap: true,                                      //多自适应嵌套报错解决方法
    crossAxisCount: 3,
    mainAxisSpacing: 1.0,                 //上下空隙
    crossAxisSpacing: 4.0,                //左右空袭
    childAspectRatio: 0.7,              //宽高比
    children: List.generate(list.length, (int index){
      return GestureDetector(
        child: Column(
          children: <Widget>[
            ClipRRect(child: Image.network(list[index].imgUrl), borderRadius: BorderRadius.circular(10)),
            SizedBox(height: 5),
            Text(list[index].name,  overflow: TextOverflow.ellipsis, maxLines: 2,style: TextStyle()),
          ],
        ),
        onTap: (){
          jump(context, list[index].name);
        },
      );
    })
  );
}


//跳转歌单排行榜
jump(dynamic context, String name) {
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