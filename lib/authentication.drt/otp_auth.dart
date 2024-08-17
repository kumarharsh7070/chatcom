import 'package:flutter/material.dart';

class phone_auth extends StatefulWidget {
  const phone_auth({super.key});

  @override
  State<phone_auth> createState() => _phone_authState();
}

class _phone_authState extends State<phone_auth> {
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
                'Registration',
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
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 244, 235, 235),
                    border: Border.all(
                      color: Colors.black, //color of border
                      width: 2,
                    ) //w

                    ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Column(
            children: [
              ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 30, 31, 62)
                            // foreground
                            ),
                        onPressed: () {},
                        child: SizedBox(
                            width: 390,
                            child: Center(
                                child: Text(
                              'Send',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15,color: Colors.white),
                            ))),
                      ),
            ],
          )
        ],
      ),
    );
  }
}
