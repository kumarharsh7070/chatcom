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
// import 'package:io/ansi.dart';
// import 'package:file_picker/file_picker.dart'; // For web
// import 'package:flutter/foundation.dart' show kIsWeb;

//
// //
// class CompleteProfileScreen extends StatefulWidget {
//   final Usermodel usermodel;
//   final User firebaseuser;

//   const CompleteProfileScreen(
//       {super.key, required this.usermodel, required this.firebaseuser});
//   @override
//   _CompleteProfileScreenState createState() => _CompleteProfileScreenState();
// }

// class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
//   TextEditingController fullnamecontroller = TextEditingController();

//   File? _profileImage;
//   FilePickerResult? _webImageFile; // Handle web image file

//   Future<void> _pickImage(ImageSource source) async {
//     if (kIsWeb) {
//       // Web: Use file_picker for web
//       try {
//         FilePickerResult? result = await FilePicker.platform.pickFiles(
//           type: FileType.image,
//         );

//         if (result != null && result.files.single.bytes != null) {
//           setState(() {
//             _webImageFile = result; // For web, store the picked file
//           });
//         } else {
//           print("No file selected.");
//         }
//       } catch (e) {
//         print("Error picking image on web: $e");
//       }
//     } else {
//       // Mobile: Use image_picker for mobile platforms
//       try {
//         final ImagePicker _picker = ImagePicker();
//         final XFile? image = await _picker.pickImage(source: source);

//         if (image != null) {
//           // Crop the image
//           File? croppedImage = (await _cropImage(image.path)) as File?;

//           if (croppedImage != null) {
//             setState(() {
//               _profileImage = croppedImage; // Update the profile image
//             });
//           }
//         }
//       } catch (e) {
//         print("Error picking or cropping image: $e");
//       }
//     }
//   }

//   Future<CroppedFile?> _cropImage(String imagePath) async {
//     if (!kIsWeb) {
//       return await ImageCropper().cropImage(
//         sourcePath: imagePath,
//       );
//     }
//     return null; // No cropping on the web for now
//   }

//   void _showImageSourceDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Select Image Source'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ListTile(
//                 leading: Icon(Icons.camera),
//                 title: Text('Camera'),
//                 onTap: () {
//                   Navigator.pop(context); // Close the dialog
//                   _pickImage(ImageSource.camera); // Pick image from camera
//                 },
//               ),
//               ListTile(
//                 leading: Icon(Icons.photo),
//                 title: Text('Gallery'),
//                 onTap: () {
//                   Navigator.pop(context); // Close the dialog
//                   _pickImage(ImageSource.gallery); // Pick image from gallery
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   void checkvalues() {
//     String fullname = fullnamecontroller.text.trim();
//     if (fullname == "" || _webImageFile == null) {
//       print("please fill all the fields");
//     } else {
      
//       uploadData();
//     }
//   }

//   void uploadData() async {
//     UploadTask uploadTask = FirebaseStorage.instance
//         .ref("profilepictures")
//         .child(widget.usermodel.uid.toString())
//         .putFile(_webImageFile as File);
//     TaskSnapshot snapshot = await uploadTask;
//     String? imageurl = await snapshot.ref.getDownloadURL();
//     String? fullname = fullnamecontroller.text.trim();

//     widget.usermodel.fullname = fullname;
//     widget.usermodel.profilepic = imageurl;

//     await FirebaseFirestore.instance.collection("users").
//     doc(widget.usermodel.uid).set(widget.usermodel.toMap()).then((Value){
       
//        print("data uploaded");
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         centerTitle: true,
//         title: Text(
//           'Complete Profile',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Color.fromARGB(255, 3, 12, 184),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             GestureDetector(
//               onTap: _showImageSourceDialog,
//               child: CircleAvatar(
//                 radius: 50,
//                 backgroundColor: Colors.deepPurple[100],
//                 backgroundImage: kIsWeb
//                     ? _webImageFile != null
//                         ? MemoryImage(_webImageFile!.files.single.bytes!)
//                         : null // Display the selected image (web)
//                     : _profileImage != null
//                         ? FileImage(_profileImage!)
//                         : null, // Display the selected image (mobile)
//                 child: _profileImage == null && _webImageFile == null
//                     ? Icon(
//                         Icons.person,
//                         size: 50,
//                         color: Colors.deepPurple,
//                       )
//                     : null,
//               ),
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: fullnamecontroller,
//               decoration: InputDecoration(
//                 labelText: 'Full Name',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 checkvalues();
//               },
//               child: Text('Submit'),
//               style: ElevatedButton.styleFrom(
//                 padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// ---------------------------------------------------------------------for android------------------------

// class CompleteProfileScreen extends StatefulWidget {
//   @override
//   _CompleteProfileScreenState createState() => _CompleteProfileScreenState();
// }

// class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
//   File? _profileImage;

//   Future<void> _pickImage(ImageSource source) async {
//     try {
//       final ImagePicker _picker = ImagePicker();
//       final XFile? image = await _picker.pickImage(source: source);

//       if (image != null) {
//         // Crop the image
//         File? croppedImage = await _cropImage(image.path);

//         if (croppedImage != null) {
//           setState(() {
//             _profileImage = croppedImage; // Update the profile image
//           });
//         }
//       }
//     } catch (e) {
//       print("Error picking or cropping image: $e");
//     }
//   }

//   Future<File?> _cropImage(String imagePath) async {
//     CroppedFile? croppedFile = await ImageCropper().cropImage(
//       sourcePath: imagePath,
//       // androidUiSettings: AndroidUiSettings(
//       //   toolbarTitle: 'Crop Image',
//       //   toolbarColor: Colors.deepPurple,
//       //   toolbarWidgetColor: Colors.white,
//       //   lockAspectRatio: false,
//       // ),
//     );

//     if (croppedFile != null) {
//       return File(croppedFile.path); // Return the cropped image as File
//     }
//     return null;
//   }

//   void _showImageSourceDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Select Image Source'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ListTile(
//                 leading: Icon(Icons.camera),
//                 title: Text('Camera'),
//                 onTap: () {
//                   Navigator.pop(context); // Close the dialog
//                   _pickImage(ImageSource.camera); // Pick image from camera
//                 },
//               ),
//               ListTile(
//                 leading: Icon(Icons.photo),
//                 title: Text('Gallery'),
//                 onTap: () {
//                   Navigator.pop(context); // Close the dialog
//                   _pickImage(ImageSource.gallery); // Pick image from gallery
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Complete Profile'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             GestureDetector(
//               onTap: _showImageSourceDialog,
//               child: CircleAvatar(
//                 radius: 50,
//                 backgroundColor: Colors.deepPurple[100],
//                 backgroundImage: _profileImage != null
//                     ? FileImage(_profileImage!)
//                     : null, // Display the selected image
//                 child: _profileImage == null
//                     ? Icon(
//                         Icons.person,
//                         size: 50,
//                         color: Colors.deepPurple,
//                       )
//                     : null,
//               ),
//             ),
//             SizedBox(height: 20),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Full Name',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
               
//               },
//               child: Text('Submit'),
//               style: ElevatedButton.styleFrom(
//                 padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:firebase_storage/firebase_storage.dart'; // Firebase Storage
// import 'package:cloud_firestore/cloud_firestore.dart'; // Firestore



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

    Navigator.push(context, MaterialPageRoute(builder: (context){
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
