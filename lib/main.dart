import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_search_bar/simple_search_bar.dart';

import 'views/Home/home.dart';

//第三方库封装


import 'conponents/home_item/home_img.dart';

void main () => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rain Box',
      theme: ThemeData(
        primaryColor: const Color(0xffef5350)
      ),
      home: new Main(),
    );
  }
}

// ignore: must_be_immutable
class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Body();
  }
}

class Body extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new Body_State();
  }
}

// ignore: camel_case_types
class Body_State extends State<Body> {

  int nowIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: nowIndex,
        unselectedFontSize: 14.0,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset('assets/Tab-bar/home.png', width: 22, height: 22),
              activeIcon:  Image.asset('assets/Tab-bar/home_active.png', width: 22, height: 22),
              title: Text('首页', style: TextStyle(fontSize: 10))
          ),
          BottomNavigationBarItem(
              icon: Image.asset('assets/Tab-bar/category.png',  width: 22, height: 22),
              activeIcon:  Image.asset('assets/Tab-bar/category_active.png', width: 22, height: 22),
              title: Text('分类', style: TextStyle(fontSize: 10))
          ),
          BottomNavigationBarItem(
              icon: Image.asset('assets/Tab-bar/cart.png',  width: 22, height: 22),
              activeIcon:  Image.asset('assets/Tab-bar/cart_active.png', width: 22, height: 22),
              title: Text('购物车', style: TextStyle(fontSize: 10))
          ),
          BottomNavigationBarItem(
              icon: Image.asset('assets/Tab-bar/profile.png',  width: 22, height: 22),
              activeIcon:  Image.asset('assets/Tab-bar/profile_active.png', width: 22, height: 22),
              title: Text('我的', style: TextStyle(fontSize: 10))
          ),
        ],
        onTap: (int value) {
          setState(() {
            this.nowIndex = value;
          });
        },
      ),
      body: IndexedStack(
        index: this.nowIndex,
        children: <Widget>[
          new Home(),
          Friends(),
          Video(),
          My()
        ],
      ),
    );
  }
}
//-----------------------------------------------------------
//朋友
class Friends extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: PreferredSize(
          child: AppBar(
            title: Text('朋友'),
          ),
          preferredSize: Size.fromHeight(40),             //设置屏幕头部大小
        ),
        body: GridView.count(
          padding: EdgeInsets.all(5.0),
          crossAxisCount: 3,
          mainAxisSpacing: 3.0,                 //上下空隙
          crossAxisSpacing: 3.0,                //左右空袭
          childAspectRatio: 0.8,              //宽高比
          children: <Widget>[
            ClipRRect(child: Image.network('https://dss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=3284054360,1106609774&fm=58&s=69403A6247A3AEE808E19D0B0000E0C1', fit: BoxFit.fill), borderRadius: BorderRadius.circular(5)),
            ClipRRect(child: Image.network('https://dss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=3465500627,4087711608&fm=58&app=83&f=JPEG?w=400&h=533&s=1A4FA9445F23AE5F5E6766010300E0DE', fit: BoxFit.fill), borderRadius: BorderRadius.circular(5)),
            ClipRRect(child: Image.network('https://dss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1603613702,2138929720&fm=58&s=47921CC18235FDDE0330B98B0100D091', fit: BoxFit.fill), borderRadius: BorderRadius.circular(5)),
            Image.network('https://dss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=4191851377,1755301182&fm=58&s=A0026CB50C134BFF189DDD430300F0E1', fit: BoxFit.fill),
            Image.network('https://dss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3401745210,3434810146&fm=58&app=83&f=JPEG?w=400&h=533&s=E8E2A144FAB1AE5D0CFD548403007082', fit: BoxFit.fill),
            Image.network('https://dss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=3052485679,869879733&fm=58&s=4FB23CC0461D1FDE3285CD100300C0CA', fit: BoxFit.fill),
          ],
        ),
    );
  }
}
//-----------------------------------------------------
//视频
class Video extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: PreferredSize(
          child: AppBar(
            title: Text('视频'),
          ),
          preferredSize: Size.fromHeight(40),             //设置屏幕头部大小
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(1),
            child: Text('视频'),
          )
        )
    );
  }
}
//-----------------------------------------------------
//我的
class My extends StatelessWidget {

  final AppBarController appBarController = AppBarController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
//       appBar: SearchAppBar(
//        primary: Theme.of(context).primaryColor,
//        appBarController: appBarController,
//        // You could load the bar with search already active
//        autoSelected: true,
//        searchHint: "Pesquise aqui...",
//        mainTextColor: Colors.white,
//        onChange: (String value) {
//          //Your function to filter list. It should interact with
//          //the Stream that generate the final list
//        },
//        //Will show when SEARCH MODE wasn't active
//        mainAppBar: AppBar(
//          title: Text("Yout Bar Title"),
//          actions: <Widget>[
//            InkWell(
//              child: Icon(
//                Icons.search,
//              ),
//              onTap: () {
//                //This is where You change to SEARCH MODE. To hide, just
//                //add FALSE as value on the stream
//                appBarController.stream.add(true);
//              },
//            ),
//          ],
//        ),
//        ),
        body: Center(
          child:Text('我的')
        )
    );
  }
}