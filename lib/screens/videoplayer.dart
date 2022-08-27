// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:soa_prototype1/models/videos.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class Playvideo extends StatefulWidget {
   Playvideo({this.videoitem});
  final VideoItem? videoitem;
  @override
  State<Playvideo> createState() => _PlayvideoState();
}

class _PlayvideoState extends State<Playvideo> {
  late YoutubePlayerController controller;
  bool playerready=false;
  @override
  void initState() {
    controller=YoutubePlayerController(initialVideoId: widget.videoitem!.video.resourceId.videoId,
    flags: YoutubePlayerFlags(
    mute: false,
    autoPlay: true
     )
    );
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(player: YoutubePlayer(controller: controller),
     builder: (context,player){
      return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[700],
        title: Text(widget.videoitem!.video.title),
      ),
      body: Column(
        children: [
          YoutubePlayer(controller: controller,
          showVideoProgressIndicator: true,
          onReady: (){
            playerready=true;
          },
          ),
          SizedBox(
            height: 20,
          ),
          Center(child: Text(widget.videoitem!.video.description))
        ],
      ),
    );
     });
  }
}