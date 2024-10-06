import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase/CompleteProfileScreen.dart';  // Adjust this import path as needed

class GmailRegister extends StatefulWidget {
  @override
  State<GmailRegister> createState() => _GmailRegisterState();
}

class _GmailRegisterState extends State<GmailRegister> {
  TextEditingController gmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool _isRegistering = false;
  // ignore: unused_field
  bool _isVerifying = false;

  // Check input validation
  void checkValues() {
    String email = gmailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (email == "" || password == "" || confirmPassword == "") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Please fill all fields"),
        backgroundColor: Colors.red,
      ));
    } else if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Passwords do not match"),
        backgroundColor: Colors.red,
      ));
    } else {
      signUp(email, password);
    }
  }

  // Sign-up function with email verification
  void signUp(String email, String password) async {
    UserCredential? credential;
    setState(() {
      _isRegistering = true;
    });
    try {
      // Create a new user
      credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // ignore: unnecessary_null_comparison
      if (credential != null) {
        User? user = credential.user;

        // Send email verification
        await user!.sendEmailVerification();

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Verification email sent! Please verify your email."),
          backgroundColor: Colors.green,
        ));

        // Sign out user after registration
        await FirebaseAuth.instance.signOut();

        // Navigate to the email verification screen or waiting page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => EmailVerificationScreen(
              email: email,
              password: password,  // Pass the password to allow re-login
            ),
          ),
        );
      }
    } on FirebaseAuthException catch (ex) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(ex.message.toString()),
        backgroundColor: Colors.red,
      ));
    }
    setState(() {
      _isRegistering = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.05),
                // Icon and title
                Icon(
                  Icons.connect_without_contact_sharp,
                  size: screenWidth * 0.1,
                  color: Colors.black,
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'Sign up with email',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.05,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'Create an account for our chat app',
                  style: TextStyle(
                    color: Color(0xFF797C7B),
                    fontSize: screenWidth * 0.04,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.05),

                // Email field with icon
                _buildTextField(
                    label: "Email Address",
                    controller: gmailController,
                    screenWidth: screenWidth,
                    icon: Icons.email),

                SizedBox(height: screenHeight * 0.02),
                // Password field with icon
                _buildTextField(
                    label: "Your Password",
                    controller: passwordController,
                    screenWidth: screenWidth,
                    isPassword: true,
                    icon: Icons.lock),

                SizedBox(height: screenHeight * 0.02),
                // Confirm Password field with icon
                _buildTextField(
                    label: "Confirm Password",
                    controller: confirmPasswordController,
                    screenWidth: screenWidth,
                    isPassword: true,
                    icon: Icons.lock_outline),

                SizedBox(height: screenHeight * 0.08),

                // "Create Account" Button
                _isRegistering
                    ? CircularProgressIndicator()
                    : SizedBox(
                        width: screenWidth * 0.8,
                        height: screenHeight * 0.07,
                        child: ElevatedButton(
                          onPressed: checkValues,
                          child: Text(
                            'Create an account',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth * 0.045,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF24786D),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
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

  // Helper function to build text fields with icons
  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required double screenWidth,
    required IconData icon,
    bool isPassword = false,
  }) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF797C7B),
              fontSize: screenWidth * 0.04,
            ),
          ),
          TextField(
            controller: controller,
            obscureText: isPassword,
            decoration: InputDecoration(
              hintText: 'Enter your $label'.toLowerCase(),
              prefixIcon: Icon(icon, color: Color(0xFF24786D)),
              contentPadding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: screenWidth * 0.04,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// EmailVerificationScreen to wait for verification
class EmailVerificationScreen extends StatefulWidget {
  final String email;
  final String password;  // Accept password for re-login after email verification

  EmailVerificationScreen({required this.email, required this.password});

  @override
  _EmailVerificationScreenState createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  bool _isVerifying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Verify your email')),
      body: Center(
        child: _isVerifying
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'A verification link has been sent to your email.',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        _isVerifying = true;
                      });

                      // Re-login after verification since the user is logged out
                      try {
                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .signInWithEmailAndPassword(
                                email: widget.email, password: widget.password);

                        User? user = userCredential.user;
                        await user!.reload();  // Reload user info

                        if (user.emailVerified) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileCompletion(uid: user.uid),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Email not verified yet!"),
                            backgroundColor: Colors.red,
                          ));
                        }
                      } on FirebaseAuthException catch (ex) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(ex.message.toString()),
                          backgroundColor: Colors.red,
                        ));
                      }

                      setState(() {
                        _isVerifying = false;
                      });
                    },
                    child: Text('I have verified my email'),
                  ),
                ],
              ),
      ),
    );
  }
}
