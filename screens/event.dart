import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_link/data/dummy_event.dart';
import 'package:grade_link/models/event_details.dart';
import 'package:grade_link/screens/new_event.dart';

class Events extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return _EventsState();
  }
}
class _EventsState extends State<Events>{
  late  List<eventDeatils> event =[];

  @override
  void initState() {
    super.initState();
    event= dummyEvent;
  }

  void _addevent ()async{
    final response = await Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => NewEvent()));

    if (response==null){
      return;
    }
   setState(() {
     event.add(response);
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events', style: GoogleFonts.permanentMarker(),),
        actions: [
          IconButton(onPressed: _addevent,
              icon: Icon(Icons.add_alert_sharp))
        ],
      ),
      body: ListView.builder(
        itemCount: event.length,
           itemBuilder: (ctx , index){
          final events = event[index];
          return Padding(padding: const EdgeInsets.all(16),
          child: Card(
            elevation: 5.0,
            color: Color.fromARGB(132, 178, 241, 241),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            clipBehavior: Clip.antiAlias,
            child: Padding(padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10,),
                  Text('Event Name : ${events.eventName}',
                    style: GoogleFonts.kanit(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.black
                    ),),
                  const SizedBox(height: 6,),
                  Text('Hosted By : ${events.eventHost}',
                    style:GoogleFonts.ubuntu(
                      fontSize: 14,
                      color: Colors.black,
                    ),),
                  const SizedBox(height: 3,),
                  Text('Type Of Event : ${events.eventType}',
                    style:GoogleFonts.ubuntu(
                      fontSize: 14,
                      color: Colors.black,
                    ),),
                  const SizedBox(height: 3,),
                  Text('Description : \n ${events.eventDescription}',
                    style:GoogleFonts.ubuntu(
                      fontSize: 14,
                      color: Colors.black,
                    ),),
                ],
              ),),
          ),);
           }) ,
    );
  }
}