import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_link/data/dummy_data.dart';
import 'package:grade_link/models/student_details.dart';
import 'package:grade_link/screens/alumni_profile.dart';
import 'package:grade_link/screens/chat_box.dart';
import 'package:grade_link/screens/event.dart';
import 'package:grade_link/screens/project_screen.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() {
    return _HomepageState();
  }
}

class _HomepageState extends State<Homepage> {
  List<StudentDetail> students = [];

  @override
  void initState() {
    super.initState();
    students = details;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'GradeLink',
          style: GoogleFonts.robotoSlab(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 15, 184, 225),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Let\'s Connect...',
              style: GoogleFonts.dancingScript(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (ctx, index) {
                final student = students[index];
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => AlumniDetail(student: student),
                      ),
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: const Color.fromARGB(255, 18, 182, 163),
                    elevation: 4,
                    margin: const EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              student.studentImage,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  student.name,
                                  style: GoogleFonts.kanit(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Pass-out Year: ${student.yearOfPassOut}',
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Experience: ${student.experince}',
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Current Job: ${student.currentCompany}',
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Course: ${student.course}',
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Branch: ${student.branch}',
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => ChatScreen()));
                            },
                            icon: const Icon(Icons.chat_outlined, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => const Homepage()),
                );
              },
              icon: const Icon(Icons.home),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
               Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => ProjectScreen()));
              },
              icon: const Icon(Icons.cases_outlined),
            ),
            label: 'Projects',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => Events()),
                );
              },
              icon: const Icon(Icons.calendar_month_outlined),
            ),
            label: 'Events',
          ),
        ],
      ),
    );
  }
}
