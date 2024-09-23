// import 'package:firebase/Chat_CustomUI/CustomCard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ChatPage extends StatelessWidget {
  List images = [
    "images/undraw.jpeg",
    "images/undraw1.png",
    "images/undraw.jpeg",
    "images/undraw.jpeg",
    "images/undraw.jpeg",
    "images/undraw.jpeg",
    "images/undraw.jpeg",
    "images/undraw.jpeg",
    "images/undraw.jpeg",
    "images/undraw.jpeg",
    "images/undraw.jpeg",
  ];

  List name = [
    "Kumar",
    "Harsh",
    "Gautam",
    "Rahul",
    "Himanshu",
    "Nitesh",
    "sumit",
    "sintu"
        "shivam",
    "priya",
    "alex",
        "alex",

  ];
  List messageTime = ["yesterday", "12:30", "12/04/24", "05.23", "yesterday","5:34","yesterday","1:20","3:30","4:12","yesterday"];

  List msgs = [
    "where are you",
    "hello sir",
    "hello dear what yours name?",
    "it is nice to meet you",
    "where are you now",
    "where are you now",
    "where are you now",
    "where are you now",
    "where are you now",
    "where are you now",
    "where are you now",
  ];

  List msgRead = [
    true,
    true,
    false,
    true,
    true,
    false,
    false,
    true,
    false,
    false,
    true
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 5, left: 15, bottom: 15),
              child: Row(
                children: [
                  Text(
                    'chatcom',
                    style: GoogleFonts.pacifico(
                      fontSize: 40,
                      color: Color.fromARGB(255, 67, 60, 194),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: IconButton(
                      icon: Icon(
                        Icons.camera_alt_rounded,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  PopupMenuButton(
                    onSelected: (selected) {
                      if (selected == 5) {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => settingscreen()))
                      }
                    },
                    elevation: 10,
                    iconSize: 28,
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 1,
                        child: Text(
                          "New Group",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: Text(
                          "New cast",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                      ),
                      PopupMenuItem(
                        value: 3,
                        child: Text(
                          "Linked device",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                      ),
                      PopupMenuItem(
                        value: 4,
                        child: Text(
                          "starred message",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                      ),
                      PopupMenuItem(
                        value: 5,
                        child: Text(
                          "setting",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(bottom: 15, left: 10, right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      fillColor: Color(0xFFBDB0B0),
                      filled: true,
                      hintText: "search..",
                      hintStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(),
                      )),
                )),
            ListView.builder(
              itemCount: images.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    onTap: () {},
                    leading: CircleAvatar(
                      maxRadius: 28,
                      backgroundImage: AssetImage(images[index]),
                    ),
                    title: Text(name[index],style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                    subtitle: Text(msgs[index],style: TextStyle(color: Color(0xFF636F75),fontSize: 13),),
                    trailing: msgRead[index] ? Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(messageTime[index],style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF1DA75E,)
                        ),),
                        SizedBox(height: 6,),
                        Container(
                          alignment: Alignment.center,
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Color(0xFF1DA75E),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text("5",style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Colors.white
                          ),),
                        )
                      ],
                    ):Text(messageTime[index],style: TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),)
                  )
                  
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},
      backgroundColor: Color(0xFF1DA75E),
      child:IconButton(onPressed: (){}, icon:Icon(Icons.add))
      
      ),
      // chatsssssssssssssssssssssssssss---------------------------------------------------------------------
    );
  }
}
