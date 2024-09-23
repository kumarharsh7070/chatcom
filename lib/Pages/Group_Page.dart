import 'package:flutter/material.dart';
class Group_Page extends StatefulWidget {
  const Group_Page({super.key});

  @override
  State<Group_Page> createState() => _Group_PageState();
}

class _Group_PageState extends State<Group_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('group page'),),
    );
  }
}