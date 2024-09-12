import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class gmail_auth extends StatefulWidget {
  const gmail_auth({super.key});

  @override
  State<gmail_auth> createState() => _gmail_authState();
}

class _gmail_authState extends State<gmail_auth> {
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Center(
          child: Container(
            // color: Colors.red,
          width: screenwidth*0.9,
          height: screenheight*1.0,
          child: Column(children: [
            Container(
              padding: EdgeInsets.only(top:20),
              width: screenwidth*0.85,
              child: Icon(Icons.connect_without_contact_sharp,
                size: 35,
                color: Colors.black,),
            ),
            SizedBox(height: 20),
            Container(
             
              width: screenwidth*0.85,
              child: Center(child: Text('Log in to Chatbox',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
            ),
                        SizedBox(height: 10,),
Container(
             
              width: screenwidth*0.85,
              child: Center(child: Text('Welcome back! Sign in using your social ',style: TextStyle(color: Color(0xFF797C7B)),)),
            ),

            Container(
             
              width: screenwidth*0.85,
              child: Center(child: Text('account or email to continue us',style: TextStyle(color: Color(0xFF797C7B)),)),
            ),
                        SizedBox(height: 25),
                  Container(
                    width: screenwidth*0.85,
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         FloatingActionButton(
                          child: FaIcon(
                            FontAwesomeIcons.facebook,
                            color: Colors.black,
                          ),
                          backgroundColor: Colors.white,
                          hoverColor: const Color.fromARGB(255, 230, 174, 92),
                          focusColor: Color.fromARGB(255, 92, 204, 96),
                          splashColor: const Color.fromARGB(255, 203, 109, 219),
                          elevation: 10,
                          foregroundColor: Color.fromARGB(255, 218, 54, 54),
                          onPressed: () =>
                              {},
                          shape: RoundedRectangleBorder(
                              side: BorderSide(width: 3, color: Colors.black),
                              borderRadius: BorderRadius.circular(100))),
                              SizedBox(
                        width: 15,
                      ),
                      FloatingActionButton(
                          child: FaIcon(
                            FontAwesomeIcons.google,
                            color: Colors.black,
                          ),
                          backgroundColor: Colors.white,
                          hoverColor: const Color.fromARGB(255, 230, 174, 92),
                          focusColor: Color.fromARGB(255, 92, 204, 96),
                          splashColor: const Color.fromARGB(255, 203, 109, 219),
                          elevation: 10,
                          onPressed: () => {},
                          shape: RoundedRectangleBorder(
                              side: BorderSide(width: 3, color: Colors.black),
                              borderRadius: BorderRadius.circular(100))),
                              SizedBox(
                        width: 15,
                      ),
                      FloatingActionButton(
                          child: FaIcon(
                            FontAwesomeIcons.apple,
                            color: Colors.black,
                          ),
                          backgroundColor: Colors.white,
                          hoverColor: const Color.fromARGB(255, 230, 174, 92),
                          focusColor: Color.fromARGB(255, 92, 204, 96),
                          splashColor: const Color.fromARGB(255, 203, 109, 219),
                          elevation: 10,
                          onPressed: () => {},
                          shape: RoundedRectangleBorder(
                              side: BorderSide(width: 3, color: Colors.black),
                              borderRadius: BorderRadius.circular(100)))
                       ],
                    ),
                  )
          ],),
          ),
        ),
    );
  }
}