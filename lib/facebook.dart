// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:soa_prototype1/mydrawer.dart';
class Live extends StatefulWidget {
  const Live({ Key? key }) : super(key: key);

  @override
  State<Live> createState() => _LiveState();
}

class _LiveState extends State<Live> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
       backgroundColor: Colors.pink[700],
       title: Text("Live and recorded events"),
       centerTitle: true,
     ),
      drawer: SafeArea(
        child: draw(context)
      ), 
     body: Center(
       child:Text("Attach using facebook API  consider using youtube to avoid verification to videos page")
     ),
    );
  }
}