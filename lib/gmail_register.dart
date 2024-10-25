import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/CompleteProfileScreen.dart';
import 'package:firebase/models/usermodel.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GmailRegister extends StatefulWidget {
  @override
  State<GmailRegister> createState() => _GmailRegisterState();
}

class _GmailRegisterState extends State<GmailRegister> {
  TextEditingController gmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  // Check for input validation
  void checkValues() {
    String email = gmailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (email == "" || password == "" || confirmPassword == "") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Please fill all fields"),
        backgroundColor: Colors.red,
      ));
    } else if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Passwords do not match"),
        backgroundColor: Colors.red,
      ));
    } else {
      signUp(email, password);
    }
  }

  // Sign-up function with Firestore integration and SnackBar
  void signUp(String email, String password) async {
    UserCredential? credential;
    try {
      credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // ignore: unnecessary_null_comparison
      if (credential != null) {
        String uid = credential.user!.uid;
        Usermodel newUser = Usermodel(
          uid: uid,
          email: email,
          fullname: "",
          profilepic: "",
        );

        await FirebaseFirestore.instance
            .collection("users")
            .doc(uid)
            .set(newUser.toMap())
            .then((value) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("New user created successfully!"),
            backgroundColor: Colors.green,
          ));

          // Navigate to CompleteProfileScreen
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CompleteProfileScreen();
          }));
        });
      }
    } on FirebaseAuthException catch (ex) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(ex.message.toString()),
        backgroundColor: Colors.red,
      ));
    }
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
                // Icon and title
                Icon(
                  Icons.connect_without_contact_sharp,
                  size: screenWidth * 0.1,
                  color: Colors.black,
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'Sign up with email',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.05,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'Get chatting with friends and family today by signing up for our chat app',
                  style: TextStyle(
                    color: Color(0xFF797C7B),
                    fontSize: screenWidth * 0.04,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.05),

                // Email field
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Email Address',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF797C7B),
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                ),
                TextField(
                  controller: gmailController,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    contentPadding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.02,
                      horizontal: screenWidth * 0.04,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),

                // Password field
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Your Password',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF797C7B),
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                ),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    contentPadding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.02,
                      horizontal: screenWidth * 0.04,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),

                // Confirm Password field
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Confirm Password',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF797C7B),
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                ),
                TextField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Re-enter your password',
                    contentPadding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.02,
                      horizontal: screenWidth * 0.04,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.08),

                // "Create Account" Button
                SizedBox(
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.07,
                  child: ElevatedButton(
                    onPressed: () {
                      checkValues();
                    },
                    child: Text(
                      'Create an account',
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
}
