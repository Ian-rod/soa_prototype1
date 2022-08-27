// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:soa_prototype1/serve.dart';

Widget draw( BuildContext context)
{
  return Drawer(
    
          backgroundColor: Colors.pink[700],
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
                onTap: ()async{
                  Navigator.pushReplacementNamed(context,"/ushers"); 
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
              title: Text("videos",
              style: TextStyle(color: Colors.white),
              ),
              onTap: (){Navigator.pushReplacementNamed(context,"/live");
              },),
                          ListTile(
              leading: Icon(Icons.person),
              title: Text("Book appointment",
              style: TextStyle(color: Colors.white),
              ),
              onTap: (){Navigator.pushReplacementNamed(context,"/book"); 
              },),
                                        ListTile(
              leading: Icon(Icons.logout),
              title: Text("Sign Out",
              style: TextStyle(color: Colors.white),
              ),
              onTap: ()async{
                await Serve.logout();
                ScaffoldMessenger.of(context).showSnackBar(Serve.notification);
              },)
            ],
          ),
  );
}