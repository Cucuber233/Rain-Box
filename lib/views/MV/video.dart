//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:rainbox/net_work/api.dart';
//
//// ignore: must_be_immutable
//class MoveVideo extends StatefulWidget {
//
//  // ignore: non_constant_identifier_names
//  int video_ID;
//
//  MoveVideo(this.video_ID);
//
//  @override
//  _MoveVideoState createState() => _MoveVideoState(this.video_ID);
//}
//
//class _MoveVideoState extends State<MoveVideo> {
//
//  // ignore: non_constant_identifier_names
//  int video_State_ID;
//
//  _MoveVideoState(this.video_State_ID);
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    Request.$http('mv/url?id=${this.video_State_ID}').then((res){
//      print(res);
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(title: Text('MV')),
//      body: Center(
//        child: Text('${this.video_State_ID}'),
//      ),
//    );
//  }
//}



import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class MoveVideo extends StatefulWidget {

  // ignore: non_constant_identifier_names
  int video_ID;

  MoveVideo(this.video_ID);

  @override
  _MoveVideo createState() => _MoveVideo();
}

class _MoveVideo extends State<MoveVideo> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'http://vodkgeyttp8.vod.126.net/cloudmusic/29b2/cor…611c357db2e4bd91717787978119ef9&wsTime=1587923019')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: Center(
          child: _controller.value.initialized
              ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
              : Container(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}



