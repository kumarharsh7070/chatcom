// import 'package:firebase/homeone.dart';
import 'package:firebase/homeone.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class firsthome extends StatefulWidget {
  const firsthome({super.key});

  @override
  State<firsthome> createState() => _firsthomeState();
}

class _firsthomeState extends State<firsthome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              Container(
                width: 480,
                height: 390,
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage('assets/undraw.jpeg'),
                      fit: BoxFit.fill,
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'chatcom',
                    style: GoogleFonts.pacifico(
                      fontSize: 55,
                      color: Color.fromARGB(255, 67, 60, 194),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton.icon(
                icon: const Icon(
                  Icons.connect_without_contact_sharp,
                  size: 35,
                  color: Colors.white,
                ),
                label: Text(''),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SecondOne();
                  }));
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color.fromARGB(255, 248, 248, 248),
                  shadowColor: Color.fromARGB(29, 29, 29, 29),
                  overlayColor: Color.fromARGB(16, 16, 16, 16),
                  backgroundColor: Color.fromARGB(255, 67, 60, 194),
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
