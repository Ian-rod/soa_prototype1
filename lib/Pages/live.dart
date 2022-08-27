// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_typing_uninitialized_variables, unused_local_variable, avoid_print

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:soa_prototype1/models/channel.dart';
import 'package:soa_prototype1/models/services.dart';
import 'package:soa_prototype1/models/videos.dart';
import 'package:soa_prototype1/screens/videoplayer.dart';
import './mydrawer.dart';
class View extends StatefulWidget {
  const View({ Key? key }) : super(key: key);

  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {
  late ChannelInfo channel;
  var videolist=Videolist();
  late Item item;
  bool loading=true;
  var playlist;
  late String nextpagetoken;
  ScrollController scrollController=ScrollController(

  );
  @override
  void initState() {
    getchannelinfo();
   var channel= videolist.videos;
   nextpagetoken="";
    super.initState();
  }

  getchannelinfo()async{
    channel=await Services.getchannelInfo();
    item=channel.items[0];
    playlist= item.contentDetails.relatedPlaylists.uploads;
    await loadvideos();
    setState(() {
      loading=false;
    });
  }
   loadvideos ()async
  {
    Videolist templist=await Services.getvideolist(
     playlistid:playlist,
     pagetoken:nextpagetoken);
     nextpagetoken=templist.nextPageToken;
     videolist=templist;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[600],
        title:Text( loading?"Loading...":"Sound of Abundance Church"),
        centerTitle: true,
      ),drawer: SafeArea(
        child: draw(context)
      ),
      body: Container(
        child: Column(
          children: [
            buildview(),
            Expanded(
              child: NotificationListener<ScrollEndNotification>(
                onNotification: (ScrollNotification notification){
                  if(videolist.videos.length>=int.parse(item.statistics.videoCount))
                  {
                    return true;
                  }
                  if(notification.metrics.pixels==notification.metrics.maxScrollExtent)
                  {
                    loadvideos();
                  }
                  return true;
                } ,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    controller: scrollController,
                    // ignore: prefer_if_null_operators
                    itemCount: videolist.videos==null?0:videolist.videos.length,
                    itemBuilder:(context,index){
                      VideoItem videoItem=videolist.videos[index];
                      return InkWell(
                        onTap:()async {Navigator.push(context, MaterialPageRoute(builder: (context){
                          return Playvideo(videoitem: videoItem,);
                        }));},
                        child: Container(
                          margin: EdgeInsets.all(5),
                          child: Row(
                            children: [
                              CachedNetworkImage(
                                imageUrl: videoItem.video.thumbnails.thumbnailsDefault.url
                                ),
                                SizedBox(width: 20,),
                              Flexible(child: Text(videoItem.video.title))
                            ],
                          ),
                        ),
                      );
                            
                  }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  buildview()
{
  return loading?CircularProgressIndicator():Container(
    child: Card(
      child: Row(children: [
        CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(
            item.snippet.thumbnails.medium.url
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Text(item.snippet.title,
        style:TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600
        ),
        ),
        SizedBox(
          width: 20,
        ),
        Text(item.statistics.videoCount +" videos")
      ]),
    ),
  );
}
}
