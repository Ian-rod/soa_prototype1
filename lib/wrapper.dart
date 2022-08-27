// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soa_prototype1/Pages/homepage.dart';
import 'package:soa_prototype1/Pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
//determine which page to display
class Wrapper extends StatefulWidget {
  const Wrapper({ Key? key }) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user=Provider.of<User?>(context);
    if (user==null)
    {
       return Login();
    }

    print(user);
    return Home();
    
  }
}