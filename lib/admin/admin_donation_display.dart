import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:children/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;



class User_model2 {
  final String id;
  final String name;
  final String place;
  final String phone;
  final String amount;
  final String bank;
  final String account;

  User_model2(
      {required this.id,
        required this.name,
        required this.place,
        required this.phone,
        required this.amount,
        required this.bank,
      required this.account});
}

class admin_donation_diaplay extends StatefulWidget {
  const admin_donation_diaplay({Key? key}) : super(key: key);

  @override
  State<admin_donation_diaplay> createState() => _admin_donation_diaplayState();
}

class _admin_donation_diaplayState extends State<admin_donation_diaplay> {
  Future<List<User_model2>> getRequest() async {
    String url = "http://$ip_address/charity_hope/admin_donation_display.php";
    final response = await http.get(Uri.parse(url));
    var responseData = json.decode(response.body);

    List<User_model2> users = [];

    for (var singleUser in responseData) {
      User_model2 user = User_model2(
        id: singleUser["id"].toString(),
        name: singleUser["name"].toString(),
        place: singleUser["place"].toString(),
        phone: singleUser["phone"].toString(),
        amount: singleUser["amount"].toString(),
        bank: singleUser["bank"].toString(),
        account: singleUser["account"].toString(),
      );

      users.add(user);
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Donation",
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
                                child: Text(snapshot.data[index].name,style: GoogleFonts.baiJamjuree(
                                    textStyle: const TextStyle(
                                        fontSize: 15, color: Colors.black,letterSpacing: .1,fontWeight: FontWeight.w500))),
                              ),

                              subtitle: Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Text(snapshot.data[index].amount,style: GoogleFonts.baiJamjuree(
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

  Future<void> delrecord(String id) async {
    String url = "http://$ip_address/charity_hope/admin_delete_data.php";
    var res = await http.post(Uri.parse(url), body: {"id": id});
    var response = jsonDecode(res.body);
    if (response["success"] == "true") {
      print("success");
    }
  }
}
