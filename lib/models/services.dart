//services provided
// ignore_for_file: avoid_print

import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:soa_prototype1/api.dart';
import 'package:soa_prototype1/models/channel.dart';
import 'package:soa_prototype1/models/videos.dart';

class Services{
  static const channelid="UCTNrsKWlgZVOWENHuHJiQHQ";
  static const baseurl="www.googleapis.com";

  //get channel info
  static Future<ChannelInfo> getchannelInfo() async{
    var parameters={
      "part":"snippet,contentDetails,statistics",
      "id":channelid,
      "key":Constants.apikey,
    };
    var headers={
      HttpHeaders.contentTypeHeader:"application/json",
    };
    //call api to get details
    Uri uri=Uri.https(baseurl, "/youtube/v3/channels",parameters);
    Response response= await http.get(uri,headers: headers);
    print(response.body);
    ChannelInfo channel=channelInfoFromJson(response.body);
    return channel;
    
  }
  static Future<Videolist> getvideolist({required String playlistid,required String pagetoken})async
  {
    var parameters={
      "part":"snippet",
      "playlistId":playlistid,
      "maxResults":"8",
      "pageToken":pagetoken,
      "key":Constants.apikey
    };
        var headers={
      HttpHeaders.contentTypeHeader:"application/json",
    };
    //call api to get details
    Uri uri=Uri.https(baseurl, "/youtube/v3/playlistItems",parameters);
    Response response= await http.get(uri,headers: headers);
    print("playlist items request "+response.body);
    Videolist videolist=videolistFromJson(response.body);
    return videolist;
  }
}
