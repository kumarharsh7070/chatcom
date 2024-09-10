import 'package:flutter/material.dart';


class gmail_forgot extends StatefulWidget {
  const gmail_forgot({super.key});

  @override
  State<gmail_forgot> createState() => _gmail_forgotState();
}

class _gmail_forgotState extends State<gmail_forgot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('gmail forget'),
        backgroundColor: const Color.fromARGB(255, 12, 75, 127),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text('hello')
        ],
      ),
    );
  }
}