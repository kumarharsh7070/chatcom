import 'package:flutter/material.dart';
 class ownstatus extends StatelessWidget {
  const ownstatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:20),
      child: ListTile(
        leading: Stack(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/2.jpg"),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                backgroundColor: Colors.greenAccent[700],
                radius: 10,
                child: Icon(Icons.add,size: 20,color: Colors.white,),
              ),
            )
          ],
        ),
        title: Text('My Status',style: TextStyle(fontWeight: FontWeight.bold),),
        subtitle: Text("Tap to update",style: TextStyle(fontSize: 13,color: Colors.grey[900]),),
      ),
    );
  }
}