import 'package:flutter/material.dart';

class gmail_auth extends StatefulWidget {
  const gmail_auth({super.key});

  @override
  State<gmail_auth> createState() => _gmail_authState();
}

class _gmail_authState extends State<gmail_auth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('gmail auth 1'),
      ),
    );
  }
}