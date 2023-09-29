import 'dart:convert';

import 'package:children/user/user_homepage.dart';
import 'package:children/user/user_register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

//import 'admin_homepage.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../admin/admin_homepage.dart';
import '../admin/register.dart';
import '../main.dart';


class user_signin extends StatefulWidget {
  const user_signin({Key? key}) : super(key: key);

  @override
  State<user_signin> createState() => _user_signinState();
}

class _user_signinState extends State<user_signin> {


  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Get_userid()async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString("get_userid",uiduser);


  }

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
    var url="http://$ip_address/charity_hope/user_login.php";
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


        final SharedPreferences sharedPreferences = await SharedPreferences
            .getInstance();
        await sharedPreferences.setString("user_get-id", singleuser['id']);
        uiduser=singleuser['id'];
        Get_userid();
        // userid = singleuser['íd'];
        // getId();
      }
      final snackBar = SnackBar(content: Text("login successfully",style: TextStyle(color: Colors.white),),action:SnackBarAction(label: 'ók',textColor: Colors.white, onPressed: (){},),);


    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>user_Home_Page_a()
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
                SizedBox(height: 300),



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
                          MaterialPageRoute(builder: (context) => user_register()));

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


                SizedBox(height: 30),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Image.asset("assets/a9.png",height: 150,),Image.asset("assets/a9.png",height: 150,),


                  ],
                ),





              ]
          ),
        ),
      ),
    );
  }

}



