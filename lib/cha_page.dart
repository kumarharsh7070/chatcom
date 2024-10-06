import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase/gmail_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final user = FirebaseAuth.instance.currentUser; // lowercase variable name for user
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _messageController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _firestore.collection('messages').add({
        'text': _messageController.text,
        'createdAt': Timestamp.now(),
        'userId': _auth.currentUser?.uid,
      });
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context); // Get screen dimensions
    final padding = mediaQuery.padding; // Get device padding to avoid UI overlap with system UI

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 8, 16, 174),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Center(child: Text("${user!.email}", style: TextStyle(fontSize: 16,color: Colors.white))),
        ),
        title: Text('Chat',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();  // Log the user out
              Navigator.pushReplacementNamed(context, '/GmailAuth'); // Go back to login
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: padding.bottom), // Avoid overlap with system bottom navigation
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('messages').orderBy('createdAt').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  final messages = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      var message = messages[index]['text'];
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: mediaQuery.size.height * 0.01, horizontal: mediaQuery.size.width * 0.03), // Adjust padding based on screen size
                        child: ListTile(
                          title: Text(message),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(mediaQuery.size.width * 0.03), // Adjust padding based on screen size
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: 'Enter message',
                        contentPadding: EdgeInsets.symmetric(
                          vertical: mediaQuery.size.height * 0.015,
                          horizontal: mediaQuery.size.width * 0.03,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: mediaQuery.size.width * 0.02), // Dynamic spacing
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: sendMessage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
