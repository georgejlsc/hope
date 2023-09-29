import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

class user_demo_detail extends StatefulWidget {
var datapass;

user_demo_detail({required this.datapass});

  @override
  State<user_demo_detail> createState() => _user_demo_detailState();
}

class _user_demo_detailState extends State<user_demo_detail> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
      ),
       body: Center(
   child: Stack(
     children: [
       SizedBox(height: 50,),
     Stack(
       children:[ Container(
       height: 500,
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
       child:  Column(
         children: [
           Container(
               height: 190,
               width: 278,

               //color: Colors.grey[200],
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(35),
                 color: Colors.white70,

               ),
               child: Image.network(widget.datapass.image) ),
           SizedBox(height: 20,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [

                     Text("Product name    :",style: GoogleFonts.baiJamjuree(
                         textStyle: const TextStyle(
                           fontSize: 15, color: Colors.black,letterSpacing: .1,fontWeight: FontWeight.w500,))),
                     SizedBox(height: 5,),
                     Text("Price                   :",style: GoogleFonts.baiJamjuree(
                         textStyle: const TextStyle(
                           fontSize: 15, color: Colors.black,letterSpacing: .1,fontWeight: FontWeight.w500,))),
                     // SizedBox(height: 5,),
                     // Text("Details                :",style: GoogleFonts.baiJamjuree(
                     //     textStyle: const TextStyle(
                     //       fontSize: 15, color: Colors.black,letterSpacing: .1,fontWeight: FontWeight.w500,))),
                   ]),
               Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [

                     Text(widget.datapass.name,style: GoogleFonts.baiJamjuree(
                         textStyle: const TextStyle(
                           fontSize: 15, color: Colors.black,letterSpacing: .1,fontWeight: FontWeight.w500,))),
                     SizedBox(height: 5,),
                     Text(widget.datapass.price,style: GoogleFonts.baiJamjuree(
                         textStyle: const TextStyle(
                           fontSize: 15, color: Colors.black,letterSpacing: .1,fontWeight: FontWeight.w500,))),

                   ]),



             ],
           ),

           Column(
             children: [
               SizedBox(height: 5,),
               Padding(
                 padding: const EdgeInsets.only(right: 70),
                 child: Text("Details                :",style: GoogleFonts.baiJamjuree(
                     textStyle: const TextStyle(
                       fontSize: 15, color: Colors.black,letterSpacing: .1,fontWeight: FontWeight.w500,))),

               ),
               Padding(
                 padding: const EdgeInsets.only(right: 20,left:170),
                 child: Text(widget.datapass.description,style: GoogleFonts.baiJamjuree(
                     textStyle: const TextStyle(
                       fontSize: 15, color: Colors.black,letterSpacing: .1,fontWeight: FontWeight.w500,))),
               ),


             ],
           ),
SizedBox(height: 50,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               InkWell (
                 child: Container(height: 40,width: 100,decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20),color: Colors.blue[700],



                 ),child: Center(child: Text("Add to cart",style: GoogleFonts.baiJamjuree(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500))),),
               onTap: (){
                   
               },),




               Container(height: 40,width: 100,decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(20),color: Colors.blue[700],



               ),child: Center(child: Text("Buy",style: GoogleFonts.baiJamjuree(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500))),),

             ],
           )




         ],
       ),

       ),


         ]
     ),







     ],
   ),
    )

    );
  }
}
