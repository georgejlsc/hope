import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../../main.dart';


class Send_data_With_Image extends StatefulWidget {
  @override
  _Send_data_With_ImageState createState() => _Send_data_With_ImageState();
}

class _Send_data_With_ImageState extends State<Send_data_With_Image> {
  var _image;
//  final picker = ImagePicker();
  ImagePicker picker = ImagePicker();

  TextEditingController namecontroller=TextEditingController();
  TextEditingController craft_id_controller=TextEditingController();
  TextEditingController price_controller=TextEditingController();
  TextEditingController description_controller=TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Future choose_image_gallery() async {
    try {
      //final image = await picker.getImage(source: ImageSource.camera);

      final image = await picker.pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this._image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future choose_image_camera() async {
    try {
      //final image = await ImagePicker.pickImage(source: ImageSource.camera);
     //final image = await picker.pickImage(source: ImageSource.camera);
      final image = await ImagePicker.platform.pickImage(source: ImageSource.camera);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this._image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future uploadImage() async {
    final uri = Uri.parse(
        "http://$ip_address/charity_hope/admin_add_craft_item.php");
    var request = http.MultipartRequest('POST', uri);
    request.fields['name'] = namecontroller.text;
    request.fields['craft_id'] = craft_id_controller.text;
    request.fields['price'] = price_controller.text;
    request.fields['description'] = description_controller.text;

    var pic = await http.MultipartFile.fromPath("image", _image.path);
    request.files.add(pic);
    var response = await request.send();
    print(response);

    if (response.statusCode == 200) {
      print('Image Uploded');
      namecontroller.clear();

      craft_id_controller.clear();

      price_controller.clear();

      description_controller.clear();;


      final snackBar = await SnackBar(
        content: const Text('data send Successfully!'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      print('Image Not Uploded');
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Add fraft",
            style: GoogleFonts.baiJamjuree(
                textStyle: const TextStyle(
                    fontSize: 15, color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: .5))
        ),
        backgroundColor: Colors.teal,
        elevation: 0,

        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_rounded, color: Colors.white,
            size: 20, // add custom icons also
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 25,),

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
                    controller: craft_id_controller,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.work,color: Colors.grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      labelText: 'Craft Id',
                      //labelText: 'Username, email address or mobile number',
                    )),
              ),



              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                    controller: price_controller,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.payment,color: Colors.grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      labelText: 'Price',
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



              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20,),
                  Text("Choose Image",style: GoogleFonts.baiJamjuree(
                      textStyle: const TextStyle(
                          fontSize: 15, color: Colors.teal,fontWeight: FontWeight.w600,letterSpacing: .5)),),

                  IconButton(
                    icon: Icon(
                      Icons.photo_outlined,
                      size: 30,
                      color: Colors.blueGrey,
                    ),
                    onPressed: () {
                      choose_image_gallery();
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.camera_alt_outlined,
                      size: 30,
                      color: Colors.blueGrey,
                    ),
                    onPressed: () {
                    choose_image_camera();
                    },
                  ),
                ],
              ),
              Center(
                child: Container(
                    height: 100,
                    width: 200,
                    //decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),  color: Colors.grey,
                    //),

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: _image != null
                          ? Image.file(
                              _image,
                              fit: BoxFit.cover,
                            )
                          : Center(
                              child:Text("Image not inserted",style: GoogleFonts.baiJamjuree(
                                  textStyle: const TextStyle(
                                      fontSize: 10, color: Colors.blueGrey,fontWeight: FontWeight.w600,letterSpacing: .5)),),
                      ),
                    )),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  backgroundColor: Colors.teal,
                  padding: EdgeInsets.only(
                      left: 110, right: 110, top: 20, bottom: 20),
                ),
                onPressed: () {
                  setState(() {});
                  uploadImage();
                },
                child: Text('Submit',style: GoogleFonts.baiJamjuree(
                    textStyle: const TextStyle(
                        fontSize: 16, color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: .5))),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
