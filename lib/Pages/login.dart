// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:soa_prototype1/serve.dart';
class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
var passwordcontroller=TextEditingController();
  var emailcontroller=TextEditingController();
   var formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("Log in"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: ListView(
          children: [
            Center(
              child: Form(
                key: formkey,
                child: Column(
                 children: [ 
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    controller: emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                    hintText: "Enter your email address",
                      icon: Icon(Icons.email,
                      )
                    ),
                    validator: (value){
                      if(value==null){
                          return "Field cannot be null";
                      }
                      if(value.isEmpty)
                      {
                        return "This field is required";
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
                  ElevatedButton(onPressed:()async{
                     if (formkey.currentState!.validate()) {
                         //add a firebase submission data
                    await Serve.emailsignin(emailcontroller.text, passwordcontroller.text);
                    ScaffoldMessenger.of(context).showSnackBar(Serve.notification);
                    }}, child: Text("Log in")),
                    SizedBox(height:30),
                Text("..........New here try signing up..........."),
                SizedBox(height:30),
                ElevatedButton(onPressed: (){
                  Navigator.pushNamed(context, "/signup");
                }, child: Text("Sign up"))
                 ],
                ),
              ),
          ),

        ],),
      ),
    );
  }
}