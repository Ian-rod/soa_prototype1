// To parse this JSON data, do
//
//     final videolist = videolistFromJson(jsonString);

// ignore_for_file: prefer_null_aware_operators, unnecessary_null_comparison, prefer_typing_uninitialized_variables

import 'dart:convert';

Videolist videolistFromJson(String str) => Videolist.fromJson(json.decode(str));

String videolistToJson(Videolist data) => json.encode(data.toJson());

class Videolist {
    Videolist({
         this.kind,
         this.etag,
         this.nextPageToken,
         this.videos,
         this.pageInfo,
    });

    String? kind;
    String? etag;
    var nextPageToken;
    var videos;
    var pageInfo;

    factory Videolist.fromJson(Map<String, dynamic> json) => Videolist(
        kind: json["kind"],
        etag: json["etag"],
        nextPageToken: json["nextPageToken"],
        videos: List<VideoItem>.from(json["items"].map((x) => VideoItem.fromJson(x))),
        pageInfo: PageInfo.fromJson(json["pageInfo"]),
    );

    Map<String, dynamic> toJson() => {
        "kind": kind,
        "etag": etag,
        "nextPageToken": nextPageToken,
        "items": List<dynamic>.from(videos.map((x) => x.toJson())),
        "pageInfo": pageInfo.toJson(),
    };
}

class VideoItem {
    VideoItem({
        required this.kind,
        required this.etag,
        required this.id,
        required this.video,
    });

    String kind;
    String etag;
    String id;
    VideoSnippet video;

    factory VideoItem.fromJson(Map<String, dynamic> json) => VideoItem(
        kind: json["kind"],
        etag: json["etag"],
        id: json["id"],
        video: VideoSnippet.fromJson(json["snippet"]),
    );

    Map<String, dynamic> toJson() => {
        "kind": kind,
        "etag": etag,
        "id": id,
        "snippet": video.toJson(),
    };
}

class VideoSnippet {
    VideoSnippet({
        required this.publishedAt,
        required this.channelId,
        required this.title,
        required this.description,
        required this.thumbnails,
        required this.channelTitle,
        required this.playlistId,
        required this.position,
        required this.resourceId,
        required this.videoOwnerChannelTitle,
        required this.videoOwnerChannelId,
    });

    DateTime publishedAt;
    String channelId;
    String title;
    String description;
    Thumbnails thumbnails;
    String channelTitle;
    String playlistId;
    int position;
    ResourceId resourceId;
    String videoOwnerChannelTitle;
    String videoOwnerChannelId;

    factory VideoSnippet.fromJson(Map<String, dynamic> json) => VideoSnippet(
        publishedAt: DateTime.parse(json["publishedAt"]),
        channelId: json["channelId"],
        title: json["title"],
        description: json["description"],
        thumbnails: Thumbnails.fromJson(json["thumbnails"]),
        channelTitle: json["channelTitle"],
        playlistId: json["playlistId"],
        position: json["position"],
        resourceId: ResourceId.fromJson(json["resourceId"]),
        videoOwnerChannelTitle: json["videoOwnerChannelTitle"],
        videoOwnerChannelId: json["videoOwnerChannelId"],
    );

    Map<String, dynamic> toJson() => {
        "publishedAt": publishedAt.toIso8601String(),
        "channelId": channelId,
        "title": title,
        "description": description,
        "thumbnails": thumbnails.toJson(),
        "channelTitle": channelTitle,
        "playlistId": playlistId,
        "position": position,
        "resourceId": resourceId.toJson(),
        "videoOwnerChannelTitle": videoOwnerChannelTitle,
        "videoOwnerChannelId": videoOwnerChannelId,
    };
}

class ResourceId {
    ResourceId({
        required this.kind,
        required this.videoId,
    });

    String kind;
    String videoId;

    factory ResourceId.fromJson(Map<String, dynamic> json) => ResourceId(
        kind: json["kind"],
        videoId: json["videoId"],
    );

    Map<String, dynamic> toJson() => {
        "kind": kind,
        "videoId": videoId,
    };
}

class Thumbnails {
    Thumbnails({
        required this.thumbnailsDefault,
        required this.medium,
        required this.high,
        required this.standard,
        required this.maxres,
    });

    Default thumbnailsDefault;
    Default medium;
    Default high;
    Default? standard;
    Default? maxres;

    factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
        thumbnailsDefault: Default.fromJson(json["default"]),
        medium: Default.fromJson(json["medium"]),
        high: Default.fromJson(json["high"]),
        standard: json["standard"] == null ? null : Default.fromJson(json["standard"]),
        maxres: json["maxres"] == null ? null : Default.fromJson(json["maxres"]),
    );

    Map<String, dynamic> toJson() => {
        "default": thumbnailsDefault.toJson(),
        "medium": medium.toJson(),
        "high": high.toJson(),
        "standard": standard == null ? null : standard?.toJson(),
        "maxres": maxres == null ? null : maxres?.toJson(),
    };
}

class Default {
    Default({
        required this.url,
        required this.width,
        required this.height,
    });

    String url;
    int width;
    int height;

    factory Default.fromJson(Map<String, dynamic> json) => Default(
        url: json["url"],
        width: json["width"],
        height: json["height"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
    };
}

class PageInfo {
    PageInfo({
        required this.totalResults,
        required this.resultsPerPage,
    });

    int totalResults;
    int resultsPerPage;

    factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
        totalResults: json["totalResults"],
        resultsPerPage: json["resultsPerPage"],
    );

    Map<String, dynamic> toJson() => {
        "totalResults": totalResults,
        "resultsPerPage": resultsPerPage,
    };
}
