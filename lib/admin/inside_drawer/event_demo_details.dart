import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
class event_demo_details extends StatefulWidget {
  var datapass;

  event_demo_details({required this.datapass});

  @override
  State<event_demo_details> createState() => _event_demo_detailsState();
}

class _event_demo_detailsState extends State<event_demo_details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body:Stack(
          children: [
            SizedBox(height: 170,),
            Center(
              child: Container(
                height: 250,
                width: 280,

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
                    ]),

              child:Padding(
                padding: const EdgeInsets.only(left: 40,top: 45),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name               :  ",style: GoogleFonts.baiJamjuree(
                            textStyle: const TextStyle(
                                fontSize: 15, color: Colors.black,letterSpacing: .1,fontWeight: FontWeight.w500))),
                        SizedBox(height: 5,),
                        Text("Event date       :  ",style: GoogleFonts.baiJamjuree(
                            textStyle: const TextStyle(
                                fontSize: 15, color: Colors.black,letterSpacing: .1,fontWeight: FontWeight.w500))),
                        SizedBox(height: 5,),
                        Text("Event time       :  ",style: GoogleFonts.baiJamjuree(
                            textStyle: const TextStyle(
                                fontSize: 15, color: Colors.black,letterSpacing: .1,fontWeight: FontWeight.w500))),
                        SizedBox(height: 5,),
                        Text("Event details   :  ",style: GoogleFonts.baiJamjuree(
                            textStyle: const TextStyle(
                                fontSize: 15, color: Colors.black,letterSpacing: .1,fontWeight: FontWeight.w500))),


                      ],


                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.datapass.name,style: GoogleFonts.baiJamjuree(
                            textStyle: const TextStyle(
                                fontSize: 15, color: Colors.black,letterSpacing: .1,fontWeight: FontWeight.w500))),
                        SizedBox(height: 5,),
                        Text(widget.datapass.event_date,style: GoogleFonts.baiJamjuree(
                            textStyle: const TextStyle(
                                fontSize: 15, color: Colors.black,letterSpacing: .1,fontWeight: FontWeight.w500))),
                        SizedBox(height: 5,),
                        Text(widget.datapass.event_time,style: GoogleFonts.baiJamjuree(
                            textStyle: const TextStyle(
                                fontSize: 15, color: Colors.black,letterSpacing: .1,fontWeight: FontWeight.w500))),

                      ],
                    ),




                  ],
                ),

              ),

              ),




            ),
Positioned(top: 333,left: 80,right: 80,
    child: Text(widget.datapass.description,style: GoogleFonts.baiJamjuree(
        textStyle: const TextStyle(
            fontSize: 15, color: Colors.black,letterSpacing: .1,fontWeight: FontWeight.w500)))),
            Positioned(top: 179,left: 156,



                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/a10.png",)),
                  ),
                ),
              ),

          ],
        )
    );
  }
}
