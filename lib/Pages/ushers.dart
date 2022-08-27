// ignore_for_file: prefer_const_constructors, avoid_print
//try catch block removed
import 'package:flutter/material.dart';
import './mydrawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Ushers extends StatefulWidget {
  const Ushers({ Key? key }) : super(key: key);

  @override
  State<Ushers> createState() => _UshersState();
}

class _UshersState extends State<Ushers>{
  static var database=FirebaseFirestore.instance;
  bool loading=false;
  int zero=0;
  //backup
  Stream usher=database.collection("Ushers").snapshots();

  @override
  void initState(){
    // TODO: implement initState
     fetchusherdata();
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    fetchusherdata();
    return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.pink[700],
       title: Text("USHERS"),
       centerTitle: true,
     ),
      drawer: SafeArea(
        child:draw(context)
      ), 
     body: ListView(
       children: [
         Center(
           child:   
           Column(
            children: [
            StreamBuilder(
              stream: usher,
              builder: (context,snapshot)
            {
              if(snapshot.hasError)
              {
                return Text("Ran into an error fetching the stream");
              }
              if(snapshot.connectionState==ConnectionState.waiting)
              {
                return Text("Loading");
              }
              final data=snapshot.requireData;
              return ListView.builder(
                itemBuilder: ((context, index) {
                return ListTile(
                  title: Text(data!.toString())
                );
              }));
            })
            ],
           )
         ),
       ],
     ),
    );
  }
 fetchusherdata()async{
 await database.collection("Ushers").get().then(
      (res) {
       if(res.docs.isEmpty)
       {
        res.docs.forEach((element) {
          print(element.data()["Name"]);
    ListView.builder(itemBuilder: ((context, index) {
           return ListTile(
            title: element.data()["Name"],
            trailing: element.data()["Role"],
            leading:element.data()["Branch"] ,
          ); 
     }))  ; 
        },);
        loading=true;
        print("Successfully completed");
      }
      else{
        return Text("THE LIST IS EMPTY");
      }
      },
      onError: (e) => print("Error completing: $e"),
    );
    
}}