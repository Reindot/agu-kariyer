import 'package:agucareer/models/user_model.dart';
import 'package:agucareer/pages/chat_page.dart';
import 'package:agucareer/pages/notifications.dart';
import 'package:agucareer/pages/profil_page.dart';
import 'package:agucareer/services/call_service.dart';
import 'package:agucareer/values/colors.dart';
import 'package:agucareer/viewmodels/user_model.dart';
import 'package:agucareer/widgets/drawer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../locator.dart';
import '../notification_handler.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();
  final String number = "05334567035";

  void initState() {
    super.initState();
    NotificationHandler().initializeFCMNotification(context);
  }

  @override
  Widget build(BuildContext context) {
    final UserModel _userModel = Provider.of<UserModel>(context);
    return FutureBuilder(
      future: _userModel.getConnections(_userModel.user),
      builder: (context, result) {
        if (result.hasData) {
          return Scaffold(
              key: _scaffoldKey,
              backgroundColor: Colors.white.withOpacity(1),
              appBar: _getCustomAppBar(),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Bağlantılarım",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: AppColors.acikMavi.withOpacity(0.8),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
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
                                                margin: EdgeInsets.only(
                                                    right: 25, left: 25),
                                                elevation: 0,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: <Widget>[
                                                    CircleAvatar(
                                                      backgroundColor:
                                                          Colors.black,
                                                      radius: 38,
                                                      child: CircleAvatar(
                                                        radius: 36,
                                                        backgroundImage:
                                                            NetworkImage(
                                                                userList[index]
                                                                    .profileURL),
                                                      ),
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
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Kişi Detayları",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.acikMavi.withOpacity(0.8),
                    ),
                  ),
                  Builder(
                    builder: (BuildContext context) {
                      if (_userModel.connection.type == "MOD") {
                        return Container(
                          height: 340,
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
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
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ProfilePage(
                                                _userModel.connection)));
                                  },
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor:
                                          AppColors.acikMavi.withOpacity(1),
                                      radius: 30,
                                      child: CircleAvatar(
                                        radius: 26,
                                        backgroundImage: NetworkImage(
                                            _userModel.connection.profileURL ??
                                                ""),
                                      ),
                                    ),
                                    title: Text(
                                      _userModel.connection.name ?? "",
                                      style: TextStyle(
                                          color: AppColors.acikMavi
                                              .withOpacity(1)),
                                    ),
                                    subtitle: Text(
                                      _userModel.connection.professional ?? "",
                                      style: TextStyle(
                                          color: AppColors.acikMavi
                                              .withOpacity(1)),
                                    ),
                                  ),
                                ),
                              ),
                              Divider(
                                thickness: 4,
                                indent: 20,
                                endIndent: 20,
                                color: AppColors.acikMavi.withOpacity(1),
                              ),
                              SizedBox(
                                height: 20,
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
                                          Icons.info_outline,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          "Sıkça Sorulan Sorular",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    )),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context, rootNavigator: true)
                                        .push(MaterialPageRoute(
                                            builder: (context) => ChatPage(
                                                  me: _userModel.user.userID,
                                                  it: _userModel
                                                      .connection.userID,
                                                  profileImage: NetworkImage(
                                                      _userModel.connection
                                                          .profileURL),
                                                )));
                                  },
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
                                          Icons.navigation,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          "Mesaj At",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    _service.call(number);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(60, 7, 60, 15),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(60),
                                      color:
                                          AppColors.acikMavi.withOpacity(1.0),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Icon(
                                          Icons.phone,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          "Ara",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                _userModel.connection.email.toString(),
                                style: TextStyle(
                                  color: AppColors.acikMavi.withOpacity(1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Container(
                          height: 360,
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
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
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ProfilePage(
                                                _userModel.connection)));
                                  },
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor:
                                          AppColors.acikMavi.withOpacity(1),
                                      radius: 30,
                                      child: CircleAvatar(
                                        radius: 26,
                                        backgroundImage: NetworkImage(
                                            _userModel.connection.profileURL ??
                                                ""),
                                      ),
                                    ),
                                    title: Text(
                                      _userModel.connection.name ?? "",
                                      style: TextStyle(
                                          color: AppColors.acikMavi
                                              .withOpacity(1)),
                                    ),
                                    subtitle: Text(
                                      _userModel.connection.professional ?? "",
                                      style: TextStyle(
                                          color: AppColors.acikMavi
                                              .withOpacity(1)),
                                    ),
                                    trailing: RotationTransition(
                                      turns:
                                          new AlwaysStoppedAnimation(45 / 360),
                                      child: IconButton(
                                        onPressed: () {
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .push(MaterialPageRoute(
                                                  builder:
                                                      (context) => ChatPage(
                                                            me: _userModel
                                                                .user.userID,
                                                            it: _userModel
                                                                .connection
                                                                .userID,
                                                            profileImage: NetworkImage(
                                                                _userModel
                                                                    .connection
                                                                    .profileURL),
                                                          )));
                                        },
                                        icon: Icon(
                                          Icons.navigation,
                                          size: 28,
                                          color:
                                              AppColors.acikMavi.withOpacity(1),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Divider(
                                thickness: 4,
                                indent: 20,
                                endIndent: 20,
                                color: AppColors.acikMavi.withOpacity(1),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    "Kalan Buluşmalarım\n3",
                                    style: TextStyle(
                                        color:
                                            AppColors.acikMavi.withOpacity(1),
                                        fontSize: 16),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "Kalan Anketlerim\n2",
                                    style: TextStyle(
                                        color:
                                            AppColors.acikMavi.withOpacity(1),
                                        fontSize: 16),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Sonraki Buluşma İçin Son Tarih\n 27 Mayıs 2020",
                                style: TextStyle(
                                    color: AppColors.acikMavi.withOpacity(1),
                                    fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacementNamed(
                                        context, "/arrangeMeeting");
                                  },
                                  child: Container(
                                      margin:
                                          EdgeInsets.fromLTRB(60, 15, 60, 7),
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
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      )),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacementNamed(
                                        context, "/fillSurvey");
                                  },
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
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
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
                      color: AppColors.acikMavi.withOpacity(1),
                    ),
                    onPressed: () => _scaffoldKey.currentState.openDrawer()),
                IconButton(
                  padding: EdgeInsets.all(20),
                  icon: Icon(
                    Icons.notifications,
                    size: 28,
                    color: AppColors.acikMavi.withOpacity(1),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotificationPage()));
                  },
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            Text(
              "ANA  SAYFA",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.acikMavi.withOpacity(1),
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
