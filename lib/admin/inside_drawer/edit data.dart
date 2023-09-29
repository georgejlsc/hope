import 'package:children/admin/edit_event_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../main.dart';

import 'display_data.dart';





class edit_data extends StatefulWidget {
  final edit_event data_user;

  edit_data({required this.data_user});

  //const edit_data({Key? key}) : super(key: key);

  @override
  State<edit_data> createState() => _edit_dataState();
}

class _edit_dataState extends State<edit_data> {

  TextEditingController namecontroller=TextEditingController();
  TextEditingController event_date_controller=TextEditingController();
  TextEditingController event_time_controller=TextEditingController();
  TextEditingController description_controller=TextEditingController();
  TextEditingController uid_controller=TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Submit() async {
    final response = await http.post(Uri.parse("http://$ip_address/charity_hope/admin_edit_event.php"),
        body: {
          "id":widget.data_user.id.toString(),
          'name':namecontroller.text,
          'event_date':event_date_controller.text,
          'event_time':event_time_controller.text,
          'description':description_controller.text,
          'uid':uid_controller.text,

        });

    if (response.statusCode==200){
      print("Data send");
      namecontroller.clear();

      event_date_controller.clear();

      event_time_controller.clear();

      description_controller.clear();

      uid_controller.clear();
      final snackBar = await SnackBar(
        content: Text("Data updated successfully"),
        action: SnackBarAction(
          label: 'ok',
          onPressed: (){},
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    else{
      final snackBar = await SnackBar(
        content: Text("Not updated"),
        action: SnackBarAction(
          label: '',
          onPressed: (){},
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    namecontroller = TextEditingController(text: widget.data_user.name);
    event_date_controller = TextEditingController(text: widget.data_user.event_date);
    event_time_controller = TextEditingController(text: widget.data_user.event_time);
    description_controller = TextEditingController(text: widget.data_user.description);
    uid_controller = TextEditingController(text: widget.data_user.uid);

    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                SizedBox(height: 50,),


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
                        onTap: () async {
                          DateTime? Pickdate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime.now());
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
                      controller: event_time_controller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.alarm,color: Colors.grey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        labelText: 'event time',
                        //labelText: 'Username, email address or mobile number',
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                      controller: description_controller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.note,color: Colors.grey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        labelText: 'description',
                        //labelText: 'Username, email address or mobile number',
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                      controller: uid_controller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person,color: Colors.grey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        labelText: 'uid',
                        //labelText: 'Username, email address or mobile number',
                      )),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        Submit();
                        namecontroller.clear();
                        event_date_controller.clear();
                        event_time_controller.clear();
                        description_controller.clear();
                        uid_controller.clear();

                      });

                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => login()));
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                    child: Text("Submit")),

                SizedBox(height: 30,),


                ElevatedButton(onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => display_data()));
                },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                    child: Text("Display data")),

              ],
            ),
          ),
        ),
      ),

    );
  }

}