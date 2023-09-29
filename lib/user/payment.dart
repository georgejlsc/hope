import 'dart:convert';

import 'package:children/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';



import '../../user/user_Login.dart';

class payment extends StatefulWidget {
  var pass_data;

  payment({required this.pass_data});

  @override
  State<payment > createState() => _paymentState();
}

class _paymentState extends State<payment > {

  TextEditingController namecontroller=TextEditingController();
  TextEditingController phone_controller=TextEditingController();
  TextEditingController bank_controller=TextEditingController();
  TextEditingController acc_no_controller=TextEditingController();
  TextEditingController total_amount_controller=TextEditingController();





  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  late bool status;
  late String message;

  @override
  void initState() {
    // TODO: implement initState

    namecontroller = TextEditingController();
    phone_controller = TextEditingController();
    bank_controller=TextEditingController();
   acc_no_controller=TextEditingController();
   total_amount_controller=TextEditingController(text: widget.pass_data);


    status=false;
    message="";
    super.initState();
  }

  Future Submit() async
  {
    var APIURL = "http://$ip_address/charity_hope/payment.php";

    Map maped_data = {
      'name':namecontroller.text,
      'phone':phone_controller.text,
      'bank':bank_controller.text,
      'acc_no':acc_no_controller.text,
      'total_amount':total_amount_controller.text,
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
      namecontroller.clear();

      phone_controller.clear();

      bank_controller.clear();

      acc_no_controller.clear();
      total_amount_controller.clear();



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
        title: Text("Payment"),
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
                      controller: namecontroller,
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
                      controller: phone_controller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone,color: Colors.grey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        labelText: 'phone',
                        //labelText: 'Username, email address or mobile number',
                      )),
                ),



                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                      controller: bank_controller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.alarm,color: Colors.grey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        labelText: 'bank',
                        //labelText: 'Username, email address or mobile number',
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                      controller: acc_no_controller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.note,color: Colors.grey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        labelText: 'acc_no',
                        //labelText: 'Username, email address or mobile number',
                      )),
                ), Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                      controller: total_amount_controller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.note,color: Colors.grey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        labelText: 'total amount',
                        //labelText: 'Username, email address or mobile number',
                      )),
                ),


                SizedBox(height: 50,width: 140,
                  child: ElevatedButton(onPressed: (){
                    Submit();
                    namecontroller.clear();

                    phone_controller.clear();

                    bank_controller.clear();

                    acc_no_controller.clear();
                    total_amount_controller.clear();


                  },
                    child: Center(child: Text("submit")),),
                ),
                Text(status?message:message),

                // ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>display_data()),);
                // }, child: Text("display data")),





              ],
            ),
          ),
        ),
      ),

    );
  }
}
