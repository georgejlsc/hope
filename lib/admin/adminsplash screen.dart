import 'dart:async';


import 'package:children/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'admin_Login.dart';
import 'admin_homepage.dart';

var session_key;

class Splash_Screen extends StatefulWidget {
  _Splash_ScreenState createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {


  void initState() {
    getValidationData().whenComplete(() async {
      await Timer(Duration(seconds: 2), () {
        session_key == null
            ? Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => signin()))
            : Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => Home_Page_a()));
      });
    });
    setState(() {});

    super.initState();
  }

  Future getValidationData() async {
    final SharedPreferences sharedprefs = await SharedPreferences.getInstance();
    var obtainedemail = await sharedprefs.getString('admin_get-id');
    setState(() {
      session_key = obtainedemail;
    });
    print('thisis service  value $session_key');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(

        color: Colors.white10,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Loading......",style: GoogleFonts.baiJamjuree(
                textStyle: const TextStyle(
                    fontSize: 15, color: Colors.teal,fontWeight: FontWeight.w600,letterSpacing: .5)),
            ),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(
              color: Colors.teal,
            ),
          ],
        ),
      ),
    );
  }



}