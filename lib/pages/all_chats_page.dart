import 'package:agucareer/models/chats_model.dart';
import 'package:agucareer/pages/chat_page.dart';
import 'package:agucareer/viewmodels/user_model.dart';
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
      appBar: AppBar(
        title: Text("MESAJLAR"),
      ),
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
                child: ListTile(
                  title: Text(chat.name),
                  subtitle: Text(chat.last),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(chat.profileURL),
                  ),
                ),
              );
            }, itemCount: allChats.length,);
          }
        },
      ),
    );
  }
}
