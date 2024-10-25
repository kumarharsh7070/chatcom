import 'package:firebase/chat_home_page/status_pages/other_status.dart';
import 'package:firebase/chat_home_page/status_pages/ownstatus.dart';
import 'package:flutter/material.dart';

class status_page extends StatefulWidget {
  const status_page({super.key});

  @override
  State<status_page> createState() => _status_pageState();
}

class _status_pageState extends State<status_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 48,
            child: FloatingActionButton(
              backgroundColor: Colors.blueGrey[100],
              onPressed: () {},
              child: Icon(
                Icons.edit,
                color: Colors.blueGrey[900],
              ),
            ),
          ),
          SizedBox(
            height: 13,
          ),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.greenAccent[700],
            elevation: 5,
            child: Icon(Icons.camera_alt),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ownstatus(),
            label("Recent updates"),
            otherstatus(
              name: "kumar",
              imagename: "assets/2.jpg",
              time: "01:01",
            ),
            otherstatus(
              name: "Gautam",
              imagename: "assets/3.jpg",
              time: "02:12",
            ),
            otherstatus(
              name: "Harsh",
              imagename: "assets/5.jpeg",
              time: "05:27",
            ),
            SizedBox(height: 10,),
            label("viewed updates"),
            otherstatus(
              name: "kumar",
              imagename: "assets/2.jpg",
              time: "01:01",
            ),
            otherstatus(
              name: "Rahul",
              imagename: "assets/3.jpg",
              time: "02:12",
            ),
            otherstatus(
              name: "Harsh",
              imagename: "assets/5.jpeg",
              time: "05:27",
            ),
          ],
        ),
      ),
    );
  }
// making new widget for last update------------------------------------------------------
  Widget label(String labelname) {
    return Container(
      height: 33,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey[300],
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 13),
        child: Text(
          labelname,
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
