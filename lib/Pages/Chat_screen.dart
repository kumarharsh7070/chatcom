// ignore_for_file: unused_field

// ignore: unused_import
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
// import 'package:firebase/homeone.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class ChatScreen extends StatefulWidget {
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool _showEmoji = false;
  final _texteditcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.only(top: 10, left: 5),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                size: 30,
              ),
            ),
          ),
          leadingWidth: 20,
          title: Padding(
            padding: EdgeInsets.only(
              top: 6,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    'assets/newone.jpg',
                    height: 45,
                    width: 45,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "kumar",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        "online",
                        style: TextStyle(fontSize: 10, color: Colors.black),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(top: 10, right: 25),
              child: Icon(
                Icons.videocam_outlined,
                size: 30,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, right: 25),
              child: Icon(
                Icons.call,
                size: 28,
              ),
            )
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/cover.jpg"), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 100),
          child: Column(
            children: [
              Container(
                width: 60,
                height: 30,
                margin: EdgeInsets.only(bottom: 25),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 207, 183, 183),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                    child: Text(
                  "Today",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                )),
              )
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 110,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/cover.jpg"), fit: BoxFit.cover)),
        child: Padding(
          padding: EdgeInsets.only(bottom: 1),
          child: Row(
            children: [
              Container(
                // margin: EdgeInsets.all(5),
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.attachment),
                      color: Colors.black,
                    ),
                    Container(
                      width: 237,
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          hintText: "message",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _showEmoji = !_showEmoji;
                        });
                      },
                      icon: FaIcon(
                        FontAwesomeIcons.faceSmile,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: FaIcon(
                        FontAwesomeIcons.cameraRotate,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {});
                      },
                      icon: FaIcon(
                        FontAwesomeIcons.amazonPay,
                        color: Colors.black,
                      ),
                    ),
//                           Container(
//                             width: 50,
//                             height: 50,

//                             decoration: BoxDecoration(
//                               color: Color(0xFF20A090),
// borderRadius: BorderRadius.circular(50)
//                             ),
//                             child: IconButton(onPressed: (){}, icon: Icon(Icons.send),color: Colors.white,),
//                           )
                  ],
                ),
              ),
              Container(
                width: 50,
                height: 50,
                margin: EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                    color: Color(0xFF20A090),
                    borderRadius: BorderRadius.circular(50)),
                child: IconButton(
                  onPressed: () {
                    setState(() {});
                  },
                  icon: Icon(Icons.send),
                  color: Colors.white,
                ),
              ),
               
            ],
            
          ),
          
          
        ),
        
      
      ),
      
      
    );
  }

  Widget emojiselect() {
    return EmojiPicker(onEmojiSelected: (emoji, Category) {
      print(emoji);
    });
  }
}
