import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({super.key});

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  TextEditingController countryCodeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  String verificationId = '';
  bool otpSent = false;

  @override
  void initState() {
    super.initState();
    countryCodeController.text = '+1'; // Set default country code
  }

  void verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '${countryCodeController.text}${phoneController.text}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto sign-in
        await FirebaseAuth.instance.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        // Handle error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Verification failed. ${e.message}')),
        );
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          this.verificationId = verificationId;
          otpSent = true;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void signInWithOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otpController.text,
    );

    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Phone number verified successfully!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid OTP. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset('assets/undraw1.png', width: 480, height: 390),
            Text('Registration', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            SizedBox(height: 20),
            Text("Add your phone number, we'll send a verification code.", style: TextStyle(fontSize: 12)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 60,
                  child: TextField(
                    controller: countryCodeController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Code',
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            otpSent
                ? Column(
                    children: [
                      TextField(
                        controller: otpController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Enter OTP',
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: signInWithOTP,
                        child: Text('Verify OTP'),
                      ),
                    ],
                  )
                : ElevatedButton(
                    onPressed: verifyPhone,
                    child: Text('Send OTP'),
                  ),
          ],
        ),
      ),
    );
  }
}
