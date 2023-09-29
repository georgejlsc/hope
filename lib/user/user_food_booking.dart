
import 'dart:convert';

import 'package:children/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';



import '../../user/user_Login.dart';

class user_food_booking extends StatefulWidget {
  const user_food_booking ({Key? key}) : super(key: key);

  @override
  State<user_food_booking > createState() => _user_food_bookingState();
}

class _user_food_bookingState extends State<user_food_booking > {


  TextEditingController event_date_controller=TextEditingController();
  TextEditingController donor_controller=TextEditingController();
  TextEditingController food_controller=TextEditingController();

  TextEditingController selectdate = TextEditingController();
  DateTime currentDate = DateTime.now();



  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  late bool status;
  late String message;

  @override
  void initState() {
    // TODO: implement initState
    selectdate = TextEditingController();

    event_date_controller = TextEditingController();
  donor_controller=TextEditingController();
    food_controller=TextEditingController();


    status=false;
    message="";
    super.initState();
  }

  Future Submit() async
  {
    var APIURL = "http://$ip_address/charity_hope/user_food_donation_booking.php";

    Map maped_data = {
      'date':event_date_controller.text,
      'donor':donor_controller.text,
      'food':food_controller.text,
      'uid':uiduser,

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


      event_date_controller.clear();

      donor_controller.clear();

      food_controller.clear();



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
        title: Text("Add food booking",),
        centerTitle: true,
        actions: [
          IconButton(onPressed: ()async {
            final SharedPreferences sharedPreferences = await SharedPreferences
                .getInstance();
            sharedPreferences.remove("get_id");
            Navigator.push(context,MaterialPageRoute(builder: (context)=>user_signin()));
          }, icon: Icon(Icons.exit_to_app))
        ],
        backgroundColor: Colors.blue[700],
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: formkey,
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                      controller: donor_controller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person,color: Colors.grey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        labelText: 'name',
                        //labelText: 'Username, email address or mobile number',
                      )),
                ),

                Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                        onTap: () async {
                          DateTime? Pickdate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2026));
                          if (Pickdate != null) {
                            setState(() {
                              event_date_controller.text = DateFormat('dd/MM/yyyy').format(Pickdate);
                            });
                          }
                        },
                        controller: event_date_controller,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.calendar_today),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          labelText: 'event date',

                        ))

                ),

                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                      controller: food_controller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.alarm,color: Colors.grey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        labelText: 'Food',
                        //labelText: 'Username, email address or mobile number',
                      )),
                ),



                ElevatedButton(onPressed: (){
                  Submit();

                  event_date_controller.clear();
                  donor_controller.clear();
                  food_controller.clear();



                },
                  child: Text("submit"),),
                Text(status?message:message),

                // ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>user_display_food_booking()),);
                // }, child: Text("display data")),





              ],
            ),
          ),
        ),
      ),

    );
  }
}
