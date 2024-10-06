import 'package:firebase/AuthWrapper.dart';
import 'package:firebase/CompleteProfileScreen.dart';
import 'package:firebase/Pages/Message_Page.dart';
import 'package:firebase/Pages/Status_Page.dart';
import 'package:firebase/Pages/call_page.dart';
import 'package:firebase/Razorpay_payment.dart';
import 'package:firebase/cha_page.dart';
import 'package:firebase/firebase_options.dart';
import 'package:firebase/first_home.dart';
import 'package:firebase/gmail_auth.dart';
import 'package:firebase/gmail_forget.dart';
import 'package:firebase/gmail_register.dart';
import 'package:firebase/homeone.dart';
import 'package:firebase/otp_auth.dart';
import 'package:firebase/phone_auth2.dart';
import 'package:firebase/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform
  );
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
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/AuthWrapper': (context) => AuthWrapper(),
        '/firsthome': (context) => firsthome(),
        '/SecondOne': (context) => SecondOne(),
        '/GmailRegister': (context) => GmailRegister(),
       
        '/PhoneAuth': (context) => PhoneAuth(),
        '/phone_auth2': (context) => phone_auth2(),
        '/GmailAuth': (context) => GmailAuth(),
        '/GmailForgot': (context) => GmailForgot(),
        '/ChatPage': (context) => MessagePage(),
        '/status_page': (context) => status_page(),
        '/call_page': (context) => call_page(),
        '/ProfileCompletion': (context) => ProfileCompletion(uid: '',),
        'ChatPage':(context)=>ChatPage(),
        "/PaymentPage":(context)=>PaymentPage()
      },
    );
  }
}
