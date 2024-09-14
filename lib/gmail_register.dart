import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class gmail_register extends StatefulWidget {
  const gmail_register({super.key});

  @override
  State<gmail_register> createState() => _gmail_registerState();
}

class _gmail_registerState extends State<gmail_register> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Container(
          width: screenwidth * 0.9,
          height: screenheight * 1.0,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 20),
                width: screenwidth * 0.85,
                child: Icon(
                  Icons.connect_without_contact_sharp,
                  size: 35,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: screenwidth * 0.85,
                child: Center(
                    child: Text(
                  'Sign up with email',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: screenwidth * 0.85,
                child: Center(
                    child: Text(
                  'Get chatting with friends and family today by ',
                  style: TextStyle(color: Color(0xFF797C7B)),
                )),
              ),
              Container(
                width: screenwidth * 0.85,
                child: Center(
                    child: Text(
                  'signing up for our chat app',
                  style: TextStyle(color: Color(0xFF797C7B)),
                )),
              ),
               SizedBox(
                height: 50,
              ),
              Container(
                // color: Colors.red,
                width: screenwidth * 0.85,
                height: 20,
                child: Text(
                  'Your name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF797C7B),
                  ),
                ),
              ),
              Container(
                width: screenwidth * 0.85,
                child: TextField(
                  decoration: InputDecoration(
                      // hintText: 'Enter a search term',    // border: OutlineInputBorder(),

                      ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                // color: Colors.red,
                width: screenwidth * 0.85,
                height: 20,
                    child: Text(
                      'your email',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF797C7B),
                      ),
                    ),
              ),
              Container(
                width: screenwidth * 0.85,
                child: TextField(
                  decoration: InputDecoration(
                      // hintText: 'Enter a search term',    // border: OutlineInputBorder(),

                      ),
                ),
              ),
                            SizedBox(height: 20,),

              Container(
                // color: Colors.red,
                width: screenwidth * 0.85,
                height: 20,
                child: Text(
                  'Your Password',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF797C7B),
                  ),
                ),
              ),
              Container(
                width: screenwidth * 0.85,
                child: TextField(
                  decoration: InputDecoration(
                      // hintText: 'Enter a search term',    // border: OutlineInputBorder(),

                      ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                // color: Colors.red,
                width: screenwidth * 0.85,
                height: 20,
                    child: Text(
                      'Confirm Password',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF797C7B),
                      ),
                    ),
              ),
              Container(
                width: screenwidth * 0.85,
                child: TextField(
                  decoration: InputDecoration(
                      // hintText: 'Enter a search term',    // border: OutlineInputBorder(),

                      ),
                ),
              ),
              SizedBox(height: 80,),
                Container(
                  width: screenwidth*0.70,
                  height:40,
                  child: ElevatedButton(
                    onPressed: () {
                      
                    },
                    child: Text('Create an account',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:15),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:Color(0xFF24786D),
                    ),
                  ),
                
                ),
            ],
          ),
        ),
      ),
    );
  }
}
