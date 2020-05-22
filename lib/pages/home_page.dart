import 'package:agucareer/values/colors.dart';
import 'package:agucareer/viewmodels/user_model.dart';
import 'package:agucareer/widgets/drawer_widget.dart';
import 'package:agucareer/widgets/connections_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//bug fix

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserModel _userModel = Provider.of<UserModel>(context);
    return Scaffold(
        appBar: _getCustomAppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            Expanded(
              child: Container(
                  padding: EdgeInsets.all(5),
                  child: ConnectionsWidget().cWidget(_userModel)),
            ),
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
              margin: EdgeInsets.all(30),
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
                            "https://cdn1.vectorstock.com/i/1000x1000/77/30/default-avatar-profile-icon-grey-photo-placeholder-vector-17317730.jpg"),
                      ),
                      title: Text(
                        "Raşit Aydın",
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        "Bilgisayar Mühendisliği",
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: RotationTransition(
                        turns: new AlwaysStoppedAnimation(45 / 360),
                        child: Icon(
                          Icons.navigation,
                          size: 28,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "Kalan Buluşmalarım\n3",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Kalan Anketlerim\n2",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  Text(
                    "Bir Sonraki Buluşma İçin Son Tarih\n 27 Mayıs 2020",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.fromLTRB(50, 15, 50, 7),
                        padding: EdgeInsets.fromLTRB(20, 7, 20, 7),
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
                              "Buluşma Ayarla",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        )),
                  ),
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.fromLTRB(50, 7, 50, 15),
                        padding: EdgeInsets.fromLTRB(20, 7, 20, 7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          color: AppColors.acikMor.withOpacity(1.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(
                              Icons.assignment,
                              color: Colors.white,
                            ),
                            Text(
                              "Anket Doldur",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        )),
                  ),
                ],
              ),
            ),
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
                    onPressed: () {}),
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
