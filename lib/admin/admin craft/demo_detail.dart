import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

class demo_detail extends StatefulWidget {
  var datapass;

  demo_detail({required this.datapass});

  @override
  State<demo_detail> createState() => _demo_detailState();
}

class _demo_detailState extends State<demo_detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
        Positioned(left: 20,top: 40,
          child: Container(
          height: 500,
          width: 320,

          //color: Colors.grey[200],
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: Colors.white70,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                )
              ]),),
        ),

          Positioned(top: 70,left: 43,
            child: Container(
                height: 170,
                width: 270,

                //color: Colors.grey[200],
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: Colors.white70,

                ),
                child: Image.network(widget.datapass.image) ),
          ),

          Positioned(top: 265,left: 90,
              child: Text(widget.datapass.name,style: GoogleFonts.racingSansOne(
                  textStyle: const TextStyle(
                      fontSize: 22, color: Colors.grey,letterSpacing: .1,fontWeight: FontWeight.w400))),),
          Positioned(top: 269,right: 90,
              child: Text(widget.datapass.price,style: GoogleFonts.racingSansOne(
                  textStyle: const TextStyle(
                      fontSize: 18, color: Colors.black,letterSpacing: .1,fontWeight: FontWeight.w200))),),
          Positioned(top: 269,right: 79,
            child: Text("₹",style: GoogleFonts.racingSansOne(
                textStyle: const TextStyle(
                    fontSize: 18, color: Colors.black,letterSpacing: .1,fontWeight: FontWeight.w400))),),

          Positioned(top: 227,right: 80,
            child: Text(widget.datapass.craft_id,style: GoogleFonts.baiJamjuree(
                textStyle: const TextStyle(
                    fontSize: 8, color: Colors.grey,letterSpacing: .1,fontWeight: FontWeight.w400))),),

          Positioned(top: 70,left: 250,
          child:  Container(
              height: 44,
              width: 80,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/a7.png")),
              ),
          ),
          ),

          Positioned(top: 292,left: 246,
            child:  Transform.rotate(
              angle: -math.pi / 3.6,


              child: Container(
                height: 30,
                width: 40,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/a8.png",)),
                ),
              ),
            ),
          ),




        ],
      )
    );
  }
}
