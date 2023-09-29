import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:children/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;


import 'demo_detail.dart';





class craft_model {
  final String id;
  final String name;
  final String craft_id;
  final String price;
  final String description;
  final String image;

  craft_model(
      {required this.id,
        required this.name,
        required this.craft_id,
        required this.price,
        required this.description,
        required this.image});
}

class craft_display extends StatefulWidget {
  const craft_display({Key? key}) : super(key: key);

  @override
  State<craft_display> createState() => _craft_displayState();
}

class _craft_displayState extends State<craft_display> {
  Future<List<craft_model>> getRequest() async {
    String url = "http://$ip_address/charity_hope/admin_craft_display.php";
    final response = await http.get(Uri.parse(url));
    var responseData = json.decode(response.body);

    List<craft_model> users = [];

    for (var singleUser in responseData) {
      craft_model user = craft_model(
        id: singleUser["id"].toString(),
        name: singleUser["name"].toString(),
        craft_id: singleUser["craft_id"].toString(),
        price: singleUser["price"].toString(),
        description: singleUser["description"].toString(),
        image: singleUser["image"].toString(),
      );

      users.add(user);
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crafts",
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(height: 12,),
                        Padding(
                          padding: const EdgeInsets.only(top:10,left: 15,right: 15),
                         child: Container(
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
                                    spreadRadius: .5,
                                    blurRadius: 4,
                                    offset: Offset(0, 3),
                                  )
                                ]),

                            child: InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder:
                                (context)=>demo_detail(datapass: snapshot.data[index],)));},
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(



                                  leading: Padding(
                                    padding: const EdgeInsets.only(),
                                    child: GestureDetector(
                                      onTap: () {
Navigator.push(context, MaterialPageRoute(builder: (context)=>demo_detail(datapass: snapshot.data[index],)));
                                      },
                                      child: SizedBox (height: 70,width: 70,

                                          child: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                snapshot.data[index].image),

                                        backgroundColor: Colors.greenAccent[400],
                                        radius: 100,
                                             // child:Image.network(snapshot.data[index].image)//Text
                                      ), ),

                                    ),
                                  ),

                                  title: Text(snapshot.data[index].name,style: GoogleFonts.baiJamjuree(
                                      textStyle: const TextStyle(
                                          fontSize: 15, color: Colors.black,letterSpacing: .1,fontWeight: FontWeight.w500,))),

                                  subtitle: Text(snapshot.data[index].craft_id,style: GoogleFonts.baiJamjuree(
                                      textStyle: const TextStyle(
                                          fontSize: 15, color: Colors.black,letterSpacing: .1,fontWeight: FontWeight.normal))),

                                ),
                              ),
                            ),
                          ),

                        ),

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
    String url = "http://$ip_address/charity_hope/add_craft_delete.php";
    var res = await http.post(Uri.parse(url), body: {"id": id});
    var response = jsonDecode(res.body);
    if (response["success"] == "true") {
      print("success");
    }
  }
}
