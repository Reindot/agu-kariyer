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
  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context);

    return Scaffold(
      appBar: _getCustomAppBar(),
      body: FutureBuilder<List<Chats>>(
        future: _userModel.getChats(_userModel.user.userID),
        builder: (context, chatList) {
          if(!chatList.hasData){
            return Center(child: CircularProgressIndicator(),);
          } else{
            var allChats = chatList.data;
            return ListView.builder(itemBuilder: (context, index){
              var chat = allChats[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute(
                          builder: (context) => ChatPage(
                              me: chat.sender,
                              it: chat.receiver)));
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  margin: EdgeInsets.fromLTRB(15, 5, 15, 0),
                  color: AppColors.acikMor.withOpacity(1.0),
                  child: ListTile(
                    title: Text(chat.name,style: TextStyle(color: Colors.grey.shade400),),
                    subtitle: Text(chat.last,style: TextStyle(color: Colors.white),),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(chat.profileURL),
                    ),
                  ),
                )
              );
            }, itemCount: allChats.length,);
          }
        },
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
