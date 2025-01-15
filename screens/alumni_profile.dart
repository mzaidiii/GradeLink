import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_link/models/student_details.dart';

class AlumniDetail extends StatelessWidget {
  final StudentDetail student;

  const AlumniDetail({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${student.name}',
          style: GoogleFonts.robotoSlab(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Main alignment centered
          children: [
            // Card with Image
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Hero(
                tag: student.name,
                child: Image.asset(
                  student.studentImage,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Centered Student Name
            Text(
              student.name,
              style: GoogleFonts.pacifico(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            // Description Section (Aligned to the Left)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align description to the left
                children: [
                  Text(
                    'Pass-out Year: ${student.yearOfPassOut}',
                    style: GoogleFonts.ubuntu(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Experience: ${student.experince}',
                    style: GoogleFonts.ubuntu(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Current Job: ${student.currentCompany}',
                    style: GoogleFonts.ubuntu(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Course: ${student.course}',
                    style: GoogleFonts.ubuntu(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Branch: ${student.branch}',
                    style: GoogleFonts.ubuntu(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
