import 'dart:convert';

import 'package:children/user/payment.dart';
import 'package:children/user/user_craft_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';



class User_demo_detail extends StatefulWidget {
  final Craft_model_User data_craft_user;

  const User_demo_detail({required this.data_craft_user});

  @override
  _User_demo_detailState createState() =>
      _User_demo_detailState();
}

class _User_demo_detailState
    extends State<User_demo_detail> {
  TextEditingController crt_id = new TextEditingController();
  TextEditingController uid = new TextEditingController();
  TextEditingController qty = new TextEditingController();

  late bool status;
  late String message;

  Future<void> access_id() async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    setState(() {
      final  ui = _sharedPrefs.getString("Get_userid");
      //uid_user =ui!;
      if(uiduser == null){
        uiduser=ui!;
      }
    });



  }


  @override
  void initState() {
    crt_id = TextEditingController(text: widget.data_craft_user.craft_id);
    uid = TextEditingController();
    qty = TextEditingController(text: "1");

    status = false;
    message = "";

    super.initState();
  }

  Future<void> submitData() async {
    var send = await http.post(
        Uri.parse(
            "http://$ip_address/charity_hope/user_add_to_cart.php"),
        body: {
          //"id": widget.data_craft.id.toString(),
          "craft_id": widget.data_craft_user.craft_id,
          "uid": uiduser,
          "qty": qty.text,
        });

    if (send.statusCode == 200) {
      var data = json.decode(send.body);
      var responseMessage = data["message"];
      var responseError = data["error"];
      if (responseError) {
        setState(() {
          status = false;
          message = responseMessage;
        });
      } else {
        crt_id.clear();
        uid.clear();

        setState(() {
          status = true;
          message = responseMessage;
        });
      }
    } else {
      setState(() {
        message = "Error:Server error";
        status = false;
      });
    }
  }

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
                            child: Image.network(widget.data_craft_user.image) ),
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

                                  Text(widget.data_craft_user.name,style: GoogleFonts.baiJamjuree(
                                      textStyle: const TextStyle(
                                        fontSize: 15, color: Colors.black,letterSpacing: .1,fontWeight: FontWeight.w500,))),
                                  SizedBox(height: 5,),
                                  Text(widget.data_craft_user.price,style: GoogleFonts.baiJamjuree(
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
                              child: Text(widget.data_craft_user.description,style: GoogleFonts.baiJamjuree(
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


                                  setState(() {
                                    print(widget.data_craft_user.craft_id);
                                    print("${uiduser}");
                                  });
                                  submitData();


                              },),




                            InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>payment(pass_data: access_total_amt,)));},
                              child: Container(height: 40,width: 100,decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),color: Colors.blue[700],



                              ),child: Center(child: Text("Buy",style: GoogleFonts.baiJamjuree(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500))),),
                            ),

                          ],
                        )




                      ],
                    ),

                  ),


                  ]
              ),







            ],
          ),
        ));
  }
}