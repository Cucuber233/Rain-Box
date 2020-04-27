import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rainbox/net_work/api.dart';
import 'package:rainbox/views/MV/video.dart';

// ignore: must_be_immutable
class SongList extends StatefulWidget {

  int id;
  int type;
  SongList(this.id, this.type);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new SongListState(this.id, this.type);
  }
}
 class SongListState extends State<SongList>  {

  //List<SongListData> jsonData;
   Map<String, dynamic> jsonData;
   List<dynamic> listData = [];
   int id;
   int type;
  SongListState(this.id, this.type);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(this.type == 1){
      Request.$http('top/list?idx=${this.id}').then((res){
        setState(() {
          this.jsonData = res['playlist'];
          this.listData =  res['playlist']['tracks'];
        });
      });
    }
    if(this.type == 0){
      Request.$http('playlist/detail?id=${this.id}').then((res){
        print(res);
      });
    }
  }

  //判断MV
 // ignore: non_constant_identifier_names
 Widget GetMV(index) {
   if(this.listData[index]['mv'] == 0){
     return Text('');
   }else{
     return GestureDetector(
         child: Icon(Icons.music_video, size: 30, color: Colors.grey),
       onTap: (){
           Navigator.push(context, MaterialPageRoute(builder: (context) => new MoveVideo(this.listData[index]['mv'])));
       },
     );
   }
 }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return this.jsonData == null ? Scaffold(
      appBar: AppBar(title: Text('排行歌单')),body: Center(child: Text('加载中...', style: TextStyle(color: Colors.red[400], fontSize: 30, shadows: <Shadow>[Shadow(color: Colors.pink, offset: Offset(1, 2))], ))))
        : Scaffold(
      appBar: AppBar(title: Text('排行歌单')),
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  width:double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(this.jsonData['creator']['backgroundUrl'], scale: 1.0),
                          fit: BoxFit.fill
                      )
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          ClipRRect(child: ClipRRect(child: Image.network(this.jsonData['coverImgUrl'], height: 150, fit: BoxFit.fill), borderRadius: BorderRadius.circular(15),), borderRadius: BorderRadius.circular(5)),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(this.jsonData['name'], style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                                SizedBox(height: 10),
                                Row(children: <Widget>[
                                  ClipRRect(child: Image.network(this.jsonData['creator']['avatarUrl'], height: 40), borderRadius: BorderRadius.circular(40)),
                                  SizedBox(width: 10),
                                  Text(this.jsonData['creator']['nickname'], style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600))
                                ]),
                                SizedBox(height: 10),
                                Container(
                                  width: 200,
                                  child: Text(this.jsonData['description'], maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Icon(Icons.more, size: 30),
                                SizedBox(height: 5),
                                Text('${this.jsonData['commentCount']}')
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Icon(Icons.share, size: 30),
                                SizedBox(height: 5),
                                Text('${this.jsonData['shareCount']}')
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Icon(Icons.directions, size: 30),
                                SizedBox(height: 5),
                                Text('分享')
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Icon(Icons.list, size: 30),
                                SizedBox(height: 5),
                                Text('多选')
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: <Widget>[
                          Icon(Icons.play_circle_outline, size: 40),
                          SizedBox(width: 10),
                          Expanded(
                              child: Text('播放全部', style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),)
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(this.jsonData['creator']['backgroundUrl'], scale: 1.0),
                                    fit: BoxFit.fill
                                ),
                                border: new Border.all(color: Color(0xffffffff), width: 0.5),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Text('+收藏(${this.jsonData['subscribedCount']})'),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                    physics: new NeverScrollableScrollPhysics(),         //多嵌套下不能滚动解决方法
                    shrinkWrap: true,                                      //多自适应嵌套报错解决方法
                  itemCount: this.listData.length,
                    itemBuilder: (BuildContext context, int index){
                     return Row(
                       children: <Widget>[
                         Container(width: 60,child: Center(child: Text('${index+1}', style: TextStyle(fontSize: 22, color: Colors.grey)))),
                         Expanded(
                           child: Container(
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: <Widget>[
                                 Container(padding: EdgeInsets.fromLTRB(0, 0, 0, 2), child: Text(this.listData[index]['name'], overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 19))),
                                 Container(padding: EdgeInsets.fromLTRB(0, 0, 0, 10), child: Text('${this.listData[index]['ar'][0]['name']}--${this.listData[index]['al']['name']}', overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 13)))
                               ],
                             ),
                           ),
                         ),
                         //Icon(Icons.music_video, size: 30),
                         GetMV(index),
                         SizedBox(width: 20)
                       ],
                     );
                    }
                )
              ],
            ),
          )
        ],
      ),
    );
  }
 }