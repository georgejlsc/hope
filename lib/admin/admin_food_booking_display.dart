import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:children/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;



class User_model3 {
  final String id;
  final String date;
  final String donor;
  final String food;


  User_model3(
      {required this.id,
        required this.date,
        required this.donor,
        required this.food,
        });
}

class admin_food_donation_display extends StatefulWidget {
  const admin_food_donation_display({Key? key}) : super(key: key);

  @override
  State<admin_food_donation_display> createState() => _admin_food_donation_displayState();
}

class _admin_food_donation_displayState extends State<admin_food_donation_display> {
  Future<List<User_model3>> getRequest() async {
    String url = "http://$ip_address/charity_hope/admin_food_display_booking.php";
    final response = await http.get(Uri.parse(url));
    var responseData = json.decode(response.body);

    List<User_model3> users = [];

    for (var singleUser in responseData) {
      User_model3 user = User_model3(
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
        title: Text("Food booking",
            style: GoogleFonts.baiJamjuree(
                textStyle: const TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    letterSpacing: .1,
                    fontWeight: FontWeight.w600))),
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
                        SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: InkWell(onTap:
                              (){},
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: .3, color: Colors.teal),
                                borderRadius: BorderRadius.circular(10),

                              ),
                              title: Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Text(snapshot.data[index].donor,style: GoogleFonts.baiJamjuree(
                                    textStyle: const TextStyle(
                                        fontSize: 15, color: Colors.black,letterSpacing: .1,fontWeight: FontWeight.w500))),
                              ),

                              subtitle: Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Text(snapshot.data[index].date,style: GoogleFonts.baiJamjuree(
                                    textStyle: const TextStyle(
                                        fontSize: 15, color: Colors.black,letterSpacing: .1,fontWeight: FontWeight.normal))),
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


}
