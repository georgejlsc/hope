import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../main.dart';
import 'admin_Login.dart';



class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  late bool status;
  late String message;

  @override
  void initState() {
    // TODO: implement initState
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    confirmpassword = TextEditingController();
    status = false;
    message = "";
    super.initState();
  }

  Future Submit() async {

    var APIURL = "http://$ip_address/charity_hope/admin_registration.php";

    Map maped_data = {
      'username': username.text,
      'email': email.text,
      'phone': phone.text,
      'password': password.text,
      'uid': uiduser,
    };
    http.Response response = await http.post(Uri.parse(APIURL), body: maped_data);

    var data = jsonDecode(response.body);
    var responsemessage = data["message"];
    var responseerror=data["error"];

    if(responseerror){
      setState(() {
        status =false;
        message=responsemessage;
      });
    }
    else{
      username.clear();
      email.clear();
      phone.clear();
      password.clear();
      confirmpassword.clear();

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => signin()));

      setState(() {
        status =true;
        message =responsemessage;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                SizedBox(height: 130),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                      controller: username,
                      validator:(value){
                        if(value!.isEmpty){return "enter username";}
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person,color: Colors.grey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        labelText: 'Username',
                        //labelText: 'Username, email address or mobile number',
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                      controller: email,
                      keyboardType: TextInputType.text,
                      validator:(value){
                        if(value!.isEmpty){return"please go to email";}
                        if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){return "please enter a valid email";}
                        return null;
                      },
                      onSaved:(email){},


                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email,color: Colors.grey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        labelText: 'email',
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                      controller: phone,
                      keyboardType: TextInputType.number,
    validator:(value){
                      if(value!.length!=10){return "please enter a valid phone number";}
                      return null;
                      }, onSaved:(phone){},
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone,color: Colors.grey,),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        labelText: 'Phone',
                        //labelText: 'Username, email address or mobile number',
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                      controller: password,
                      validator:(value){
                        if(value!.isEmpty){return "enter password";}
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password,color: Colors.grey,),
                        border: OutlineInputBorder(

                            borderRadius: BorderRadius.circular(12)),
                        labelText: 'Password',
                      )),
                ),


                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                      controller: confirmpassword,
                      validator:(value){
                        if(value!.isEmpty){return "enter password again";}

                        if(password.text!=confirmpassword.text){return "password donot match";}
                        return null;
                      },


                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password,color: Colors.grey,),
                        border: OutlineInputBorder(

                            borderRadius: BorderRadius.circular(12)),
                        labelText: 'confirm Password',
                      )),
                ),


                SizedBox(height: 20),
                Padding(
                  padding:  EdgeInsets.all(12.0),
                  child: SizedBox(width: 190,height: 45,
                    child: ElevatedButton(
                        onPressed: () {
                          if(formkey.currentState!.validate()){
                          setState(() {
                            Submit();
                          });}


                        },
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.teal,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                        ),
                        child: Text("Register",style: GoogleFonts.baiJamjuree(
                            textStyle: const TextStyle(
                                fontSize: 15, color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: .5)))),
                  ),
                ),

                Text(status ? message : message),
              ],
            ),
          ),
        ),
      ),
    );
  }
}