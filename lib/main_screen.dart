
import 'package:children/user/user_Login.dart';
import 'package:children/user/user_splash%20screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import 'admin/admin_Login.dart';
import 'admin/adminsplash screen.dart';

class main_screen extends StatefulWidget {
  const main_screen({Key? key}) : super(key: key);

  @override
  State<main_screen> createState() => _main_screenState();
}

class _main_screenState extends State<main_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Column(
          children: [

            SizedBox(height: 420),
            Padding(
              padding:  EdgeInsets.all(12.0),
              child: SizedBox(width: 190,height: 45,
                child: ElevatedButton(
                    onPressed: () {
                      // setState(() {
                      //   Submit();
                      // });

                      Navigator.push(context,
                           MaterialPageRoute(builder: (context) => Splash_Screen()));
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    ),
                    child: Text("Admin",style: GoogleFonts.baiJamjuree(
                        textStyle: const TextStyle(
                            fontSize: 15, color: Colors.teal,fontWeight: FontWeight.w700,letterSpacing: .5)) ),),
              )
            ),

            Padding(
                padding:  EdgeInsets.all(12.0),
                child: SizedBox(width: 190,height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      // setState(() {
                      //   Submit();
                      // });

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => user_Splash_Screen()));
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    ),
                    child: Text("User",style: GoogleFonts.baiJamjuree(
                        textStyle: const TextStyle(
                            fontSize: 15, color: Colors.teal,fontWeight: FontWeight.w700,letterSpacing: .5)) ),),
                )
            ),





          ],
        )
      ),

    );
  }
}
