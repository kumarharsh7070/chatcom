// import 'package:firebase/CompleteProfileScreen.dart';
import 'package:firebase/Pages/Message_Page.dart';
import 'package:firebase/Pages/Status_Page.dart';
import 'package:firebase/Pages/call_page.dart';
// import 'package:firebase/chat_home_page/chat_home.dart';
import 'package:firebase/first_home.dart';
import 'package:firebase/gmail_auth.dart';
import 'package:firebase/gmail_forgot.dart';
// import 'package:firebase/gmail_register.dart';
// import 'package:firebase/gmail_forgot.dart';
import 'package:firebase/homeone.dart';
// import 'package:firebase/models/usermodel.dart';
import 'package:firebase/otp_auth.dart';
import 'package:firebase/phone_auth2.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase/first_home.dart';
// import 'package:firebase/gmail_auth.dart';
// import 'package:firebase/homeone.dart';
// import 'package:firebase/homeone.dart';
// import 'package:firebase/gmail_register.dart';
// import 'package:firebase/gmail_auth.dart';
import 'package:flutter/material.dart';


void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: secondone(),
      
      //  home: firsthome(),>
      initialRoute: '/gmail_auth',
      routes: {
        '/': (context) => firsthome(),
        '/secondone': (context) => secondone(),
        '/phone_auth': (context) => phone_auth(),
        '/phone_auth2': (context) => phone_auth2(),
        '/gmail_auth': (context) => gmail_auth(),
        '/gmail_forgot': (context) => gmail_forgot(),
        
        '/ChatPage': (context) => MessagePage(),
        '/status_page': (context) => status_page(),
        '/call_page': (context) => call_page(),

      },
    );
  }
}
