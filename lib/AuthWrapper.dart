// import 'package:firebase/cha_page.dart';
import 'package:firebase/first_home.dart';
// import 'package:firebase/first_home.dart';
import 'package:firebase/homeone.dart';
// import 'package:firebase/first_home.dart';
// import 'package:firebase/gmail_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),  // Track auth state
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),  // Loading spinner
          );
        } else if (snapshot.hasData) {
          // If the user is logged in, navigate to the home screen
          return firsthome(); // Your home screen after login
        } else {
          // If the user is not logged in, show login/signup screen
          return SecondOne(); // Your login screen
        }
      },
    );
  }
}
