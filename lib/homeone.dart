// import 'package:firebase/gmail_auth.dart';
// import 'package:firebase/gmail_auth.dart';
import 'package:firebase/gmail_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_fonts/google_fonts.dart';

class secondone extends StatefulWidget {
  
  const secondone({super.key});

  @override
  State<secondone> createState() => _secondoneState();
}

class _secondoneState extends State<secondone> {
// ------------------------------------------function--------------------
  
Future<void> login() async {
  try {
    // Trigger the Google Sign-In process
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // If the user cancels the sign-in, googleUser will be null
    if (googleUser == null) {
      print('Sign-in aborted by user');
      return;
    }

    // Obtain the authentication details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Create a new credential using the authentication token
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Use the credential to sign in to Firebase
    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

    // Optionally, you can get the signed-in user information
    User? user = userCredential.user;

    print('Signed in successfully as ${user?.displayName} (${user?.email})');
  } catch (e) {
    // Handle any errors that occur during sign-in
    print('Error during Google Sign-In: $e');
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 191, 184, 195),
          Color.fromARGB(255, 219, 190, 196)
        ])),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Icon(
                Icons.connect_without_contact_sharp,
                size: 35,
                color: Colors.black,
              ),
            ),
            Text('Chatbox'),
            SizedBox(
              height: 90,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: const <TextSpan>[
                        TextSpan(
                            text: 'Connects\n',
                            style: TextStyle(
                                height: 2.0,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                decoration: TextDecoration.none)),
                        TextSpan(
                            text: 'friends\n',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                decoration: TextDecoration.none)),
                        TextSpan(
                            text: 'easily &\n',
                            style: TextStyle(
                                fontSize: 45,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                decoration: TextDecoration.none)),
                        TextSpan(
                            text: 'quickly\n',
                            style: TextStyle(
                                fontSize: 45,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                decoration: TextDecoration.none)),
                        TextSpan(
                            text: 'Our chat app is the perfect way to stay\n',
                            style: TextStyle(
                                height: 2.2,
                                fontSize: 15,
                                color: Color.fromARGB(255, 115, 109, 109),
                                decoration: TextDecoration.none)),
                        TextSpan(
                            text: 'connect with friends and family',
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 115, 109, 109),
                                decoration: TextDecoration.none))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                          child: FaIcon(
                            FontAwesomeIcons.mobileScreen,
                            color: Colors.black,
                          ),
                          backgroundColor: Colors.white,
                          hoverColor: const Color.fromARGB(255, 230, 174, 92),
                          focusColor: Color.fromARGB(255, 92, 204, 96),
                          splashColor: const Color.fromARGB(255, 203, 109, 219),
                          elevation: 10,
                          foregroundColor: Color.fromARGB(255, 218, 54, 54),
                          onPressed: () =>
                              {Navigator.pushNamed(context, '/phone_auth')},
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
                          onPressed: (()=>login()),
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
                  SizedBox(
                    height: 20,
                  ),
                  IntrinsicHeight(
                      child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 200,
                        height: 2,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "OR",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 200,
                        height: 2,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      )
                    ],
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white
                            // foreground
                            ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return gmail_auth();
                          }));
                        },
                        child: SizedBox(
                            width: 390,
                            child: Center(
                                child: Text(
                              'Login with mail',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ))),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Existing account?'),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Log in',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
