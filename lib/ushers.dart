// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
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
       backgroundColor: Colors.pink[900],
       title: Text("USHERS"),
       centerTitle: true,
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
     body: Center(
       child:Text("Place a list of ushers")
     ),
    );
  }
}