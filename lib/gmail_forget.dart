import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GmailForgot extends StatefulWidget {
  const GmailForgot({super.key});

  @override
  State<GmailForgot> createState() => _GmailForgotState();
}

class _GmailForgotState extends State<GmailForgot> {
  TextEditingController email = TextEditingController();

  // Reset password function with SnackBar notification
  reset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
      // If successful, show confirmation dialog
      _showConfirmationDialog();
    } on FirebaseAuthException catch (e) {
      // Show error SnackBar if an exception occurs
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message ?? "An error occurred. Please try again."),
        backgroundColor: Colors.red,
      ));
    }
  }

  // Show confirmation dialog
  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Password Reset Link Sent',
              style: TextStyle(color: Colors.green)),
          content: Text(
              'A password reset link has been sent to ${email.text}. Please check your email.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsiveness
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Gmail Password Resets",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 3, 6, 163),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Title Text
                Text(
                  "Enter your email",
                  style: TextStyle(
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),

                // Gmail-style TextField with shadow
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color:
                            Color.fromARGB(255, 10, 10, 159).withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "youremail@gmail.com",
                      filled: true,
                      fillColor: Colors.grey[100],
                      prefixIcon: Icon(Icons.email, color: Colors.grey),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.025,
                        horizontal: screenWidth * 0.05,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 2),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.07),

                // "Send Link" Button
                SizedBox(
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.07,
                  child: ElevatedButton(
                    onPressed: () {
                      reset(); // Call the reset function
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 62, 12, 212),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      "Send Link",
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
