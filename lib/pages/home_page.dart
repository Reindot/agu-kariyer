import 'package:agucareer/models/user_model.dart';
import 'package:agucareer/pages/chat_page.dart';
import 'package:agucareer/values/colors.dart';
import 'package:agucareer/viewmodels/user_model.dart';
import 'package:agucareer/widgets/drawer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final UserModel _userModel = Provider.of<UserModel>(context);
    return FutureBuilder(
      future: _userModel.getUserList(),
      builder: (context, result) {
        if (result.hasData) {
          return Scaffold(
              key: _scaffoldKey,
              appBar: _getCustomAppBar(),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Bağlantılarım",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 120,
                      padding: EdgeInsets.only(right: 5, left: 5),
                      child: FutureBuilder<List<User>>(
                        future: _userModel.getUserList(),
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
                  Text(
                    "Kişi Detayları",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  Container(
                    height: 300,
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      color: AppColors.koyuMor.withOpacity(1.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
                          color: AppColors.koyuMor.withOpacity(1.0),
                          elevation: 0,
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                  _userModel.connection.profileURL ?? ""),
                            ),
                            title: Text(
                              _userModel.connection.name ?? "",
                              style: TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              _userModel.connection.professional ?? "",
                              style: TextStyle(color: Colors.white),
                            ),
                            trailing: RotationTransition(
                              turns: new AlwaysStoppedAnimation(45 / 360),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .push(MaterialPageRoute(
                                          builder: (context) => ChatPage(
                                              me: _userModel.user.userID,
                                              it: _userModel
                                                  .connection.userID)));
                                },
                                icon: Icon(
                                  Icons.navigation,
                                  size: 28,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 4,
                          indent: 20,
                          endIndent: 20,
                          color: Colors.grey.shade500,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              "Kalan Buluşmalarım\n3",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "Kalan Anketlerim\n2",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Bir Sonraki Buluşma İçin Son Tarih\n 27 Mayıs 2020",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.fromLTRB(60, 15, 60, 7),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                color: AppColors.pembe.withOpacity(1.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Icon(
                                    Icons.date_range,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Buluşma Ayarla",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              )),
                        ),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.fromLTRB(60, 7, 60, 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                color: AppColors.acikMor.withOpacity(1.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Icon(
                                    Icons.assignment,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Anket Doldur",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              drawer: DrawerWidget().drawerMenu(context, _userModel));
        } else {
          return Center(child: CircularProgressIndicator());
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
                      Icons.menu,
                      size: 28,
                      color: Colors.white,
                    ),
                    onPressed: () => _scaffoldKey.currentState.openDrawer()),
                IconButton(
                    padding: EdgeInsets.all(20),
                    icon: Icon(
                      Icons.notifications,
                      size: 28,
                      color: Colors.white,
                    ),
                    onPressed: () {}),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            Text(
              "ANA  SAYFA",
              textAlign: TextAlign.center,
              style: TextStyle(
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
