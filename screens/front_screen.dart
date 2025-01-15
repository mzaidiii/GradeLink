import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:grade_link/screens/home_page.dart';
import 'package:grade_link/screens/login_page.dart';

class FrontScreen extends StatelessWidget{
  const FrontScreen({super.key});
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.blueAccent,
       body:Center(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Image.asset('assets/icons/GL3.png',
                 height: 400,
                 width: 400,
                 ),
                 const SizedBox(height: 22,),
                 Text('Welcome To GradeLink..!', style: GoogleFonts.montserrat(
                   textStyle: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 30,
                     color: Colors.white
                   )
                 ),
                 ),
                 const SizedBox(height: 6,),
                 Text('Lets Shape a Future of Shared Opportunities and Continued Achivement  ',
                 style: GoogleFonts.acme(
                   textStyle: TextStyle(
                     fontSize: 20,
                     fontWeight: FontWeight.w500,
                     color: Theme.of(context).colorScheme.secondaryContainer,
                   )
                 ),
                   textAlign: TextAlign.center,
                 ),
                const SizedBox(height: 16,),
                ElevatedButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => Homepage()));
                },
                  style: ButtonStyle(
                  backgroundColor:MaterialStateProperty.all(Colors.cyan),
                  ),
                    child: Text('Login', style: TextStyle(
                      color: Colors.white,
                    ),
                    ),
                ),
               ],
             )
           ),
     );
  }
}












