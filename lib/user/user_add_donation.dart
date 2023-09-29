
import 'dart:convert';

import 'package:children/main.dart';
import 'package:children/user/user_donation_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';



import '../../user/user_Login.dart';

class user_add_donation extends StatefulWidget {
  const user_add_donation ({Key? key}) : super(key: key);

  @override
  State<user_add_donation > createState() => _user_add_donationState();
}

class _user_add_donationState extends State<user_add_donation > {

  TextEditingController namecontroller=TextEditingController();
  TextEditingController place_controller=TextEditingController();
  TextEditingController phone_controller=TextEditingController();
  TextEditingController amount_controller=TextEditingController();
  TextEditingController bank_controller=TextEditingController();
  TextEditingController account_controller = TextEditingController();




  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  late bool status;
  late String message;

  @override
  void initState() {
    // TODO: implement initState

    namecontroller = TextEditingController();
   place_controller = TextEditingController();
    phone_controller=TextEditingController();
    amount_controller=TextEditingController();
   bank_controller=TextEditingController();
   account_controller=TextEditingController();

    status=false;
    message="";
    super.initState();
  }

  Future Submit() async
  {
    var APIURL = "http://$ip_address/charity_hope/user_money_donation.php";

    Map maped_data = {
      'name':namecontroller.text,
      'place':place_controller.text,
      'phone':phone_controller.text,
      'amount':amount_controller.text,
      'bank':bank_controller.text,
      'account':account_controller.text,


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
      namecontroller.clear();

      place_controller.clear();

      phone_controller.clear();

      amount_controller.clear();

      bank_controller.clear();
      account_controller.clear();

      setState(() {
        status =true;
        message =responsemessage;
      });

      Fluttertoast.showToast(msg: "send successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.blueGrey,timeInSecForIosWeb: 1,);

    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Add donation",
            style: GoogleFonts.baiJamjuree(
                textStyle: const TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    letterSpacing: .1,
                    fontWeight: FontWeight.w600))),
        backgroundColor: Colors.blue[700],

        actions: [
          IconButton(onPressed: ()async {
            final SharedPreferences sharedPreferences = await SharedPreferences
                .getInstance();
            sharedPreferences.remove("get_id");
            Navigator.push(context,MaterialPageRoute(builder: (context)=>user_signin()));
          }, icon: Icon(Icons.exit_to_app))
        ],
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                SizedBox(height: 25,),

                Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: TextField(
                      controller: namecontroller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person,color: Colors.grey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        labelText: 'name',
                        //labelText: 'Username, email address or mobile number',
                      )),
                ),
SizedBox(height: 18,),

                Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: TextField(
                      controller: place_controller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.alarm,color: Colors.grey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        labelText: 'place',
                        //labelText: 'Username, email address or mobile number',
                      )),
                ),
                SizedBox(height: 18,),
                Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: TextField(
                      controller: phone_controller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.note,color: Colors.grey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        labelText: 'phone',
                        //labelText: 'Username, email address or mobile number',
                      )),
                ),
                SizedBox(height: 18,),
                Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: TextField(
                      controller: amount_controller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.note,color: Colors.grey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        labelText: 'amount',
                        //labelText: 'Username, email address or mobile number',
                      )),
                ),
                SizedBox(height: 18,),
                Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: TextField(
                      controller: bank_controller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.note,color: Colors.grey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        labelText: 'bank',
                        //labelText: 'Username, email address or mobile number',
                      )),
                ),SizedBox(height: 18,),
                Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: TextField(
                      controller: account_controller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.note,color: Colors.grey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        labelText: 'account',
                        //labelText: 'Username, email address or mobile number',
                      )),
                ),

                SizedBox(height: 24,),
                Padding(
                    padding:  EdgeInsets.all(12.0),
                    child: SizedBox(width: 150,height: 45,
                      child: ElevatedButton(
                        onPressed: () { Submit();
                        namecontroller.clear();
                    place_controller.clear();
            phone_controller.clear();
          amount_controller.clear();
        bank_controller.clear();
    account_controller.clear();




  },
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[700],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                        ),
                        child: Text("Submit",style: GoogleFonts.baiJamjuree(
                            textStyle: const TextStyle(
                                fontSize: 15, color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: .5)), ), ),

                    )
                ),Text(status?message:message),







              ],
            ),
          ),
        ),
      ),

    );
  }
}
