// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soa_prototype1/Pages/appointment.dart';
import 'package:soa_prototype1/Pages/signup.dart';
import 'package:soa_prototype1/Wrapper.dart';
import 'package:soa_prototype1/serve.dart';
import 'Pages/live.dart';
import './Pages/events.dart';
import './Pages/ushers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './Wrapper.dart';
Future<void> main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(providers: [
      StreamProvider<User?>.value(value:Serve.status, 
      initialData: null,
      )
    ],
    child:
    MaterialApp(
    home: Wrapper(),
    theme: ThemeData(
      primarySwatch: Colors.pink,
      primaryColor: Colors.pink[700]
    ),
    debugShowCheckedModeBanner: false,
    routes:{
      "/ushers":(context) => Ushers(),
      "/events":((context) => Events()),
      "/live":(context) => View(),
      "/signup":((context) => Signup()),
      "/book":(context) => Book()
    } ,
  )));
}