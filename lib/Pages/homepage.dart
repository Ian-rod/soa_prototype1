// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import './mydrawer.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Center(
            child: Column(
              children: [
               Text("To place upcoming major event here"),
               ElevatedButton(onPressed: null, child: Text("Tap to book an appointment"))
              ],
            ),
          ),
        ),
      )
      );
  }
}