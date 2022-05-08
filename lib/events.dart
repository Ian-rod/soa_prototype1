// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, avoid_web_libraries_in_flutter
import 'package:flutter/material.dart';
import 'package:soa_prototype1/mydrawer.dart';
import 'package:table_calendar/table_calendar.dart';
import './daily.dart';
class Events extends StatefulWidget {
  const Events({ Key? key }) : super(key: key);

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> { 
  TextEditingController eventcontroller=TextEditingController();
  var selectedEvents={};
  CalendarFormat format=CalendarFormat.month;
  DateTime selectedDay=DateTime.now();
  DateTime focusedDay=DateTime.now();
  var daysto;
  @override
  void initState() {
    selectedEvents={};
    super.initState();
  }
  List getEventsFromDay(DateTime date)
  {
   if (date.weekday == DateTime.tuesday) {
     return [Daily("Appointment"),(selectedEvents[date]??"")];
  }
  else if (date.weekday == DateTime.wednesday) {
    return [Daily("Communion"),(selectedEvents[date]??"")];
  }
  else if (date.weekday == DateTime.friday) {
    return [Daily("Prophetic service"),(selectedEvents[date]??"")];
  }
    return selectedEvents[date]??[];
  }
  @override
  void dispose() {
    eventcontroller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: Colors.pink[700],
       title: Text("Events"),
       centerTitle: true,
     ), drawer: SafeArea(
        child:draw(context)
      ),
     body: Wrap(
       children: [
         Card(
           margin: EdgeInsets.all(7),
  child:TableCalendar(  
  firstDay: DateTime(2010),
  lastDay: DateTime(2050),
  focusedDay: focusedDay,
  calendarFormat: format,
  onFormatChanged: (CalendarFormat formated) 
  {
    setState(() {
           format=formated;
    });
  },
  selectedDayPredicate: (day) {
  return isSameDay(selectedDay, day);
},
  onDaySelected: ( DateTime selected,DateTime focused)
  {
    //set the focus to day selected
    setState(() {
          selectedDay=selected;
          focusedDay=focused;
          
    });
  daysto=DateTime.now().difference(selectedDay).inDays;
  },
  headerStyle: HeaderStyle(
    formatButtonShowsNext: false
  ),
  eventLoader:getEventsFromDay,

),
 ),
 ...getEventsFromDay(selectedDay).map((var event) =>Container(margin: EdgeInsets.all(3),child:ListTile(title: Text(event.toString(),
   )),
 )),
 Center(
   child:
   daysto==null?Text("Today"):
   daysto<=0?
   Text("In "+(daysto*-1).toString()+" day(s)"):Text((daysto).toString()+" day(s) ago")
 ),
],),
floatingActionButton:FloatingActionButton.extended(onPressed:()=>showDialog
  (context: context, builder:(context)=>AlertDialog(
    title: Text("Add Event"),
    content:TextFormField(controller: eventcontroller,),
  
    actions: [
      TextButton(onPressed:(){
        if(eventcontroller.text.isEmpty)
        {
          Navigator.pop(context);
        }
        else{
         if(selectedEvents[selectedDay]!=null)
          {
            selectedEvents[selectedDay].add(Daily(eventcontroller.text));
            eventcontroller.clear();
          }
          else{
              selectedEvents[selectedDay]=Daily(eventcontroller.text);
              eventcontroller.clear();
          }
          Navigator.pop(context);
        }
        return;
      }, child: Text("ok")),
       TextButton(onPressed:() => Navigator.pop(context), child: Text("Cancel"))
    ],
  )),
 icon:Icon(Icons.add),
 label:Text("Add a personal event") ,
backgroundColor: Color.fromARGB(255, 243, 20, 94),
tooltip: "Add an event",
 ),
      );
  }
}