import 'dart:ui';

import 'package:agucareer/models/chats_model.dart';
import 'package:agucareer/pages/chat_page.dart';
import 'package:agucareer/values/colors.dart';
import 'package:agucareer/viewmodels/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllChatsPage extends StatefulWidget {
  @override
  _AllChatsPageState createState() => _AllChatsPageState();
}

class _AllChatsPageState extends State<AllChatsPage> {
  double chatsLength;
  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context);
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.acikMor.withOpacity(1),
      appBar: _getCustomAppBar(),
      body: Stack(
        children: [
          Container(
            color: AppColors.acikMor.withOpacity(1),
          ),
          Container(
            margin: EdgeInsets.only(top: 250),
            color: AppColors.koyuMor.withOpacity(1),
          ),
          FutureBuilder<List<Chats>>(
            future: _userModel.getChats(_userModel.user.userID),
            builder: (context, chatList) {
              if (!chatList.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                var allChats = chatList.data;
                chatsLength = allChats.length.toDouble();
                return ListView.builder(
                  itemBuilder: (context, index) {
                    var chat = allChats[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                                builder: (context) => ChatPage(
                                    me: chat.sender, it: chat.receiver)));
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 2),
                        padding: EdgeInsets.only(top: 22, bottom: 22),
                        decoration: BoxDecoration(
                          color: AppColors.acikMor.withOpacity(1),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(75)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: screenSize.width / 12),
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(chat.profileURL),
                            ),
                            SizedBox(width: screenSize.width / 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  chat.name,
                                  style: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontSize: 16),
                                ),
                                Text(
                                  chat.last,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: allChats.length,
                );
              }
            },
          ),
        ],
      ),
    );
  }

  _getCustomAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(100),
      child: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(60),
          ),
          color: AppColors.koyuMor.withOpacity(1.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButton(
                    padding: EdgeInsets.all(20),
                    icon: Icon(
                      Icons.arrow_back,
                      size: 28,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.pop(context)),
                IconButton(
                    padding: EdgeInsets.all(20),
                    icon: Icon(
                      Icons.search,
                      size: 28,
                      color: Colors.white,
                    ),
                    onPressed: () {}),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            Text(
              "MESAJLAR",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
