import 'dart:convert';


import 'package:children/user/user_demo_detail.dart';
import 'package:children/user/user_event_display.dart';
import 'package:flutter/material.dart';
import 'package:children/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../admin/inside_drawer/event_demo_details.dart';



class User_model {
  final String id;
  final String date;
  final String donor;
  final String food;


  User_model(
      {required this.id,
        required this.date,
        required this.donor,
        required this.food,
        });
}

class cancel_food_booking extends StatefulWidget {
  const cancel_food_booking({Key? key}) : super(key: key);

  @override
  State<cancel_food_booking> createState() => _cancel_user_display_data();
}

class _cancel_user_display_data extends State<cancel_food_booking> {
  Future<List<User_model>> getRequest() async {

    final shrdprfs=await SharedPreferences.getInstance();
    final ui=shrdprfs.getString("user_get-id");

    String url = "http://$ip_address/charity_hope/cancel_food_booking.php?uid="+ui!;
    final response = await http.get(Uri.parse(url));
    var responseData = json.decode(response.body);

    List<User_model> users = [];

    for (var singleUser in responseData) {
      User_model user = User_model(
        id: singleUser["id"].toString(),
        date: singleUser["date"].toString(),
        donor: singleUser["donor"].toString(),
        food: singleUser["food"].toString(),

      );

      users.add(user);
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cancel food booking",
            style: GoogleFonts.baiJamjuree(
                textStyle: const TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    letterSpacing: .1,
                    fontWeight: FontWeight.w600))),
        backgroundColor: Colors.blue[700],
      ),
      body: Container(
        child: FutureBuilder(
          future: getRequest(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 250,
                      ),
                      CircularProgressIndicator()
                    ],
                  ),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (ctx, index) => Column(
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: InkWell(onTap:
                              (){},
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: .3, color: Colors.teal),
                                borderRadius: BorderRadius.circular(30),

                              ),
                              title: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(snapshot.data[index].donor,style: GoogleFonts.baiJamjuree(
                                    textStyle: const TextStyle(
                                        fontSize: 15, color: Colors.black,letterSpacing: .1,fontWeight: FontWeight.w500))),
                              ),


                              subtitle: Text(snapshot.data[index].date,style: GoogleFonts.baiJamjuree(
                                  textStyle: const TextStyle(
                                      fontSize: 15, color: Colors.black,letterSpacing: .1,fontWeight: FontWeight.normal))),

                              trailing: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    delrecord(snapshot.data[index].id);
                                    // Navigator.pushReplacement(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             user_display_data()));
                                  });
                                },
                                child: Icon(Icons.cancel),
                              ),

                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
  Future<void> delrecord(String id) async {
    String url = "http://$ip_address/charity_hope/admin_delete_food_booking.php";
    var res = await http.post(Uri.parse(url), body: {"id": id});
    var response = jsonDecode(res.body);
    if (response["success"] == "true") {
      print("success");
    }
  }
}
