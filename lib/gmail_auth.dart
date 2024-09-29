import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/chat_home_page/chat_home.dart';
import 'package:firebase/gmail_register.dart';
// import 'package:firebase/CompleteProfileScreen.dart';
import 'package:firebase/models/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';

class gmail_auth extends StatefulWidget {
  final Usermodel usermodel;
  final User firebaseuser;

  const gmail_auth({super.key, required this.usermodel, required this.firebaseuser});
  
  @override
  State<gmail_auth> createState() => _gmail_authState();
}

class _gmail_authState extends State<gmail_auth> {

  TextEditingController gmailcontroller = TextEditingController();
  TextEditingController Passwordcontroller = TextEditingController();
  
  
  
void checkvalues(){
   String email = gmailcontroller.text.trim();
    String password = Passwordcontroller.text.trim();

    if(email =="" || password==""){
      print("please fill all the fields");
    }
    else{
      login(email, password);
    }

}

void login(String email, String password)async{
  UserCredential? credential;

  try{
     credential = await FirebaseAuth.instance.
              signInWithEmailAndPassword(email: email, password: password);

  }on   FirebaseAuthException catch(ex){
        print(ex.message.toString());
      }
    

    if(credential != null){
      String uid = credential.user!.uid;
   
      DocumentSnapshot userdata= await FirebaseFirestore.instance.collection("users").doc(uid).get();
      // ignore: unused_local_variable
      Usermodel usermodel = Usermodel.frommap(userdata.data() as Map<String,dynamic>);

      print("log in successfully");
      Navigator.push(context, MaterialPageRoute(builder: (context){
return chat_home(
       usermodel: widget.usermodel, firebaseuser: widget.firebaseuser,
);
      }));
      
    }
}

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Container(
          // color: Colors.red,
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
                  'Log in to Chatbox',
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
                  'Welcome back! Sign in using your social ',
                  style: TextStyle(color: Color(0xFF797C7B)),
                )),
              ),
              Container(
                width: screenwidth * 0.85,
                child: Center(
                    child: Text(
                  'account or email to continue us',
                  style: TextStyle(color: Color(0xFF797C7B)),
                )),
              ),
              SizedBox(height: 25),
              Container(
                width: screenwidth * 0.85,
                child: Row(
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
                        onPressed: () => {},
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
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: IntrinsicHeight(
                    child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: screenwidth * 0.38,
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: screenwidth * 0.38,
                      height: 2,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                )),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                // color: Colors.red,
                width: screenwidth * 0.85,
                height: 20,
                child: Text(
                  'Your email',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF797C7B),
                  ),
                ),
              ),
              Container(
                width: screenwidth * 0.85,
                child: TextField(
                  controller: gmailcontroller,
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
                      'Password',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF797C7B),
                      ),
                    ),
              ),
              Container(
                width: screenwidth * 0.85,
                child: TextField(
                  controller: Passwordcontroller,
                  decoration: InputDecoration(
                      // hintText: 'Enter a search term',    // border: OutlineInputBorder(),

                      ),
                ),
              ),
              SizedBox(height: 50,),
                Container(
                  width: screenwidth*0.70,
                  height:40,
                  child: ElevatedButton(
                    onPressed: () {
                      checkvalues();
                    },
                    child: Text('verify',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:20),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:Color(0xFF24786D),
                    ),
                  ),
                
                ),
                SizedBox(height: 15,),
                
                   Container(
                    width: screenwidth*0.30,
                    child: TextButton(onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context){
    return gmail_register();
                   }));
                    },
                    child: Text('Sign in?',style: TextStyle(color: Color(0xFF24786D),fontWeight: FontWeight.bold),),),
                    )
                
            ],
          ),
        ),
      ),
    );
  }
}
