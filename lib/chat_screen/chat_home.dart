import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class chat_home extends StatefulWidget {
  const chat_home({super.key});

  @override
  State<chat_home> createState() => _chat_homeState();
}

class _chat_homeState extends State<chat_home> {
  int myIndex = 0;
  List<Widget> widgetList = [
    Text(
      'message',
      style: TextStyle(fontSize: 40),
    ),
    Text(
      'group',
      style: TextStyle(fontSize: 40),
    ),
    Text(
      'setting',
      style: TextStyle(fontSize: 40),
    ),
    Text(
      'call',
      style: TextStyle(fontSize: 40),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'chatcom',
          style: GoogleFonts.pacifico(
            fontSize: 40,
            color: Color.fromARGB(255, 67, 60, 194),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.camera_alt_rounded,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.barcode_reader, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body:
       Column(
        children: [
          TextField(
            decoration: InputDecoration(
                fillColor: Color(0xFFBDB0B0),
                filled: true,
                hintText: "search..",
                hintStyle:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(),
                )),
          ),
          Center(child: Center(child: widgetList[myIndex]))
        ],
        
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        backgroundColor: Colors.blue,
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'message',
              backgroundColor: Colors.yellow),
          BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: 'group',
              backgroundColor: Colors.pink),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'setting',
              backgroundColor: Colors.yellow),
          BottomNavigationBarItem(
              icon: Icon(Icons.call),
              label: 'call',
              backgroundColor: Colors.blue),
        ],
      ),
    );
  }
}
