import 'package:agucareer/pages/admin_panel/see_meetings_choose.dart';
import 'package:agucareer/pages/admin_panel/see_meetings_main.dart';
import 'package:agucareer/values/colors.dart';
import 'package:agucareer/viewmodels/user_model.dart';
import 'package:agucareer/widgets/drawer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminHomePage extends StatefulWidget {
  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final UserModel _userModel = Provider.of<UserModel>(context);
    return Scaffold(
        key: _scaffoldKey,
        appBar: _getCustomAppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Yönet",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.grey.shade500,
              ),
            ),
            Container(
              height: 420,
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
                children: <Widget>[
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SeeMeetingsChoose()
                      )
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(60, 15, 60, 7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: AppColors.pembe.withOpacity(1.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(
                            Icons.date_range,
                            color: Colors.white,
                          ),
                          Text(
                            "Buluşmaları Gör",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  )),
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.fromLTRB(60, 15, 60, 7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          color: AppColors.acikMor.withOpacity(1.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(
                              Icons.assignment,
                              color: Colors.white,
                            ),
                            Text(
                              "Anketleri Gör",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        )),
                  ),
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.fromLTRB(60, 15, 60, 7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          color: AppColors.acikMavi.withOpacity(1.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(
                              Icons.account_box,
                              color: Colors.white,
                            ),
                            Text(
                              "Yeni Kayıt Oluştur",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        )),
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(
                              Icons.notifications,
                              color: Colors.white,
                            ),
                            Text(
                              "Duyuru Yap",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        )),
                  ),
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.fromLTRB(60, 15, 60, 7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          color: AppColors.acikMor.withOpacity(1.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(
                              Icons.folder,
                              color: Colors.white,
                            ),
                            Text(
                              "Dosya Yükle",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        )),
                  ),
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.fromLTRB(60, 15, 60, 7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          color: AppColors.acikMavi.withOpacity(1.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(
                              Icons.access_time,
                              color: Colors.white,
                            ),
                            Text(
                              "Son Tarih Belirle",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        )),
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(
                              Icons.people,
                              color: Colors.white,
                            ),
                            Text(
                              "Kişi Eşleştir",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
        drawer: DrawerWidget().drawerMenu(context, _userModel));
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
