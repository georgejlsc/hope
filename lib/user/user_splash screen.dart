import 'dart:async';


import 'package:children/main_screen.dart';
import 'package:children/user/user_Login.dart';
import 'package:children/user/user_homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../admin/admin_Login.dart';
import '../admin/admin_homepage.dart';

import 'package:children/main.dart';




var session_key;

class user_Splash_Screen extends StatefulWidget {
  _user_Splash_ScreenState createState() => _user_Splash_ScreenState();
}

class _user_Splash_ScreenState extends State<user_Splash_Screen> {


  void initState() {
    getValidationData().whenComplete(() async {
      await Timer(Duration(seconds: 2), () {
        session_key == null
            ? Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => user_signin()))
            : Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>user_Home_Page_a()));
      });
    });
    setState(() {

      Get_uid();

    });

    super.initState();
  }

  Future getValidationData() async {
    final SharedPreferences sharedprefs = await SharedPreferences.getInstance();
    var obtainedemail = await sharedprefs.getString('user_get-id');
    setState(() {
      session_key = obtainedemail;
    });
    print('thisis service  value $session_key');
  }

  Get_uid()async{
    final SharedPreferences sharedprefs = await SharedPreferences.getInstance();
    var obtainid = await sharedprefs.getString('get_userid');
    setState(() {
      uiduser = obtainid!;
    });

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