import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class phone_auth2 extends StatefulWidget {
  const phone_auth2({super.key});

  @override
  State<phone_auth2> createState() => _phone_auth2State();
}

class _phone_auth2State extends State<phone_auth2> {
  get focusedPinTheme => null;

  get submittedPinTheme => null;

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;


    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: screenwidth * 1.0,
        height: screenheight * 1.0,
        child: Column(
          children: [
            Container(
                // margin: EdgeInsets.only(top: 10),
                //  color: Colors.blue,
                width: screenwidth * 0.9,
                height: screenheight*0.5,
                child: Image.asset('assets/image.png')),
                
            Container(
              width: screenwidth * 0.85,
              child: Center(
                  child: Text(
                'Varification',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              )),
            ),
            SizedBox(height: 10),
            Container(
              width: screenwidth * 0.85,
              child: Center(
                  child: Text(
                'Enter your otp code number',
                style: TextStyle(),
              )),
            ),
            SizedBox(height: 15),
            Container(
                width: screenwidth * 0.85,
                child: Pinput(
                 
                 
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                 
                )),
                SizedBox(height: 15),
                Container(
                  width: screenwidth*0.85,
                  height:40,
                  child: ElevatedButton(
                    onPressed: () {
                      
                    },
                    child: Text('verify',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:20),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:Color(0xFF245578),
                    ),
                  ),
                
                ),
               
                
                  
                SizedBox(height: 15,),
                
                   Container(
                    width: screenwidth*0.30,
                    child: TextButton(onPressed: () {
                      
                    },
                    child: Text('Resend new code',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),),
                    )
                
          ],
        ),
      ),
    );
  }
}
