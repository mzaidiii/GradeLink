import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_link/models/event_details.dart';

class NewEvent extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return _NewEventState();
  }
}

class _NewEventState extends State<NewEvent>{
  final _formKey = GlobalKey<FormState>();

  var eventName='';
  var eventHost='';
  var eventType='';
  var description='';

  void _newEvent (){
    _formKey.currentState!.save();
    Navigator.of(context).pop(eventDeatils(
        eventName: eventName,
        eventHost: eventHost,
        eventType: eventType,
        eventDescription: description));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Your Project'),
      ),
      body: Padding(padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
          child:Padding(padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: InputDecoration(
                    label: Text('Event Name ' ,style: GoogleFonts.pacifico(
                        color: Colors.black
                    ),)
                ),
                onChanged: (value){
                  eventName = value;
                },
              ),
              const SizedBox(height: 10,),
              TextFormField(
                maxLength: 50,
                decoration: InputDecoration(
                    label: Text('Hosted By ' ,style: GoogleFonts.pacifico(
                        color: Colors.black
                    ),)
                ),
                onChanged: (value){
                  eventHost = value;
                },
              ),
              const SizedBox(height: 10,),
              TextFormField(
                maxLength: 50,
                decoration: InputDecoration(
                    label: Text('Event Type ' ,style: GoogleFonts.pacifico(
                        color: Colors.black
                    ),)
                ),
                onChanged: (value){
                  eventType = value;
                },
              ),
              const SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                    label: Text('Event Description ' ,style: GoogleFonts.pacifico(
                        color: Colors.black
                    ),)
                ),
                onChanged: (value){
                  description= value;
                },
              ),
              const SizedBox(height: 10,),
              Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
               ElevatedButton(onPressed: (){
                 _formKey.currentState!.reset();
               },
                   child: Text('Reset')),
                const SizedBox(width: 5,),
                ElevatedButton(onPressed: _newEvent,
                    child: Text('Launch Event')),
              ],
              )
            ],
          )
          ),
      ),
      ),
    );
  }
}