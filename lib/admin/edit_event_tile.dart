import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:children/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'inside_drawer/edit data.dart';
import 'inside_drawer/event_demo_details.dart';



class edit_event {
  final String id;
  final String name;
  final String event_date;
  final String event_time;
  final String description;
  final String uid;

  edit_event(
      {required this.id,
        required this.name,
        required this.event_date,
        required this.event_time,
        required this.description,
        required this.uid});
}

class edit_event_tile extends StatefulWidget {
  const edit_event_tile({Key? key}) : super(key: key);

  @override
  State<edit_event_tile> createState() => _edit_event_tileState();
}

class _edit_event_tileState extends State<edit_event_tile> {
  Future<List<edit_event>> getRequest() async {
    String url = "http://$ip_address/charity_hope/admin_event_display.php";
    final response = await http.get(Uri.parse(url));
    var responseData = json.decode(response.body);

    List<edit_event> users = [];

    for (var singleUser in responseData) {
      edit_event user = edit_event(
        id: singleUser["id"].toString(),
        name: singleUser["name"].toString(),
        event_date: singleUser["event_date"].toString(),
        event_time: singleUser["event_time"].toString(),
        description: singleUser["description"].toString(),
        uid: singleUser["uid"].toString(),
      );

      users.add(user);
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Events",
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
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: InkWell(onTap:
                              (){Navigator.push(context, MaterialPageRoute(builder:
                              (context)=>event_demo_details(datapass: snapshot.data[index],)));},
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: .3, color: Colors.teal),
                                borderRadius: BorderRadius.circular(25),

                              ),
                              title: Text(snapshot.data[index].name,style: GoogleFonts.baiJamjuree(
                                  textStyle: const TextStyle(
                                      fontSize: 15, color: Colors.black,letterSpacing: .1,fontWeight: FontWeight.w500))),
                              trailing: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => edit_data(
                                                data_user:
                                                snapshot.data[index])));
                                  });
                                },
                                child: Icon(Icons.edit),
                              ),
                              subtitle: Text(snapshot.data[index].event_date,style: GoogleFonts.baiJamjuree(
                                  textStyle: const TextStyle(
                                      fontSize: 15, color: Colors.black,letterSpacing: .1,fontWeight: FontWeight.normal))),

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
