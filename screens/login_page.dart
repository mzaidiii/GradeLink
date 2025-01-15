import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_link/screens/home_page.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() {
   return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage>{
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  void _login (){
    if (_username.text== 'admin' && _password.text== '123456789'){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login Sucessfull')));
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => Homepage()));
    }else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid username or Password')));
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/icons/GL3.png',
            width: 200,
            height: 200,),
            const SizedBox(height: 30,),
            TextField(
              controller: _username,
              decoration: InputDecoration(
                label: Text('Username', style: GoogleFonts.lobster(
                    fontWeight: FontWeight.bold,
                   color: Colors.black
                ),),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8), ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                  color: Colors.white,
                  width: 3.0, ),
                  borderRadius: BorderRadius.circular(8),
                ),
               ),

              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 8,),
            TextField(
              controller: _password,
              decoration: InputDecoration(
                label: Text('Password', style:GoogleFonts.lobster(
                    fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8), ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                    color: Colors.white,
                    width: 3.0, ),
                    borderRadius: BorderRadius.circular(8),
                  )
                ),

              keyboardType: TextInputType.text,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextButton(onPressed: (){},
                    child:Text('Forgotten Password?',
                    style: TextStyle(
                      color: Colors.black,

                    ),))
              ],
            ),
            const SizedBox(height: 30,),
            ElevatedButton(onPressed:_login,
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(40, 25)),
              ),
                child: Text('Login' , style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
                ),
            )
          ],
        ),
        )
      ) ,
    );
  }
}