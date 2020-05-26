import 'package:agucareer/values/colors.dart';
import 'package:agucareer/viewmodels/user_model.dart';
import 'package:agucareer/widgets/drawer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ArrangeMeeting extends StatefulWidget {
  @override
  _ArrangeMeetingState createState() => _ArrangeMeetingState();
}

class _ArrangeMeetingState extends State<ArrangeMeeting> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final UserModel _userModel = Provider.of<UserModel>(context);

    return Scaffold(
      key: _scaffoldKey,
        drawer: DrawerWidget().drawerMenu(context, _userModel),
      backgroundColor: AppColors.pembe.withOpacity(1),
      appBar: _getCustomAppBar(),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              margin: EdgeInsets.only(right: 30, left: 30, top: 20),
              child: Column(
                children: <Widget>[
                  Spacer(flex: 1),
                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: screenSize.width / 2.5,
                          child: RaisedButton(
                            color: AppColors.acikMor.withOpacity(1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.lerp(Radius.circular(-60),
                                    Radius.circular(60), 1),
                              ),
                            ),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Spacer(flex: 1),
                                Icon(Icons.person, color: Colors.white),
                                Spacer(flex: 2),
                                Text(
                                  "Ediz Kurt",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Spacer(flex: 1),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: screenSize.width / 2.5,
                          child: RaisedButton(
                            color: AppColors.acikMor.withOpacity(1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              bottomRight: Radius.lerp(
                                  Radius.circular(-60), Radius.circular(60), 1),
                            )),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Spacer(flex: 1),
                                Text(
                                  'Kayseri Forum',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Spacer(flex: 2),
                                Icon(Icons.location_on, color: Colors.white),
                                Spacer(flex: 1),
                              ],
                            ),

                            ],
                          ),
                        ),  ),
                        )
                  Spacer(flex: 1),
                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(
                          width: screenSize.width / 2.5,
                          child: RaisedButton(
                            color: AppColors.acikMor.withOpacity(1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              bottomLeft: Radius.lerp(
                                  Radius.circular(-60), Radius.circular(60), 1),
                            )),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Spacer(flex: 1),
                                Icon(Icons.date_range, color: Colors.white),
                                Spacer(flex: 2),
                                Text(
                                  "5 Haziran Cuma",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Spacer(flex: 1),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: screenSize.width / 2.5,
                          child: RaisedButton(
                            color: AppColors.acikMor.withOpacity(1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              bottomRight: Radius.lerp(
                                  Radius.circular(-60), Radius.circular(60), 1),
                            )),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Spacer(flex: 1),
                                Text(
                                  "16.00",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Spacer(flex: 2),
                                Icon(Icons.access_time, color: Colors.white),
                                Spacer(flex: 1),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Spacer(flex: 1),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      width: screenSize.width / 2,
                      child: RaisedButton(
                        color: AppColors.acikMor.withOpacity(1),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        onPressed: () {},
                        child: Text("AYARLA", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                            child: RaisedButton(
                              color: AppColors.pembe.withOpacity(1),
                              child: Text(
                                "KİŞİ",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {},
                              elevation: 0,
                            ),
                          ),
                          Expanded(
                            child: RaisedButton(
                              color: AppColors.pembe.withOpacity(1),
                              child: Text(
                                "YER",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {},
                              elevation: 0,
                            ),
                          ),
                          Expanded(
                            child: RaisedButton(
                              color: AppColors.pembe.withOpacity(1),
                              child: Text(
                                "TARİH",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {},
                              elevation: 0,
                            ),
                          ),
                          Expanded(
                            child: RaisedButton(
                              color: AppColors.pembe.withOpacity(1),
                              child: Text(
                                "SAAT",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {},
                              elevation: 0,
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment.bottomCenter,
              color: AppColors.koyuMor.withOpacity(1),
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
              "BULUŞMA  AYARLA",
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
