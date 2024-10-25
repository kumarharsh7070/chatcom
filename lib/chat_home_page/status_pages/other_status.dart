import 'package:flutter/material.dart';

class otherstatus extends StatelessWidget {
  const otherstatus({ required this.imagename, required this.name, required this.time}):super();
final String name;
final String time;
final String imagename;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 26,
        backgroundImage: AssetImage(imagename),
      ),
      title: Text(name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
      subtitle: Text("Today at, $time",style: TextStyle(fontSize: 14,color:Colors.grey[900]),),
    );
  }
}