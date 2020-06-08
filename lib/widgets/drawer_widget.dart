import 'dart:ui';
import 'package:agucareer/pages/admin_panel/admin_home_page.dart';
import 'package:agucareer/pages/all_chats_page.dart';
import 'package:agucareer/pages/arrange_meeting.dart';
import 'package:agucareer/pages/profil_duzenle_widget.dart';
import 'package:agucareer/pages/profil_page.dart';
import 'package:agucareer/pages/survey_pages/fill_survey_page.dart';
import 'package:agucareer/values/colors.dart';
import 'package:agucareer/viewmodels/user_model.dart';
import 'package:flutter/material.dart';

class DrawerWidget {
  Widget drawerMenu(BuildContext context, UserModel _userModel) {
    return ClipPath(
        child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(90),
          )),
      width: 300,
      child: ListView(
        padding: EdgeInsets.only(top: 0),
        children: <Widget>[
          UserAccountsDrawerHeader(
            onDetailsPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfilePage(_userModel.user))),
            accountName: Text(
              "    ${_userModel.user.name}",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            accountEmail: Text(
              "     ${_userModel.user.email}",
              style: TextStyle(color: Colors.white),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  topRight: Radius.circular(90)),
              image: DecorationImage(
                image: AssetImage('assets/images/header_background.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.8), BlendMode.dstATop),
              ),
            ),
            currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(_userModel.user.profileURL)),
          ),
          ListTile(
              contentPadding: EdgeInsets.only(left: 30),
              leading: Icon(Icons.home),
              title: Text("Ana Sayfa"),
              onTap: () {
                Navigator.pop(context);
              }),
          ListTile(
              contentPadding: EdgeInsets.only(left: 30),
              leading: RotationTransition(
                turns: new AlwaysStoppedAnimation(45 / 360),
                child: Icon(
                  Icons.navigation,
                  size: 26,
                ),
              ),
              title: Text("Mesajlar"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AllChatsPage()));
              }),
          Container(
            padding: EdgeInsets.only(right: 20, left: 10),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColors.acikMor,
                  borderRadius: BorderRadius.circular(120)),
              child: ListTile(
                  contentPadding: EdgeInsets.only(left: 20),
                  leading: Icon(
                    Icons.calendar_today,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Buluşma Ayarla",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ArrangeMeeting()));
                  }),
            ),
          ),
          ListTile(
              contentPadding: EdgeInsets.only(left: 30),
              leading: Icon(Icons.folder),
              title: Text("Dosyalar"),
              onTap: () {
                Navigator.pop(context);
              }),
          ListTile(
              contentPadding: EdgeInsets.only(left: 30),
              leading: Icon(Icons.assignment),
              title: Text("Anket Doldur"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FillSurvey()));
              }),
          ListTile(
              contentPadding: EdgeInsets.only(left: 30),
              leading: Icon(Icons.person),
              title: Text("Bize Ulaş!"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdminHomePage()));
              }),
          ListTile(
              contentPadding: EdgeInsets.only(left: 30),
              leading: Icon(Icons.info),
              title: Text("S.S.S"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfilDuzenleWidget()));
              }),
          Divider(),
          ListTile(
              contentPadding: EdgeInsets.only(top: 10, left: 15),
              leading: Icon(Icons.settings),
              title: Text("Ayarlar"),
              onTap: () {
                Navigator.pop(context);
              }),
          ListTile(
              contentPadding: EdgeInsets.only(top: 10, left: 15),
              leading: Icon(Icons.power_settings_new),
              title: Text("Çıkış Yap"),
              onTap: () {
                signOut(_userModel, context);
              }),
        ],
      ),
    ));
  }

  signOut(UserModel _userModel, BuildContext context) async {
    try {
      var result = await _userModel.signOut();
      if (result != null && result) {
        Navigator.pushReplacementNamed(context, '/');
      }
    } catch (e) {
      debugPrint(
          ">>> drawer_widget >>> signOut >>> ErrorCode >>> ${e.toString()}");
    }
  }
}
