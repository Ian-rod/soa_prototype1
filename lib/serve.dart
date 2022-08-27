// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Serve{
  static var auth=FirebaseAuth.instance;
  static late var notification;
  static Stream<User?> get status=>auth.authStateChanges();
 static emailsignin(email,password)async{
    try{
       await auth.signInWithEmailAndPassword(email: email, password: password);
      notification=SnackBar(content:Text("Welcome "+email),
      duration: Duration(seconds: 10),
       );
    }
    catch(e){
      notification=SnackBar(content:Text("Ran into "+e.toString()+" while signing in please retry"),
      duration: Duration(seconds: 10),
       );
    }
   
  }
   static phonesignin(phone)async{
        try{
       await auth.signInWithPhoneNumber(phone);
      notification=SnackBar(content:Text("Welcome "+phone),
      duration: Duration(seconds: 10),
       );
    }
    catch(e){
     notification=SnackBar(content:Text("Ran into "+e.toString()+" while signing in try another method"),
     duration: Duration(seconds: 10),
      );
    }
  }
  static emailsignup(email,password)async{
      try{
       await auth.createUserWithEmailAndPassword(email: email, password: password);
      notification=SnackBar(content:Text("Welcome "+email),
      duration: Duration(seconds: 10),
      );
    }
    catch(e){
      print(e.toString());
       notification=SnackBar(content:Text("Ran into "+e.toString()+" while signing up"),
       duration: Duration(seconds: 10),
       );
    } 
  }

 static logout()async{
    try{
       await auth.signOut();
       notification=SnackBar(content: Text(auth.currentUser!.email.toString()+" Signed out succesfully")
       ,
       duration: Duration(seconds: 10),
       );
       
    }
    catch(e){
      notification=SnackBar(content: Text("Ran into "+e.toString()+" while signing out"),
      duration: Duration(seconds: 10),
      );
    }
  }
}