


import 'package:children/admin/admin_Login.dart';
import 'package:children/admin/admin_donation_display.dart';
import 'package:children/admin/admin_food_booking_display.dart';
import 'package:children/admin/cradt_edit_page.dart';
import 'package:children/admin/craft_delete_tile.dart';
import 'package:children/admin/edit_event_tile.dart';

import 'package:children/admin/inside_drawer/add_events.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';






import '../user/user_Login.dart';
import 'Edit_Data_with_img.dart';
import 'admin craft/add_craft.dart';
import 'admin craft/craft_display.dart';
import 'delete_event_tile.dart';
import 'inside_drawer/display_data.dart';

class Home_Page_a extends StatefulWidget {
  const Home_Page_a({Key? key}) : super(key: key);

  @override
  State<Home_Page_a> createState() => _Home_Page_aState();
}

class _Home_Page_aState extends State<Home_Page_a> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hope",style: GoogleFonts.baiJamjuree(
            textStyle: const TextStyle(
                fontSize: 15, color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: .5)),),

        actions: [
          IconButton(onPressed: ()async {
            final SharedPreferences sharedPreferences = await SharedPreferences
                .getInstance();
            sharedPreferences.remove("admin_get-id");
            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>signin()));
          }, icon: Icon(Icons.exit_to_app))
        ],
        backgroundColor: Colors.teal,
      ),


      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0),
          children: [

            DrawerHeader(

              decoration: BoxDecoration(color: Colors.teal),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.teal),
                accountName: Text(""),
                accountEmail: Text(""),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text("A",style: TextStyle(color: Colors.teal),),
                ),
              ),
            ),
            ListTile(
                leading: Icon(Icons.add),
                title: Text("Add events",),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>addevents()));
                }),
            ListTile(
                leading: Icon(Icons.edit),
                title: Text("Edit events",),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>edit_event_tile()));
                }),
            ListTile(
                leading: Icon(Icons.delete),
                title: Text("Delete events",),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>delete_event_tile()));
                }),
            ListTile(
                leading: Icon(Icons.work),
                title: Text("add craft"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Send_data_With_Image()));
                }),
            ListTile(
                leading: Icon(Icons.edit),
                title: Text("Edit craft"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> craft_edit_display()));
                }),
            ListTile(
                leading: Icon(Icons.delete),
                title: Text("Delete craft"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> craft_delete_tile()));
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
                Positioned(left: 20,top: 25,
                    child:  Container(
                      height: 100,
                      width: 320,

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
                                  builder: (BuildContext) => display_data()));
                        },
                      ),
                    ),),


                Positioned(left: 100,top: 43,
                  child: InkWell(

                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext) => display_data()));
                    },

                    child: Text("Events", style: GoogleFonts.baiJamjuree(
                        textStyle: const TextStyle(
                            fontSize: 15, color: Colors.black,letterSpacing: .1,fontWeight: FontWeight.w600)),),
                  ),
                ),

                Positioned(top: 42,left: 31,
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
                                  builder: (BuildContext) => display_data()));
                        },
                      ),

                    ),),

Positioned
  (top: 38,right: 80,
    child: Container(height: 80,width: 2,color: Colors.grey[300],)),



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////



                Positioned(left: 20,top: 150,
                  child:  Container(
                    height: 100,
                    width: 320,

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
                                builder: (BuildContext) => admin_donation_diaplay()));
                      },
                    ),
                  ),),


                Positioned(left: 100,top: 169,
                  child: InkWell(

                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext) => admin_donation_diaplay()));
                    },

                    child: Text("Donations", style: GoogleFonts.baiJamjuree(
                        textStyle: const TextStyle(
                            fontSize: 15, color: Colors.black,letterSpacing: .1,fontWeight: FontWeight.w600)),),
                  ),
                ),

                Positioned(top: 169,left: 31,
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
                                builder: (BuildContext) => admin_donation_diaplay()));
                      },
                    ),

                  ),),

                Positioned
                  (top: 161,right: 80,
                    child: Container(height: 80,width: 2,color: Colors.grey[300],)),


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    Positioned(left: 20,top: 280,
    child:  Container(
    height: 100,
    width: 320,

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
                  builder: (BuildContext) => admin_food_donation_display()));
        },
      ),
    ),),
                Positioned(left: 100,top: 295,
                  child: InkWell(

                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext) => admin_food_donation_display()));
                    },

                    child: Text("Food donation booking", style: GoogleFonts.baiJamjuree(
                        textStyle: const TextStyle(
                            fontSize: 15, color: Colors.black,letterSpacing: .1,fontWeight: FontWeight.w600)),),
                  ),
                ),
                Positioned(top: 298,left: 31,
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
                                builder: (BuildContext) => admin_food_donation_display()));
                      },
                    ),

                  ),),
                Positioned
          (top: 292,right: 80,
            child: Container(height: 80,width: 2,color: Colors.grey[300],)),


///////////////////////////////////////////////////////////////////////////////////////////////////////
                            //      CRAFT   SHOP

/////////////////////////////////////////////////////////////////////////////////////////////////////////

                Positioned(left: 20,top: 410,
                  child:  Container(
                    height: 100,
                    width: 320,

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
                                builder: (BuildContext) => craft_display()));
                      },
                    ),
                  ),),
                Positioned(left: 100,top: 425,
                  child: InkWell(

                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext) => craft_display()));
                    },

                    child: Text("Craft shop", style: GoogleFonts.baiJamjuree(
                        textStyle: const TextStyle(
                            fontSize: 15, color: Colors.black,letterSpacing: .1,fontWeight: FontWeight.w600)),),
                  ),
                ),
                Positioned(top: 428,left: 31,
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
                                builder: (BuildContext) => craft_display()));
                      },
                    ),

                  ),),
                Positioned
                  (top: 422,right: 80,
                    child: Container(height: 80,width: 2,color: Colors.grey[300],)),


              ],
            ),
          ),




    );
  }
}
