// import 'package:firebase/Chat_Pages/Call_Page.dart';
// import 'package:firebase/Chat_Pages/Group_Page.dart';
// import 'package:firebase/Chat_Pages/Message_Page.dart';
// import 'package:firebase/Chat_Pages/Setting_Page.dart';
import 'package:firebase/Pages/Group_Page.dart';
import 'package:firebase/Pages/Message_Page.dart';
import 'package:firebase/Pages/Status_Page.dart';
import 'package:firebase/Pages/call_page.dart';

import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class chat_home extends StatefulWidget {
 
  @override
  State<chat_home> createState() => _chat_homeState();
}

class _chat_homeState extends State<chat_home> {
  int _selectedindex = 0;
  final List<Widget> _pages = [
    MessagePage(),
    Group_Page(),
    status_page(),
    call_page()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  Widget buildNavBarItem(
      IconData filledIcon, IconData outlinedIcon, String text, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Padding(
        padding: EdgeInsets.only(top: 15),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
              decoration: BoxDecoration(
                color:
                    _selectedindex == index ? Color(0xFFD8FDD2) : Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                _selectedindex == index ? filledIcon : outlinedIcon,
                size: 28,
                color: _selectedindex ==index ? Color.fromARGB(255, 187, 2, 17) : Colors.black
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(text,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: _selectedindex == index
                        ? FontWeight.w900
                        : FontWeight.w500,
                    color: Colors.black))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedindex],
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
            border: Border(
          top: BorderSide(color: Colors.black12, width: 0.4),
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavBarItem(Icons.message, Icons.message_outlined, "chats", 0),
            buildNavBarItem(Icons.groups, Icons.group, "groups", 1),
            buildNavBarItem(Icons.settings, Icons.circle, "status", 2),
            buildNavBarItem(Icons.call, Icons.call, "calls", 3)
          ],
        ),
      ),
    );
  }
}
