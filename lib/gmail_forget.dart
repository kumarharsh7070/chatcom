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
      // If successful, show success SnackBar
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Password reset link sent to ${email.text}"),
        backgroundColor: Colors.green,
      ));
    } on FirebaseAuthException catch (e) {
      // Show error SnackBar if an exception occurs
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message ?? "An error occurred. Please try again."),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsiveness
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Gmail Password Reset",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 3, 6, 163),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.08), // Responsive padding
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Title Text
                Text(
                  "Enter your email",
                  style: TextStyle(
                    fontSize: screenWidth * 0.06, // Responsive font size
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(
                    height: screenHeight * 0.03), // Responsive vertical spacing

                // Gmail-style TextField with shadow
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 10, 10, 159)
                            .withOpacity(0.1), // subtle shadow
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
                      fillColor: Colors.grey[100], // Light fill color
                      prefixIcon:
                          Icon(Icons.email, color: Colors.grey), // Email icon
                      contentPadding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.025, // Responsive padding
                        horizontal: screenWidth * 0.05,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Rounded corners
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Colors.blueAccent,
                            width: 2), // Highlight when focused
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    height: screenHeight * 0.07), // Responsive vertical spacing

                // "Send Link" Button
                SizedBox(
                  width:
                      screenWidth * 0.8, // Button width as 80% of screen width
                  height: screenHeight *
                      0.07, // Button height as 7% of screen height
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
                        fontSize: screenWidth * 0.05, // Responsive font size
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
