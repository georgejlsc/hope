

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main_screen.dart';


var ip_address="192.168.29.199";

var uiduser;
var access_total_amt;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.teal,
        textTheme: GoogleFonts.baiJamjureeTextTheme(
          Theme.of(context).textTheme,
        )
      ),
      home: main_screen(),
    );
  }
}

