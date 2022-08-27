// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:soa_prototype1/Pages/mydrawer.dart';
import 'package:soa_prototype1/serve.dart';
import 'package:table_calendar/table_calendar.dart';
class Book extends StatefulWidget {
  const Book({ Key? key }) : super(key: key);

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {
  var database=FirebaseFirestore.instance;
  DateTime focusedDay=DateTime.now();
   DateTime selectedDay=DateTime.now();
   var formkey=GlobalKey<FormState>();
   var appointmenttime="9am";
   var reasoncontoller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book appointment form"),
        centerTitle: true,
      ),
     drawer: draw(context), 
     body: Form(child: ListView(
      children: [
        Form(
          key: formkey,
          child: Column(
            children: [
              Text("Select the appointment date"),
              SizedBox(height: 20,)
              ,
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TableCalendar(
                focusedDay:focusedDay,
               firstDay: DateTime( DateTime.now().year), 
               lastDay:  DateTime( DateTime.now().year+30),
                     onDaySelected: ( DateTime selected,DateTime focused)
                    {
                      //set the focus to day selected
                      setState(() {
                            selectedDay=selected;
                            focusedDay=focused;    
                      });},
                        selectedDayPredicate: (day) {
                        return isSameDay(selectedDay, day);
                        },
               ),
                  ),
                ),
               SizedBox(height: 40,),
               Text("Select appointment time"),
               SizedBox(height: 20,),
              DropdownButton(
                hint: Text(appointmenttime),
                      items:[DropdownMenuItem(child: Text("9am"), value: 0,),DropdownMenuItem(child: Text("10am"), value: 1,),DropdownMenuItem(child: Text("11am"), value: 2,),DropdownMenuItem(child: Text("12pm"), value: 3,),DropdownMenuItem(child: Text("1pm"), value: 4,)], 
                    onChanged: (value){
                      setState(() {
                      if(value==0)
                      {
                        appointmenttime="9am";
                      }
                      else if(value==1)
                      {
                        appointmenttime="10am";
                      }
                      else if(value==2)
                      {
                        appointmenttime="11am";
                      }
                      else if(value==3)
                      {
                        appointmenttime="12pm";
                      }
                      else if(value==4)
                      {
                        appointmenttime="1pm";
                      }
                       });}),
                       SizedBox(height: 40,),
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Center(
                      child: TextFormField(
                        decoration: InputDecoration(
                         hintText: "Enter the appointment reason",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)
                        ),
                      ),
                        controller: reasoncontoller,
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
                    ),
                  ), 
                  SizedBox(height: 40),
                  ElevatedButton(onPressed: () async{
                    if(formkey.currentState!.validate())
                    {
                      var data={
                        "Date":selectedDay,
                        "Personbooked":Serve.auth.currentUser!.email,
                        "Reason":reasoncontoller.text,
                        "appointmenttime":appointmenttime.toString()
                      };
                      database.collection("appointments").add(data).then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Appointment booked succesfully")));
                      reasoncontoller.clear();
                      });
                      //submitdata to firebase
                    }
                  }, child: Text("Book appointment"))   
            ],
          ),
        )
      ],
      )),
    );
  }
}