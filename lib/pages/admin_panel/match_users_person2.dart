import 'package:agucareer/models/user_model.dart';
import 'package:agucareer/pages/admin_panel/see_meetings_main.dart';
import 'package:agucareer/values/colors.dart';
import 'package:agucareer/viewmodels/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../arrange_meeting.dart';

class MatchUserPerson2 extends StatefulWidget{
  int fix = 1;
  @override
  _MatchUserPerson2 createState() =>  _MatchUserPerson2();
}

class _MatchUserPerson2 extends State<MatchUserPerson2>{
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<User> filteredUsers = List();
  final _debouncer = Debouncer(milliseconds: 500);
  String _selectedName = "Kişi Seçiniz";

  @override
  Widget build(BuildContext context) {
    final UserModel _userModel = Provider.of<UserModel>(context);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.koyuMor.withOpacity(1),
      appBar: _getCustomAppBar(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Builder(
              builder: (context){
                return _buildPersonPart(context, _userModel);
              },
            ),
          )
        ],

      ),
    );
  }
  Widget _buildPersonPart(BuildContext context, UserModel _userModel) {
    Size screenSize = MediaQuery.of(context).size;
    return FutureBuilder<List<User>>(
      future: _userModel.getConnections(_userModel.user),
      builder: (context, data) {
        if (data.hasData) {
          if(widget.fix == 1);
            filteredUsers = data.data;
          widget.fix ++;
          return Container(
            alignment: Alignment.center,
            color: AppColors.koyuMor.withOpacity(1),
            padding: EdgeInsets.only(top: 15),
            child: Column(
              children: <Widget>[
                Text("2. Kişiyi Seç",
                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.5,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans')),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: screenSize.width / 1.7,
                      child: TextField(
                        cursorColor: Colors.grey,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            hoverColor: Colors.white,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.white.withOpacity(0.5),
                            ),
                            hintText: 'Seçmek istediğin ismi gir.',
                            hintStyle: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                            )),
                        onChanged: (string) {
                          _debouncer.run(() {
                            setState(() {
                              filteredUsers = data.data
                                  .where((u) => (u.name
                                  .toLowerCase()
                                  .contains(string.toLowerCase())))
                                  .toList();
                            });
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(10.0),
                    itemCount: filteredUsers.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                          margin: EdgeInsets.only(
                              top: 10, bottom: 10, right: 15, left: 15),
                          color: Colors.white.withOpacity(0.2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60.0),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => SeeMeetingsMain(_userModel.connection)));
//
                            },
                            child:Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage:
                                  NetworkImage(data.data[index].profileURL),
                                ),
                                title: Text(
                                  filteredUsers[index].name,
                                  style: TextStyle(
                                      fontSize: 24.0,
                                      color: Colors.white,
                                      fontFamily: 'OpenSans',
                                      fontWeight: FontWeight.bold),
                                ),
                                onTap: () {
                                  setState(() {
                                    _selectedName = filteredUsers[index].name;
                                  });
                                },
                              ),
                            ) ,
                          )


                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
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
              "Kişi Eşleştir",
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