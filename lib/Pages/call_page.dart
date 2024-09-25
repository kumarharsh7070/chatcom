import 'package:flutter/material.dart';

class call_page extends StatefulWidget {
  const call_page({super.key});

  @override
  State<call_page> createState() => _call_pageState();
}

class _call_pageState extends State<call_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          callcard("kumar", Icons.call_made, Colors.green, "july 18, 10:20","assets/2.jpg"),
          callcard("Gautam", Icons.call_received, Colors.green, "july 17, 8:02","assets/5.jpeg"),
          callcard("Disha", Icons.call_received, Colors.green, "july 16, 9:20","assets/3.jpg"),
          callcard("Rahul", Icons.call_missed, Colors.green, "july 13, 9:20","assets/2.jpg"),
          callcard("Risu", Icons.call_received, Colors.green, "july 12, 10:20","assets/5.jpeg"),
          callcard("Sumit", Icons.call_missed, Colors.green, "march 18, 2:15","assets/3.jpg"),
          callcard("Tom", Icons.call_made, Colors.green, "august 12, 2:10","assets/5.jpeg"),
          callcard("kumar", Icons.call_missed, Colors.green, "april 2, 10:20","assets/2.jpg"),
                    callcard("kumar", Icons.call_missed, Colors.green, "april 2, 10:20","assets/2.jpg"),
          callcard("kumar", Icons.call_missed, Colors.green, "april 2, 10:20","assets/2.jpg"),
          callcard("kumar", Icons.call_missed, Colors.green, "april 2, 10:20","assets/2.jpg"),
          callcard("kumar", Icons.call_missed, Colors.green, "april 2, 10:20","assets/2.jpg"),
          callcard("kumar", Icons.call_missed, Colors.green, "april 2, 10:20","assets/3.jpg"),
          callcard("kumar", Icons.call_missed, Colors.green, "april 2, 10:20","assets/2.jpg"),
          callcard("kumar", Icons.call_missed, Colors.green, "april 2, 10:20","assets/3.jpg"),
          callcard("kumar", Icons.call_missed, Colors.green, "april 2, 10:20","assets/2.jpg"),
          callcard("kumar", Icons.call_missed, Colors.green, "april 2, 10:20","assets/3.jpg"),
          callcard("kumar", Icons.call_missed, Colors.green, "april 2, 10:20","assets/2.jpg"),
          callcard("kumar", Icons.call_missed, Colors.green, "april 2, 10:20","assets/2.jpg"),

        ],
      ),
    );
  }

  Widget callcard(
      String name, IconData iconData, Color iconColor, String time, String imagename) {
    return Card(
      margin: EdgeInsets.only(bottom: 0.5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 26,
          backgroundImage:AssetImage(imagename),
        ),
        title: Text(
          name,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Row(
          children: [
            Icon(
              iconData,
              color: iconColor,
              size: 20,
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              time,
              style: TextStyle(fontSize: 13),
            ),
          ],
        ),
        trailing: Icon(
          Icons.call,
          size: 28,
          color: Colors.teal,
        ),
      ),
    );
  }
}
