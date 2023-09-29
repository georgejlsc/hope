import 'dart:convert';

import 'package:children/admin/admin_homepage.dart';
import 'package:children/admin/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;



import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';




class signin extends StatefulWidget {
  const signin({Key? key}) : super(key: key);

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {


  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    username = TextEditingController();

    password = TextEditingController();

    super.initState();
  }
  //
  // getId() async{
  //   final sharedprefs=await SharedPreferences.getInstance();
  //   await sharedprefs.setString("select",userid);
  // }


  Future login() async{
    var url="http://$ip_address/charity_hope/admin_login.php";
    var response= await http.post(Uri.parse(url),headers:{
      'Accept':'application/json'
    },
    body:{
      "username":username.text,
      "password":password.text,
    });
    var data=json.decode(response.body);

    if(data!=null) {
      for (var singleuser in data) {
        uiduser=singleuser['id'];

        final SharedPreferences sharedPreferences = await SharedPreferences
            .getInstance();
        await sharedPreferences.setString("admin_get-id", singleuser['id']);
        // userid = singleuser['íd'];
        // getId();
      }
      final snackBar = SnackBar(content: Text("login successfully",style: TextStyle(color: Colors.white),),action:SnackBarAction(label: 'ók',textColor: Colors.white, onPressed: (){},),);


    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>Home_Page_a()
    )
    );
  }
    else{

    final snackBar = SnackBar(content: Text("invalid password"),action:SnackBarAction(label: 'ók', onPressed: (){}));
    };}







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(

              children: [
                SizedBox(height: 270),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //
                //     // Image.asset("assets/a9.png",height: 150,),
                //     // Image.asset("assets/a9.png",height: 150,),
                //
                //   ],
                // ),

                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                      controller: username,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person,color: Colors.grey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),borderSide:BorderSide(color: Colors.deepPurple) ),
                        labelText: 'Username',
                        //labelText: 'Username, email address or mobile number',
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                      controller: password,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password,color: Colors.grey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        labelText: 'password',
                      )),
                ),





SizedBox(height: 21,),


                  SizedBox(width: 190,height: 45,
                    child: ElevatedButton(onPressed: ()  {
                      setState(() {
                        login();
                      }
                      );

                    //  Navigator.push(context, MaterialPageRoute(builder: (context)=>Home_Page_a()));

                    },style: ElevatedButton.styleFrom(backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    ),
                      child: Text("Login", style: GoogleFonts.baiJamjuree(
                          textStyle: const TextStyle(
                              fontSize: 15, color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: .5)),),),
                  ),
                SizedBox(height: 15,),


                   SizedBox(width: 190,height: 45,
                    child: ElevatedButton(onPressed: ()  {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => register()));

                    },style: ElevatedButton.styleFrom(backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    ),
                      child: Text("Register", style: GoogleFonts.baiJamjuree(
                          textStyle: const TextStyle(
                              fontSize: 15, color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: .5)),),),
                  ),
                // Stack(
                //   children: [
                //    Positioned(left: 100,
                //      child: SizedBox(height: 100,width: 140,
                //           child: Image.asset("assets/a9.png")),
                //    ),
                //
                //     SizedBox(height: 100,width: 140,
                //         child: Image.asset("assets/a9.png")),
                //
                //
                //   ],
                // ),











              ]
          ),
        ),
      ),
    );
  }

}



