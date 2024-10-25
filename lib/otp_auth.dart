import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class phone_auth extends StatefulWidget {
  const phone_auth({super.key});

  @override
  State<phone_auth> createState() => _phone_authState();
}

class _phone_authState extends State<phone_auth> {
  TextEditingController countrycode = TextEditingController();
  var phone='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('sign up with phone'),
      //   centerTitle: true,
      //   backgroundColor:Colors.blue,

      // ),
      body: Column(
        children: [
          Center(
            child: Container(
              width: 480,
              height: 390,
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage('assets/undraw1.png'),
                    fit: BoxFit.fill,
                  )),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Text(
                'Registrations',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Text(
                "Add your phone number we'll   \n send  varification code",
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Container(
                width: 270,
                height: 45,
                child: TextField(
                
                  onChanged: (value){
                    phone =value;
                  },
                  // keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Enter your mobile number",
                      hintText: "Enter your number",
                      prefix: Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: Icon(Icons.phone),
                      ),
                      suffix: Icon(Icons.check),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 8, 12, 136),
                              width: 3)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1),
                          borderSide:
                              BorderSide(color: Colors.black, width: 2))),
                ),
              ),
            ],
          ),  
          SizedBox(
            height: 15,
          ),
          // --------------------------------------------------------------
          Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 30, 31, 62)
                    // foreground
                    ),
                onPressed: () async {
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: '${countrycode.text+phone}',
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException e) {},
                    codeSent: (String verificationId, int? resendToken) {},
                    codeAutoRetrievalTimeout: (String verificationId) {},
                  );
                  // Navigator.pushNamed(context, '/phone_auth2');
                },
                child: SizedBox(
                    width: 390,
                    child: Center(
                        child: Text(
                      'Send',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white),
                    ))),
              ),
            ],
          )
        ],
      ),
    );
  }
}
