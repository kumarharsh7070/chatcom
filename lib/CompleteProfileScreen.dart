import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/cha_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
// import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:firebase/models/usermodel.dart';

class ProfileCompletion extends StatefulWidget {
  final String uid;
  ProfileCompletion({required this.uid});

  @override
  _ProfileCompletionState createState() => _ProfileCompletionState();
}

class _ProfileCompletionState extends State<ProfileCompletion> {
  TextEditingController fullNameController = TextEditingController();
  File? _profileImage;
  bool _isUploading = false;
  String? _imageUrl;

  Future<void> _uploadImage() async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child('profile_images/$fileName');

      UploadTask uploadTask = firebaseStorageRef.putFile(_profileImage!);
      TaskSnapshot taskSnapshot = await uploadTask;
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();

      setState(() {
        _imageUrl = downloadUrl;
      });
    } catch (e) {
      print("Error uploading image: $e");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error uploading image"),
        backgroundColor: Colors.red,
      ));
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final ImagePicker _picker = ImagePicker();
      final XFile? image = await _picker.pickImage(source: source);

      if (image != null) {
        File? croppedImage = await _cropImage(image.path);
        if (croppedImage != null) {
          setState(() {
            _profileImage = croppedImage;
          });
        }
      }
    } catch (e) {
      print("Error picking or cropping image: $e");
    }
  }

  Future<File?> _cropImage(String imagePath) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imagePath,
    );
    if (croppedFile != null) {
      return File(croppedFile.path);
    }
    return null;
  }

  // Save profile info to Firestore
  void saveProfile() async {
    String fullName = fullNameController.text.trim();
    if (fullName == "" || _profileImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Please provide all information"),
        backgroundColor: Colors.red,
      ));
      return;
    }

    setState(() {
      _isUploading = true;
    });

    await _uploadImage();

    Usermodel newUser = Usermodel(
      uid: widget.uid,
      email: FirebaseAuth.instance.currentUser!.email!,
      fullname: fullName,
      profilepic: _imageUrl!,
    );

    await FirebaseFirestore.instance
        .collection("users")
        .doc(widget.uid)
        .set(newUser.toMap());

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Profile saved successfully!"),
      backgroundColor: Colors.green,
    ));

    setState(() {
      _isUploading = false;
    });

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ChatPage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.05),
                Text(
                  'Complete your profile',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.05,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'Upload your picture and enter your full name',
                  style: TextStyle(
                    color: Color(0xFF797C7B),
                    fontSize: screenWidth * 0.04,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.05),
                _buildProfileImagePicker(screenWidth, screenHeight),
                SizedBox(height: screenHeight * 0.02),
                _buildTextField(
                    label: "Full Name",
                    controller: fullNameController,
                    screenWidth: screenWidth),
                SizedBox(height: screenHeight * 0.08),
                _isUploading
                    ? CircularProgressIndicator()
                    : SizedBox(
                        width: screenWidth * 0.8,
                        height: screenHeight * 0.07,
                        child: ElevatedButton(
                          onPressed: saveProfile,
                          child: Text(
                            'Save Profile',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth * 0.045,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF24786D),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImagePicker(double screenWidth, double screenHeight) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => _pickImage(ImageSource.gallery),
          child: CircleAvatar(
            radius: screenWidth * 0.15,
            backgroundImage:
                _profileImage != null ? FileImage(_profileImage!) : null,
            child: _profileImage == null
                ? Icon(
                    Icons.camera_alt,
                    size: screenWidth * 0.1,
                    color: Colors.grey,
                  )
                : null,
          ),
        ),
        SizedBox(height: screenHeight * 0.02),
        TextButton(
          onPressed: () => _pickImage(ImageSource.camera),
          child: Text(
            "Take a picture",
            style: TextStyle(
              color: Color(0xFF24786D),
              fontSize: screenWidth * 0.04,
            ),
          ),
        ),
      ],
    );
  }

  // Helper function to build text fields
  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required double screenWidth,
  }) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF797C7B),
              fontSize: screenWidth * 0.04,
            ),
          ),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Enter your $label'.toLowerCase(),
              contentPadding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: screenWidth * 0.04,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
