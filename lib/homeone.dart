// import 'package:firebase/gmail_auth.dart';
// import 'package:firebase/gmail_register.dart';
import 'package:firebase/gmail_auth.dart';
import 'package:firebase/gmail_register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SecondOne extends StatefulWidget {
  const SecondOne({super.key});

  @override
  State<SecondOne> createState() => _SecondOneState();
}

class _SecondOneState extends State<SecondOne> {
  // Google Sign-In function
  Future<void> login() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      User? user = userCredential.user;
      print('Signed in as ${user?.displayName} (${user?.email})');
    } catch (e) {
      print('Error during Google Sign-In: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsiveness
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 191, 184, 195),
              Color.fromARGB(255, 219, 190, 196),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.08), // Responsive horizontal padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: screenHeight * 0.07), // Responsive top spacing
              Center(
                child: Icon(
                  Icons.connect_without_contact_sharp,
                  size:
                      screenWidth * 0.1, // Icon size responsive to screen width
                  color: Colors.black,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Center(
                child: Text(
                  'Chatbox',
                  style: TextStyle(
                    fontSize: screenWidth * 0.07, // Font size responsive
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: screenWidth * 0.045, // Responsive text size
                    color: Colors.black,
                    height: 1.2,
                  ),
                  children: const [
                    TextSpan(
                        text: 'Connects\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30)),
                    TextSpan(
                        text: 'friends\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30)),
                    TextSpan(
                        text: 'easily &\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 45)),
                    TextSpan(
                        text: 'quicklys\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 45)),
                    TextSpan(
                        text: 'Our chat app is the perfect way to stay\n',
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 115, 109, 109))),
                    TextSpan(
                        text: 'connect with friends and family',
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 115, 109, 109))),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.05), // Responsive spacing
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    child: FaIcon(
                      FontAwesomeIcons.mobileScreen,
                      color: Colors.black,
                      size: screenWidth * 0.07, // Responsive icon size
                    ),
                    backgroundColor: Colors.white,
                    onPressed: () =>
                        Navigator.pushNamed(context, '/phone_auth'),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 3, color: Colors.black),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  SizedBox(
                      width:
                          screenWidth * 0.05), // Responsive horizontal spacing
                  FloatingActionButton(
                    child: FaIcon(
                      FontAwesomeIcons.google,
                      color: Colors.black,
                      size: screenWidth * 0.07,
                    ),
                    backgroundColor: Colors.white,
                    onPressed: login,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 3, color: Colors.black),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.05),
                  FloatingActionButton(
                    child: FaIcon(
                      FontAwesomeIcons.apple,
                      color: Colors.black,
                      size: screenWidth * 0.07,
                    ),
                    backgroundColor: Colors.white,
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 3, color: Colors.black),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03), // Responsive spacing
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: screenWidth * 0.3,
                      height: 2,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.05),
                    Text(
                      "OR",
                      style: TextStyle(
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: screenWidth * 0.05),
                    Container(
                      width: screenWidth * 0.3,
                      height: 2,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GmailAuth()));
                },
                child: SizedBox(
                  width: screenWidth * 0.9,
                  child: Center(
                    child: Text(
                      'Login with mail',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.05, // Responsive font size
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.04), // Responsive spacing
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "You don't have an account?",
                    style: TextStyle(fontSize: 15),
                  ),
                  CupertinoButton(
                    child: Text(
                      "Sign in",
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GmailRegister()));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
