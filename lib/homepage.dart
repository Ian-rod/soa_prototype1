// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';

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
        backgroundColor: Colors.pink[900],
      ),
      drawer: SafeArea(
        child: Drawer(
          backgroundColor: Colors.pink[900],
          child: ListView(
          
            padding: EdgeInsets.all(3),
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Rev",
                style: TextStyle(color: Colors.white),
                ),
                onTap: (){//navigate to rev page 
                },
              ),
               ListTile(
                leading: Icon(Icons.person),
                title: Text("Ushers",
                style: TextStyle(color: Colors.white),
                ),
                onTap: (){Navigator.pushReplacementNamed(context,"/ushers"); 
                },),
                            ListTile(
                leading: Icon(Icons.person),
                title: Text("Events",
                style: TextStyle(color: Colors.white),
                ),
                onTap: (){Navigator.pushReplacementNamed(context,"/events");
                },),
                            ListTile(
              leading: Icon(Icons.person),
              title: Text("Facebook live",
              style: TextStyle(color: Colors.white),
              ),
              onTap: (){Navigator.pushReplacementNamed(context,"/live");
              },),
                          ListTile(
              leading: Icon(Icons.person),
              title: Text("Book appointment",
              style: TextStyle(color: Colors.white),
              ),
              onTap: (){//navigate to appointment page 
              },)
            ],
          ),
        ),
      ),
      body:Center(
        child: Text("To place upcoming major event here"),
      )
      );
  }
}