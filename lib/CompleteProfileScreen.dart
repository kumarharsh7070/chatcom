import 'dart:io';

// import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/chat_home_page/chat_home.dart';
// import 'package:firebase/models/usermodel.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
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

class CompleteProfileScreen extends StatefulWidget {
  @override
  _CompleteProfileScreenState createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  File? _profileImage;
  bool _isUploading = false;
  // ignore: unused_field
  String? _imageUrl;

  Future<void> _pickImage(ImageSource source) async {
    try {
      final ImagePicker _picker = ImagePicker();
      final XFile? image = await _picker.pickImage(source: source);

      if (image != null) {
        File? croppedImage = await _cropImage(image.path);

        if (croppedImage != null) {
          setState(() {
            _profileImage = croppedImage; // Update the profile image
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
      // Optional: Customize Android/iOS UI for cropping
    );

    if (croppedFile != null) {
      return File(croppedFile.path); // Return the cropped image as File
    }
    return null;
  }

  Future<void> _uploadImage() async {
    if (_profileImage == null) return;

    setState(() {
      _isUploading = true;
    });

    try {
      // Create a unique filename for the image
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child('profile_images/$fileName');

      // Upload the image to Firebase Storage
      UploadTask uploadTask = firebaseStorageRef.putFile(_profileImage!);
      TaskSnapshot taskSnapshot = await uploadTask;

      // Get the download URL
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();

      // Save the download URL to Firestore or Realtime Database
      await _saveImageUrlToFirestore(downloadUrl);

      setState(() {
        _imageUrl = downloadUrl;
        _isUploading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        
        SnackBar(
           backgroundColor: Colors.green,
          content: Text('Profile Image Uploaded Successfully!',style: TextStyle(color: Colors.white),)),
      );
      // -------------------------next page-------------------------------
       Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => chat_home()), // Change to the desired page
    );
    } catch (e) {
      print("Error uploading image: $e");

      setState(() {
        _isUploading = false;
      });
    }
  }

  Future<void> _saveImageUrlToFirestore(String downloadUrl) async {
    // Here we are using Firestore. You can adjust this to use Realtime Database instead.
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    // Replace 'userId' with the current user's ID from Firebase Authentication
    String userId = 'some-unique-user-id';

    await users.doc(userId).set({
      'profileImageUrl': downloadUrl,
    });
  }

  void _showImageSourceDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Image Source'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Camera'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo),
                title: Text('Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complete Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _showImageSourceDialog,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.deepPurple[100],
                backgroundImage: _profileImage != null
                    ? FileImage(_profileImage!)
                    : null, // Display the selected image
                child: _profileImage == null
                    ? Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.deepPurple,
                      )
                    : null,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            _isUploading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _uploadImage,
                    child: Text('Submit'),
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
