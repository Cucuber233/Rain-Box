import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/cupertino.dart';

//// ignore: camel_case_types, must_be_immutable
//class ItemS_wiper extends StatefulWidget {
//
//  // ignore: non_constant_identifier_names
//  List<dynamic> Banners;
//
//  ItemS_wiper(this.Banners);
//
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return ItemS_wiper_State(this.Banners);
//  }
//}
//
//// ignore: camel_case_types
//class ItemS_wiper_State extends State<ItemS_wiper> {
//
//  // ignore: non_constant_identifier_names
//  List<dynamic> banners_;
//
//  // ignore: non_constant_identifier_names
//  ItemS_wiper_State(this.banners_);
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return new Swiper(
//      layout: SwiperLayout.STACK,
//      customLayoutOption: new CustomLayoutOption(
//          startIndex: -1,
//          stateCount: 3
//      ).addRotate([
//        -45.0/180,
//        0.0,
//        45.0/180
//      ]).addTranslate([
//        new Offset(-370.0, -40.0),
//        new Offset(0.0, 0.0),
//        new Offset(370.0, -40.0)
//      ]),
//      itemWidth: 400.0,
//      itemHeight: 200.0,
//      itemBuilder: (context, index) {
//        return new Container(
//          color: Colors.grey,
//          child: new Center(
//            child: new Text('$index'),
//  //            child: new Image.network(this.banners_[index].imageUrl),
//          ),
//        );
//      },
//      itemCount: 3,
//    );
//  }
//}


// ignore: non_constant_identifier_names
Widget ItemS_wiper (List<dynamic> BannersItem) {
  return new Swiper(
    layout: SwiperLayout.STACK,
    customLayoutOption: new CustomLayoutOption(
        startIndex: -1,
        stateCount: 3
    ).addRotate([
      -45.0/180,
      0.0,
      45.0/180
    ]).addTranslate([
      new Offset(-370.0, -40.0),
      new Offset(0.0, 0.0),
      new Offset(370.0, -40.0)
    ]),
    itemWidth: 360.0,
    itemHeight: 200.0,
    itemBuilder: (context, index) {
      return new Container(
        color: Colors.grey,
        child: new Center(
            child: new Image.network(BannersItem[index].imageUrl,height: 200, fit: BoxFit.fill),
        ),
      );
    },
    itemCount: BannersItem.length,
    autoplay: true,
    autoplayDelay: 5000
  );
}
