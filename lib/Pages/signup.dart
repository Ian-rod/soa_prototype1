// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:soa_prototype1/serve.dart';
class Signup extends StatefulWidget {
  const Signup({ Key? key }) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var passwordcontroller=TextEditingController();
  var emailcontroller=TextEditingController();
  var namecontroller=TextEditingController();
  var confirmationcontroller=TextEditingController();
 var role="Congregation member";
  //add name and other additional parameters
  var formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(

        title: Text("Sign up"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: ListView(
          children:[Center(
              child: Form(
                key: formkey,
                child: Column(
                 children: [ 
                  TextFormField(  
                  decoration: InputDecoration(
                    hintText: "Enter your name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5
                      )
                    ),
                    icon:Icon(Icons.person
                    )
                  ),
                    controller: namecontroller,
                    keyboardType: TextInputType.name,
                    validator: (value){
                        if(value==null)
                        {
                          return "Field cannot be null";
                        }
                        if(value.isEmpty)
                        {
                          return "This field is required";
                        }
                        return null;
                    },
                  ),//place drop down menu for role selection
                  SizedBox(
                    height: 40,
                  ),
                  Text("Select your role"),
                  DropdownButton(
                  //  value: role,
                    items:[DropdownMenuItem(child: Text("Congregation member"), value: 0,),DropdownMenuItem(child: Text("Usher"), value: 1,),DropdownMenuItem(child: Text("Media"), value: 2,),DropdownMenuItem(child: Text("Praise Team"), value: 3,),DropdownMenuItem(child: Text("Cleaning staff"), value: 4,)], 
                  onChanged: (value){
                    setState(() {
                    if(value==0)
                    {
                      role="Congregation member";
                    }
                    else if(value==1)
                    {
                      role="Usher";
                    }
                    else if(value==2)
                    {
                      role="Media";
                    }
                    else if(value==3)
                    {
                      role="Praise team";
                    }
                    else if(value==4)
                    {
                      role="Cleaning staff";
                    }
                     });
                  },
                  hint: Text(role),
                  ),
                  TextFormField(
                    controller: emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)
                    ),
                    hintText: "Enter your email address",
                      icon: Icon(Icons.email,
                      )
                    ),
                    validator: (value){
                      if(value==null){
                          return "Field cannot be null";
                      }
                     else if(value.isEmpty)
                      {
                        return "This field is required";
                      }
                     else if(RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(value))
                    {
                        return "Please enter a valid email address";
                    }
                      return null;
                    }, 
                  ),
                  SizedBox(height: 40),
                  TextFormField(
                    decoration: InputDecoration(
                     hintText: "Enter your password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)
                    ),
                    icon:Icon(Icons.password)
                  ),
                    controller: passwordcontroller,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value){
                        if(value==null)
                        {
                          return "Field cannot be null";
                        }
                        if(value.isEmpty)
                        {
                          return "This field is required";
                        }
                        return null;
                    },
            
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                      decoration: InputDecoration(
                    hintText: "Confirm your password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)
                    ),
                    icon:Icon(Icons.password)
                  ),
                    controller: confirmationcontroller,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value){
                        if(value==null)
                        {
                          return "Field cannot be null";
                        }
                        if(value.isEmpty)
                        {
                          return "This field is required";
                        }
                        if(value!=passwordcontroller.text)
                        {
                          return "Password do not match";
                        }
                        return null;
                    },
            
                  ),
                  SizedBox(height: 40,),
                  ElevatedButton(onPressed:()async{
                     if (formkey.currentState!.validate()) {
                         //add a firebase submission data
                    await Serve.emailsignup(emailcontroller.text, passwordcontroller.text);
                    ScaffoldMessenger.of(context).showSnackBar(Serve.notification);
                     Navigator.pushReplacementNamed(context, "/login");
                             setState(() {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                          return AlertDialog(
                          title: Text(""),
                          content: Text("Please enter your new details here"),
                          actions: [
                            ElevatedButton(
                          child: Text("Okay"),
                          onPressed: () {Navigator.of(context).pop();},
                        ),
                          ],
                          elevation: 5,);});
                    });
                    }}, child: Text("Sign up")),
                    SizedBox(height:30),
                 ],
                ),
              ),
          ),], 
        ),
      ),
    );
  }
}