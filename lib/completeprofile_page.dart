import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class completeprofile extends StatefulWidget {
  const completeprofile({super.key});

  @override
  State<completeprofile> createState() => _completeprofileState();
}

class _completeprofileState extends State<completeprofile> {

   late File imagefile;
  TextEditingController fullnamecontroller = TextEditingController();

 

  void selectimage(ImageSource source) async {
   XFile? pickedFile= await ImagePicker().pickImage(source: source);
   
   if (pickedFile !=null){
    // cropImage(pickedFile);
   }
  }
// ---------------------------------------------------------------------
  // void cropImage(XFile file) async {
  //    File? croppedimage = (await ImageCropper.cropImage( sourcePath: file.path)) as File?;

  //    if(croppedimage !=null){
  //     setState(() {
  //       imagefile=croppedimage;
  //     });
  //    }
  // }
// --------------------------------------------------------------------------------
  void showphotoOptions() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Upload profile picture"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  onTap: () {
                    selectimage(ImageSource.gallery);
                  },
                  leading: Icon(
                    Icons.photo_album,
                    color: Colors.black,
                  ),
                  title: Text("select from Gallery"),
                ),
                ListTile(
                  onTap: () {
                    selectimage(ImageSource.camera);
                  },
                  leading: Icon(
                    Icons.camera_alt,
                    color: Colors.black,
                  ),
                  title: Text("Take photo"),
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 41, 13, 197),
        title: Text(
          "complete profile",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 40,
        ),
        child: ListView(
          children: [
            SizedBox(
              height: 60,
            ),
            CupertinoButton(
              onPressed: () {
                showphotoOptions();
              },
              child: CircleAvatar(
                radius: 60,
                child: Icon(
                  Icons.person,
                  size: 55,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: fullnamecontroller,
              decoration: InputDecoration(
                  labelText: "Full Name",
                  labelStyle: TextStyle(fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 30,
            ),
            CupertinoButton(
              onPressed: () {},
              child: Text("Submit"),
              color: Color.fromARGB(255, 41, 13, 197),
            )
          ],
        ),
      )),
    );
  }
}
