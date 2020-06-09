import 'dart:io';

import 'package:agucareer/pages/admin_panel/choose_last_date__choose_meeting.dart';
import 'package:agucareer/pages/admin_panel/create_announcement.dart';
import 'package:agucareer/pages/admin_panel/create_new_user.dart';
import 'package:agucareer/pages/admin_panel/match_users_person1.dart';
import 'package:agucareer/pages/admin_panel/see_meetings_choose.dart';
import 'package:agucareer/pages/admin_panel/survey_results_choose_person.dart';
import 'package:agucareer/values/colors.dart';
import 'package:agucareer/viewmodels/user_model.dart';
import 'package:agucareer/widgets/drawer_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminHomePage extends StatefulWidget {
  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  File _file;

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
            SizedBox(height: 10),
            Text(
              "Yönet",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.grey.shade500,
              ),
            ),
            Container(
              height: 430,
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.only(bottom: 10),
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
                children: <Widget>[
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SeeMeetingsChoose(),
                        ),
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(width: 40),
                          Icon(
                            Icons.date_range,
                            color: Colors.white,
                          ),
                          SizedBox(width: 60),
                          Text(
                            "Buluşmaları Gör",
                            style: TextStyle(color: Colors.white),
                          ),
                          Spacer(flex: 1),
                        ],
                      ),
                    ),
                  )),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SurveyResultsChoosePerson()));
                    },
                    child: Container(
                        margin: EdgeInsets.fromLTRB(60, 15, 60, 7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          color: AppColors.acikMor.withOpacity(1.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(width: 40),
                            Icon(
                              Icons.assignment,
                              color: Colors.white,
                            ),
                            SizedBox(width: 60),
                            Text(
                              "Anketleri Gör",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        )),
                  )),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateNewUser()));
                    },
                    child: Container(
                        margin: EdgeInsets.fromLTRB(60, 15, 60, 7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          color: AppColors.acikMavi.withOpacity(1.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(width: 40),
                            Icon(
                              Icons.account_box,
                              color: Colors.white,
                            ),
                            SizedBox(width: 60),
                            Text(
                              "Yeni Kayıt Oluştur",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        )),
                  )),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateAnnouncement()));
                    },
                    child: Container(
                        margin: EdgeInsets.fromLTRB(60, 15, 60, 7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          color: AppColors.pembe.withOpacity(1.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(width: 40),
                            Icon(
                              Icons.notifications,
                              color: Colors.white,
                            ),
                            SizedBox(width: 60),
                            Text(
                              "Duyuru Yap",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        )),
                  )),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => uploadFile(context),
                      child: Container(
                          margin: EdgeInsets.fromLTRB(60, 15, 60, 7),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color: AppColors.acikMor.withOpacity(1.0),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(width: 40),
                              Icon(
                                Icons.folder,
                                color: Colors.white,
                              ),
                              SizedBox(width: 60),
                              Text(
                                "Dosya Yükle",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          )),
                    ),
                  ),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ChooseLastDateChooseMeeting()));
                    },
                    child: Container(
                        margin: EdgeInsets.fromLTRB(60, 15, 60, 7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          color: AppColors.acikMavi.withOpacity(1.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(width: 40),
                            Icon(
                              Icons.access_time,
                              color: Colors.white,
                            ),
                            SizedBox(width: 60),
                            Text(
                              "Son Tarih Belirle",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        )),
                  )),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MatchUserPerson1()));
                    },
                    child: Container(
                        margin: EdgeInsets.fromLTRB(60, 15, 60, 7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          color: AppColors.pembe.withOpacity(1.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(width: 40),
                            Icon(
                              Icons.people,
                              color: Colors.white,
                            ),
                            SizedBox(width: 60),
                            Text(
                              "Kişi Eşleştir",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        )),
                  )),
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

  Future uploadFile(BuildContext context) async{
    File file = await FilePicker.getFile();
    final _userModel = Provider.of<UserModel>(context);
    _userModel.uploadFile(file);
    setState(() {
      _file = file;
    });
    print(">>>>>>>>>>>>>>>>>" + file.path);
  }
}
