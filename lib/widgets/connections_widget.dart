import 'package:agucareer/pages/chat_page.dart';
import 'package:agucareer/viewmodels/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:agucareer/models/user_model.dart';

class ConnectionsWidget{

  Widget cWidget(UserModel _userModel) {
    return FutureBuilder<List<User>>(
      future: _userModel.getUserList(),
      builder: (context, result) {
        if (result.hasData) {
          var userList = result.data;
          if (userList.length > 0) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: userList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                                builder: (context) => ChatPage(
                                    me: _userModel.user.userID,
                                    it: userList[index].userID)));
                      },
                      child: Card(
                          margin: EdgeInsets.only(left: 40),
                          elevation: 0,
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                    userList[index].profileURL),
                              ),
                              Text(userList[index].name),
                            ],
                          )),
                    ),
                  ],
                ));
          } else {
            return Center(
              child: Text("Veri Yok!"),
            );
          }
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

}
