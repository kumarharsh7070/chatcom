import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
class Group_Page extends StatefulWidget {
  const Group_Page({super.key});

  @override
  State<Group_Page> createState() => _Group_PageState();
}

class _Group_PageState extends State<Group_Page> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emojiController= TextEditingController();
        return Scaffold(
      appBar: AppBar(title: Text('group page'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextField(
controller: emojiController,
          ),
          SizedBox(
            height:380 ,
            child: EmojiPicker(
              textEditingController: emojiController,
              // pass here the same [TextEditingController] that is connected to your input field, usually a [TextFormField]
              config: Config(
        height: 256,
        
        checkPlatformCompatibility: true,
        emojiViewConfig: EmojiViewConfig(
        // Issue: https://github.com/flutter/flutter/issues/28894
        // backgroundColor: Colors.yellow,
        
        ),
        swapCategoryAndBottomBar:  false,
        skinToneConfig: const SkinToneConfig(
          enabled: true,
          dialogBackgroundColor: Colors.white,
          indicatorColor: Colors.white10
        ),
        categoryViewConfig: const CategoryViewConfig(
          // backgroundColor: Colors.red
          iconColor: Colors.yellow
        ),
        bottomActionBarConfig: const BottomActionBarConfig(
          backgroundColor: Colors.blue,
          buttonIconColor: Colors.white
        ),
        searchViewConfig: const SearchViewConfig(
          backgroundColor:Colors.red,
          // buttonIconColor: Colors.yellow,
          hintText: "search"
        ),
    ),
            )
            )
        ],
      ),
    );
  }
}