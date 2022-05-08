// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:soa_prototype1/mydrawer.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("WELCOME"),
        backgroundColor: Colors.pink[700],
      ),
      drawer: SafeArea(
        child: draw(context)
      ),
      body:Center(
        child: Text("To place upcoming major event here"),
      )
      );
  }
}