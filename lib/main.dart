import 'package:firebase/first_home.dart';
import 'package:firebase/homeone.dart';
import 'package:firebase/otp_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
 
void main() async { 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyAOo-tQLJUB1u62pivCK7lSbvn3bDB0xrQ',
          appId: '1:755963851912:android:919bcd05c1125e555ddb3d',
          messagingSenderId: 'sendid',
          projectId: 'firstfirebaseapp-d6e1a',
          storageBucket: 'firstfirebaseapp-d6e1a.appspot.com'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
    //  home: firsthome(),
     initialRoute: '/',
  routes: {
    '/': (context) => firsthome(),
    '/secondone': (context) => secondone(),
        '/phone_auth': (context) => phone_auth(),

  },
    );
  }
}

