import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:grade_link/data/dummy_projects.dart';
import 'package:grade_link/models/project_details.dart';
import 'package:grade_link/screens/new_project.dart';

class ProjectScreen extends StatefulWidget{
  const ProjectScreen({super.key});
  @override
  State<StatefulWidget> createState() {
   return _ProjectScreenState();
  }
}

class _ProjectScreenState extends State<ProjectScreen>{
  List<ProjectDetails> projectWork=[];

  @override
  void initState() {
    projectWork= projectDetails;
    super.initState();
  }

  void _addProject ()async{
    final response=
    await Navigator.of(context).push<ProjectDetails>
      (MaterialPageRoute(builder: (ctx)=> NewProject()));

    if (response== null){
      return;
    }
    setState(() {
      projectWork.add(response);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Projects',style: GoogleFonts.robotoSlab(
            fontWeight: FontWeight.bold,
            fontSize: 20
        ),
        ),
        actions: [
          IconButton(onPressed: _addProject,
              icon:Icon(Icons.add)
          ),
        ],
      ),
      body: ListView.builder(
      itemCount: projectWork.length,
      itemBuilder: (ctx , index  ){
        final project = projectWork[index];
        return Padding(padding: EdgeInsets.all(16),
        child: InkWell(
          onTap: (){},
          child: Card(
            elevation: 5.0,
            clipBehavior: Clip.antiAlias,
            color: Color.fromARGB(132, 178, 241, 241),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Project Name :${project.projectName}', style: GoogleFonts.kanit(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,),
                ),
                Text('by: ${project.projectOwner}', style: GoogleFonts.ubuntu(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                ),),
                Text('Description:\n ${project.description}', style: GoogleFonts.ubuntu(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: Colors.black
                ),),
                const SizedBox(height: 4,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ElevatedButton(onPressed: (){},
                      child:Text('Apply Now ' , style: GoogleFonts.ptSerif(
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),),
                    )
                  ],
                )
              ],
            ),)
          ),
        ),);
      }) ,
    );
  }
}