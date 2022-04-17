// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:soa_prototype1/Facebook.dart';
import 'package:soa_prototype1/events.dart';
import 'package:soa_prototype1/homepage.dart';
import 'package:soa_prototype1/ushers.dart';
void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    routes:{
      "/":(context) => Home(),
      "/ushers":(context) => Ushers(),
      "/events":((context) => Events()),
      "/live":(context) => Live()
    } ,
  ));
}