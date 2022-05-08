// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:soa_prototype1/mydrawer.dart';
class Ushers extends StatefulWidget {
  const Ushers({ Key? key }) : super(key: key);

  @override
  State<Ushers> createState() => _UshersState();
}

class _UshersState extends State<Ushers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.pink[700],
       title: Text("USHERS"),
       centerTitle: true,
     ),
      drawer: SafeArea(
        child:draw(context)
      ), 
     body: Center(
       child:Text("Place a list of ushers")
     ),
    );
  }
}