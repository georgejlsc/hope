import 'dart:convert';

import 'package:children/user/payment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import 'package:http/http.dart' as http;

class Cart_Model {
  final String id;
  final String craft_id;
  final String qty;
  final String cid;
  final String name;
  final String price;
  final String image;
  final String description;

  Cart_Model({
    required this.id,
    required this.name,
    required this.craft_id,
    required this.price,
    required this.cid,
    required this.image,
    required this.description,
    required this.qty,
  });
}

class User_View_Cart extends StatefulWidget {
  const User_View_Cart({Key? key}) : super(key: key);

  @override
  State<User_View_Cart> createState() => _User_View_CartState();
}

class _User_View_CartState extends State<User_View_Cart> {
  num subTotal = 0;

  //Applying get request.
  Future<List<Cart_Model>> getRequest() async {
    //replace your restFull API here.
    final _sharedPrefs = await SharedPreferences.getInstance();
    final ui = _sharedPrefs.getString("get_userid");

    String url =

        // "http://$ip/MySampleApp/Charity_Hope/user_view_cart.php";
        "http://$ip_address/charity_hope/user_view_cart.php?uid=" + ui!;

    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<Cart_Model> users = [];
    for (var singleUser in responseData) {
      Cart_Model user = Cart_Model(
        id: singleUser["id"].toString(),
        name: singleUser["name"].toString(),
        image: singleUser["image"].toString(),
        description: singleUser["description"].toString(),
        craft_id: singleUser["craft_id"].toString(),
        price: singleUser["price"].toString(),
        qty: singleUser["qty"].toString(),
        cid: singleUser["cartid"].toString(),
      );
      //  print("this is craft id"+singleUser["craft_id"]);

      //  craftid_check = singleUser["craft_id"];

      //Adding user to the list.
      users.add(user);
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        title: Text(
          "My Cart",
          style: GoogleFonts.prompt(fontSize: 22, color: Colors.black),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            FutureBuilder(
              future: getRequest(),
              builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                if (snapshot.data == null || snapshot.data == false) {
                  return Container(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            color: Colors.red.shade900,
                            strokeWidth: 5,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Loading...",
                            style: TextStyle(),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  List<Cart_Model> _user = snapshot.data;

                  print("test"+returnTotalAmount(_user));

                  access_total_amt =returnTotalAmount(_user);
                  print("test 2"+access_total_amt);

                  return Flexible(
                    child: Column(
                      children: [
                        Flexible(
                          child: ListView.builder(
                              // scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              itemBuilder: (ctx, index) {
                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Column(
                                    children: [
                                      Card(
                                        shadowColor: Colors.grey,
                                        //elevation: 8,
                                        clipBehavior: Clip.antiAlias,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Container(
                                          // color: Colors.red,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              5,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: EdgeInsets.fromLTRB(
                                              10, 15, 50, 15),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  snapshot.data[index].image,
                                                  height: 100,
                                                  width: 100.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              //    Spacer(),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Name : " +
                                                        snapshot
                                                            .data[index].name,
                                                  ),
                                                  Text(
                                                    "Price : " +
                                                        snapshot
                                                            .data[index].price,
                                                  ),

                                                  // Text(
                                                  //   "Sub Total : " +
                                                  //       ProductCalculations
                                                  //           .getTotalRateFromString(
                                                  //           productPrice: snapshot
                                                  //               .data[index].price,
                                                  //           Quantity: snapshot
                                                  //               .data[index]
                                                  //               .qty),
                                                  // ),

                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Remove",
                                                        style:
                                                            GoogleFonts.aBeeZee(
                                                                color: Colors
                                                                    .red
                                                                    .shade900),
                                                      ),
                                                      IconButton(
                                                          onPressed: () {
                                                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>Viewcart_customer()));
                                                            // setState(() {
                                                            //   delrecord(snapshot
                                                            //       .data[index].cid);
                                                            // });
                                                            showDialog(
                                                                context:
                                                                    context,
                                                                builder: (_) {
                                                                  return AlertDialog(
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16),
                                                                    ),
                                                                    title: Text(
                                                                      "Remove item",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .pink
                                                                              .shade500),
                                                                    ),
                                                                    content: Text(
                                                                        "Are You sure want to remove the product from cart"),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () {
                                                                          setState(
                                                                              () {
                                                                            delrecord(snapshot.data[index].cid);
                                                                          });
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        child: Text(
                                                                            "ok",
                                                                            style:
                                                                                TextStyle(
                                                                              color: Colors.pink.shade500,
                                                                            )),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        child: Text(
                                                                            "cancel",
                                                                            style:
                                                                                TextStyle(color: Colors.pink.shade500)),
                                                                      ),
                                                                    ],
                                                                  );
                                                                });
                                                          },
                                                          icon: Icon(
                                                              Icons.clear,
                                                              size: 20,
                                                              color: Colors.red
                                                                  .shade900)),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 50,
                              color: Colors.pink.shade50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Total",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    "\$${returnTotalAmount(_user)}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 50,
                        ),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: GestureDetector(
                              child: Container(
                                alignment: Alignment.center,
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.orange.shade200,
                                child: Text(
                                  "Buy",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      color: Colors.pink.shade900),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => payment(pass_data: access_total_amt,)));
                              },
                            )),
                      ],
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> delrecord(String id) async {
    String url = "http://$ip_address/charity_HOPE/user_remove_cart_items.php";
    var res = await http.post(Uri.parse(url), body: {
      "id": id,
    });
    var resoponse = jsonDecode(res.body);
    if (resoponse["success"] == "true") {
      print(id);
      // setState(() {
      getRequest();
      // });

    } else {
      print("some issue");
    }
  }

  String returnTotalAmount(List<Cart_Model> _user) {
    double totalAmount = 0.0;
    for (int i = 0; i < _user.length; i++) {
      totalAmount = totalAmount +
          (double.parse(_user[i].price) * double.parse(_user[i].qty));
    }
    return totalAmount.toString();
  }
}
