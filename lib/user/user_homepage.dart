


import 'package:children/admin/inside_drawer/add_events.dart';
import 'package:children/user/My_Orders.dart';
import 'package:children/user/cancel_food_booking.dart';
import 'package:children/user/user_Login.dart';
import 'package:children/user/user_add_donation.dart';
import 'package:children/user/user_add_events.dart';
import 'package:children/user/user_craft_display.dart';
import 'package:children/user/user_donation_display.dart';
import 'package:children/user/user_event_display.dart';
import 'package:children/user/user_food_booking.dart';
import 'package:children/user/user_food_donation_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../admin/admin craft/add_craft.dart';
import '../admin/admin craft/craft_display.dart';
import '../admin/admin_Login.dart';
import '../admin/inside_drawer/display_data.dart';
import '../main.dart';
import 'User_View_Cart.dart';
import 'cancel_event_display.dart';



class user_Home_Page_a extends StatefulWidget {
  const user_Home_Page_a({Key? key}) : super(key: key);

  @override
  State<user_Home_Page_a> createState() => _user_Home_Page_aState();
}

class _user_Home_Page_aState extends State<user_Home_Page_a> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My id is: ${uiduser}",style: GoogleFonts.baiJamjuree(
            textStyle: const TextStyle(
                fontSize: 15, color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: .5)),),

        actions: [
          IconButton(onPressed: ()async {
            final SharedPreferences sharedPreferences = await SharedPreferences
                .getInstance();
            sharedPreferences.remove("user_get-id");
            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>user_signin()));
          }, icon: Icon(Icons.exit_to_app))
        ],
        backgroundColor: Colors.lightBlue[700],
      ),


      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0),
          children: [

            DrawerHeader(

              decoration: BoxDecoration(color: Colors.lightBlue[700]),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.lightBlue[700]),
                accountName: Text(""),
                accountEmail: Text(""),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text("A",style: TextStyle(color: Colors.lightBlue[700]),),
                ),
              ),
            ),
            ListTile(
                leading: Icon(Icons.add),
                title: Text("Add donation",),
                onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>user_add_donation()));
                }),
            ListTile(
                leading: Icon(Icons.add),
                title: Text("Add food booking"),
                onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> user_food_booking()));
                }),   ListTile(
                leading: Icon(Icons.add),
                title: Text("Add event"),
                onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> user_add_event()));
                }),
            ListTile(
                leading: Icon(Icons.cancel),
                title: Text("Cancel event"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>cancel_user_display_data()));
                }), ListTile(
                leading: Icon(Icons.cancel),
                title: Text("Cancel food booking"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>cancel_food_booking()));
                }),ListTile(
                leading: Icon(Icons.car_repair),
                title: Text("cart"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>User_View_Cart()));
                }),ListTile(
                leading: Icon(Icons.car_repair),
                title: Text("my order"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>My_Orders()));
                }),
            ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text("Log out"),
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>user_signin()));
                }),
          ],
        ),
      ),



          body: Center(
            child: Stack(
              children: [
                Positioned(left: 20,top: 65,
                    child:  Container(
                      height: 150,
                      width: 150,

                      //color: Colors.grey[200],
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: Colors.white70,
                          // image: DecorationImage(
                          //     image: AssetImage('assets/a1.png'),
                          //     fit: BoxFit.scaleDown,alignment: Alignment.centerLeft),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            )
                          ]),

                      child: InkWell(

                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext) => user_display_data()));
                        },
                      ),
                    ),),


                Positioned(left: 70,top: 169,
                  child: InkWell(

                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext) => user_display_data()));
                    },

                    child: Text("Events", style: GoogleFonts.baiJamjuree(
                        textStyle: const TextStyle(
                            fontSize: 15, color: Colors.black,letterSpacing: .1,fontWeight: FontWeight.w600)),),
                  ),
                ),

                Positioned(top: 98,left: 62,
                    child:  Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/a1.png")),
                      ),
                      child: InkWell(

                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext) => user_display_data()));
                        },
                      ),

                    ),),





//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////



                Positioned(right: 20,top: 65,
                  child:  Container(
                    height: 150,
                    width: 150,

                    //color: Colors.grey[200],
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: Colors.white70,
                        // image: DecorationImage(
                        //     image: AssetImage('assets/a1.png'),
                        //     fit: BoxFit.scaleDown,alignment: Alignment.centerLeft),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          )
                        ]),

                    child: InkWell(

                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext) => user_donation_diaplay()));
                      },
                    ),
                  ),),


                Positioned(right: 55,top: 169,
                  child: InkWell(

                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext) => user_donation_diaplay()));
                    },

                    child: Text("Donations", style: GoogleFonts.baiJamjuree(
                        textStyle: const TextStyle(
                            fontSize: 15, color: Colors.black,letterSpacing: .1,fontWeight: FontWeight.w600)),),
                  ),
                ),

                Positioned(top: 98,right: 62,
                  child:  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/2a.png")),
                    ),
                    child: InkWell(

                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext) => user_donation_diaplay()));
                      },
                    ),

                  ),),




////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    Positioned(left: 20,top: 260,
    child:  Container(
    height: 150,
    width: 150,

    //color: Colors.grey[200],
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(35),
    color: Colors.white70,
    // image: DecorationImage(
    //     image: AssetImage('assets/a1.png'),
    //     fit: BoxFit.scaleDown,alignment: Alignment.centerLeft),
    boxShadow: [
    BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    spreadRadius: 2,
    blurRadius: 10,
    offset: Offset(0, 3),
    )
    ]),
      child: InkWell(

        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext) => user_food_donation_display()));
        },
      ),
    ),),
                Positioned(left: 48,top: 365,
                  child: InkWell(

                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext) => user_food_donation_display()));
                    },

                    child: Text("Food booking", style: GoogleFonts.baiJamjuree(
                        textStyle: const TextStyle(
                            fontSize: 15, color: Colors.black,letterSpacing: .1,fontWeight: FontWeight.w600)),),
                  ),
                ),
                Positioned(top: 298,left: 62,
                  child:  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/a3.png")),
                    ),
                    child: InkWell(

                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext) => user_food_donation_display()));
                      },
                    ),

                  ),),



///////////////////////////////////////////////////////////////////////////////////////////////////////
                            //      CRAFT   SHOP

/////////////////////////////////////////////////////////////////////////////////////////////////////////

                Positioned(right: 20,top: 260,
                  child:  Container(
                    height: 150,
                    width: 150,

                    //color: Colors.grey[200],
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: Colors.white70,
                        // image: DecorationImage(
                        //     image: AssetImage('assets/a1.png'),
                        //     fit: BoxFit.scaleDown,alignment: Alignment.centerLeft),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          )
                        ]),
                    child: InkWell(

                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext) => user_craft_display()));
                      },
                    ),
                  ),),
                Positioned(right: 55,top: 365,
                  child: InkWell(

                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext) =>user_craft_display()));
                    },

                    child: Text("Craft shop", style: GoogleFonts.baiJamjuree(
                        textStyle: const TextStyle(
                            fontSize: 15, color: Colors.black,letterSpacing: .1,fontWeight: FontWeight.w600)),),
                  ),
                ),
                Positioned(top: 304,right: 70,
                  child:  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/a4.png")),
                    ),
                    child: InkWell(

                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext) => user_craft_display()));
                      },
                    ),

                  ),),

Positioned(top: 79,right: 180,
    child: Container(height: 300,width: .5,color: Colors.grey,)),
                Positioned(top: 230,right: 55,
                    child: Container(height: .5,width: 250,color: Colors.grey,))
              ],
            ),
          ),




    );
  }
}
