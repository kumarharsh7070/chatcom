import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/cha_page.dart'; // Adjust this import path as needed
import 'package:firebase/gmail_forget.dart';
import 'package:firebase/models/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GmailAuth extends StatefulWidget {
  @override
  State<GmailAuth> createState() => _GmailAuthState();
}

class _GmailAuthState extends State<GmailAuth> {
  final TextEditingController gmailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  void checkValues() {
    if (_formKey.currentState!.validate()) {
      // If the form is valid, proceed with login
      login(gmailController.text.trim(), passwordController.text.trim());
    }
  }

  void login(String email, String password) async {
    UserCredential? credential;

    try {
      credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (ex) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(ex.message ?? "Error occurred"),
        backgroundColor: Colors.red,
      ));
    }

    if (credential != null) {
      String uid = credential.user!.uid;

      DocumentSnapshot userdata =
          await FirebaseFirestore.instance.collection("users").doc(uid).get();
      // ignore: unused_local_variable
      Usermodel usermodel =
          Usermodel.frommap(userdata.data() as Map<String, dynamic>);

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return ChatPage();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: screenWidth * 0.9,
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.05),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Icon(
                    Icons.connect_without_contact_sharp,
                    size: 35,
                    color: Colors.black,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'Log in to Chatbox',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    'Welcome back! Sign in using your social account or email to continue.',
                    style: TextStyle(color: Color(0xFF797C7B)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.03),
        
                  // Social buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      socialButton(FontAwesomeIcons.facebook),
                      
                    ],
                  ),
        
                  SizedBox(height: screenHeight * 0.02),
                  DividerWithText(),
                  SizedBox(height: screenHeight * 0.03),
        
                  // Email text field with icon
                  buildTextField(
                    label: "Your Email",
                    controller: gmailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    icon: Icons.email,
                  ),
        
                  SizedBox(height: screenHeight * 0.02),
        
                  // Password text field with visibility toggle and icon
                  buildTextField(
                    label: "Password",
                    controller: passwordController,
                    obscureText: !_isPasswordVisible,
                    suffixIcon: IconButton(
                      icon: Icon(_isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 6) {
                        return 'Password should be at least 6 characters';
                      }
                      return null;
                    },
                    icon: Icons.lock,
                  ),
        
                  SizedBox(height: screenHeight * 0.04),
        
                  // Login Button
                  ElevatedButton(
                    onPressed: checkValues,
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(screenWidth * 0.7, 50),
                      backgroundColor: Color(0xFF24786D),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
        
                  SizedBox(height: screenHeight * 0.02),
        
                  // Forgot Password Button
                  CupertinoButton(
                    child: Text("Forgot Password?"),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return GmailForgot();
                      }));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Social button widget for Facebook and Apple login
  Widget socialButton(IconData icon) {
    return FloatingActionButton(
      child: FaIcon(icon, color: Colors.black),
      backgroundColor: Colors.white,
      elevation: 10,
      onPressed: () {},
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 3, color: Colors.black),
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }

  // Helper function to build text fields with icons
  Widget buildTextField({
    required String label,
    required TextEditingController controller,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    required String? Function(String?)? validator,
    Widget? suffixIcon,
    required IconData icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          validator: validator,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Color(0xFF24786D)),
            border: OutlineInputBorder(),
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}

class DividerWithText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: screenWidth * 0.3,
          height: 2,
          color: Colors.black,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            "OR",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          width: screenWidth * 0.3,
          height: 2,
          color: Colors.black,
        ),
      ],
    );
  }
}
