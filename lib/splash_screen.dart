import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() {
    Timer(Duration(seconds: 3), () {
      // Check if the user is authenticated
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null && user.emailVerified) {
        // User is logged in and email is verified
        Navigator.pushReplacementNamed(context, '/firsthome');  // Replace '/home' with your main screen
      } else {
        // User is not logged in or email not verified, go to login
        Navigator.pushReplacementNamed(context, '/SecondOne'); // Go to login screen
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your app logo
            Image.asset(
              'assets/logo.jpg', // Replace with your app logo asset
              width: 400,
              height: 400,
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to Chat App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
