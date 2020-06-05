import 'dart:io';
import 'package:agucareer/models/user_model.dart';
import 'package:agucareer/values/colors.dart';
import 'package:agucareer/viewmodels/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SeeMeetingsMain extends StatefulWidget{
  final User _user;

  const SeeMeetingsMain(this._user);

  _SeeMeetingsMain createState() => _SeeMeetingsMain();
}

class _SeeMeetingsMain extends State<SeeMeetingsMain> {
  File _profilePhoto;

  @override
  Widget build(BuildContext context) {

    final _userModel = Provider.of<UserModel>(context, listen: false);

    final GlobalKey<ScaffoldState> _scaffoldKey =
    new GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.koyuMor.withOpacity(1),
      appBar: _getCustomAppBar(),
      body: Column(
        children: <Widget>[
          _buildProfileImage(widget._user, _userModel),
          Container(
              height: 100,
              padding: EdgeInsets.only(right: 5, left: 5),
              child: FutureBuilder<List<User>>(
                future: _userModel.getConnections(_userModel.user),
                builder: (context, result) {
                  if (result.hasData) {
                    var userList = result.data;
                    if (userList.length > 0) {
                      if (_userModel.connection == null)
                        _userModel.connection = userList[0];
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: userList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Column(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _userModel.connection =
                                    userList[index];
                                  });
                                },
                                child: Card(
                                    margin:
                                    EdgeInsets.only(left: 40),
                                    elevation: 0,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceEvenly,
                                      children: <Widget>[
                                        CircleAvatar(
                                          radius: 30,
                                          backgroundImage:
                                          NetworkImage(
                                              userList[index]
                                                  .profileURL),
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
              )),
          Container(
            height: 250,
//            height: screenSize.height / 2.3,
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              color: Colors.grey.shade600
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("17.11.2019",style: TextStyle(color: Colors.grey.shade400),),
                    Text("Buluşma 1",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    Text("Dolduruldu",style: TextStyle(color: Colors.grey.shade400),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("17.11.2019",style: TextStyle(color: Colors.grey.shade400),),
                    Text("Buluşma 2",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    Text("Dolduruldu",style: TextStyle(color: Colors.grey.shade400),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("17.11.2019",style: TextStyle(color: Colors.grey.shade400),),
                    Text("Buluşma 3",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    Text("Dolduruldu",style: TextStyle(color: Colors.grey.shade400),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("17.11.2019",style: TextStyle(color: Colors.grey.shade400),),
                    Text("Buluşma 4",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    Text("Dolduruldu",style: TextStyle(color: Colors.grey.shade400),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("17.11.2019",style: TextStyle(color: Colors.grey.shade400),),
                    Text("Buluşma 5",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    Text("Dolduruldu",style: TextStyle(color: Colors.grey.shade400),),
                  ],
                ),

              ],
            ),
          )

        ],
      ),
    );
  }
  Widget _buildProfileImage(User _user, UserModel _userModel) {
    return Container(
      //  color: Colors.white,
      width: 140.0,
      height: 145.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(90.0),
        border: Border.all(
          color: Colors.white,
          width: 6.0,
        ),
      ),
      child: Column(
        children: <Widget>[
          GestureDetector(
            child: CircleAvatar(
              radius: 65,
              backgroundImage: _profilePhoto == null
                  ? NetworkImage(_user.profileURL)
                  : FileImage(_profilePhoto),
            ),
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
          color: Colors.white,
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
                      color: Colors.grey.shade500,
                    ),
                   ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            Text(
              "BULUŞMALARI GÖR",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}