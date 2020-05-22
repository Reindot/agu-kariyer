import 'dart:ui';
import 'package:agucareer/models/user_model.dart';
import 'package:agucareer/pages/all_chats_page.dart';
import 'package:agucareer/pages/home_page.dart';
import 'package:agucareer/pages/profil_duzenle_widget.dart';
import 'package:agucareer/pages/profil_page.dart';
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
            onDetailsPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfilePage())),
            accountName: Text("    ${_userModel.user.name}",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            accountEmail: Text(
                "     ${_userModel.user.email}"
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  topRight: Radius.circular(90)
              ),
              image: DecorationImage(
                image: AssetImage('assets/images/header_background.png'),
                fit: BoxFit.cover,
                colorFilter:
                ColorFilter.mode(Colors.black.withOpacity(0.8),
                    BlendMode.dstATop),
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              }),
          ListTile(
              contentPadding: EdgeInsets.only(left: 30),
              leading: Icon(Icons.message),
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
                  color: Colors.blue.withOpacity(0.8),
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
                    Navigator.pop(context);
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
              leading: Icon(Icons.textsms),
              title: Text("Anket Doldur"),
              onTap: () {
                Navigator.pop(context);
              }),
          ListTile(
              contentPadding: EdgeInsets.only(left: 30),
              leading: Icon(Icons.person),
              title: Text("Bize Ulaş!"),
              onTap: () {
                Navigator.pop(context);
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
                signOut(_userModel);
              }),
        ],
      ),
    ));
  }

  Future<bool> signOut(UserModel _userModel) async {
    return await _userModel.signOut();
  }
}
