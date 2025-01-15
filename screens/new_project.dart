import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_link/models/project_details.dart';

class NewProject extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return _NewProjectState();
  }
}

class _NewProjectState extends State<NewProject>{
  final _formkey = GlobalKey<FormState>();
  var projectsName='';
  var yourname='';
  var description='';

  void _newProject (){
    _formkey.currentState!.save();
    Navigator.of(context).pop(ProjectDetails(
        description: description,
        projectName: projectsName,
        projectOwner:yourname));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Your Project '),
      ),
      body:  Form(
        key: _formkey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 100,
                decoration: InputDecoration(
                    label: Text('Project name', style: GoogleFonts.pacifico(
                      color: Colors.black
                    ),)
                ),
               onChanged: (value){
                  projectsName=value;
               },
              ),
              const SizedBox(height: 8,),
              TextFormField(
                maxLength: 40,
                decoration: InputDecoration(
                    label: Text('Your Name', style: GoogleFonts.pacifico(
                      color: Colors.black
                    ),)
                ),
                onChanged: (value){
                  yourname= value;
                },
              ),
              const SizedBox(height: 8,),
              TextFormField(
                maxLength: 200,
                decoration: InputDecoration(
                    label: Text('Project description', style: GoogleFonts.pacifico(
                      color: Colors.black
                    ),)
                ),
                onChanged: (value){
                  description = value;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ElevatedButton(onPressed: (){
                    _formkey.currentState!.reset();

                  },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white
                      ),
                      child: Text('cancel', style: TextStyle(
                        color: Colors.black
                      ),)),
                  const SizedBox(width: 10,),
                  ElevatedButton(onPressed:_newProject,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white
                      ),
                      child: Text('Save Project', style: TextStyle(
                          color: Colors.black
                      )))

                ],
              )
            ],
          ) ),
    );
  }
}