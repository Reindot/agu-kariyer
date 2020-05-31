import 'package:agucareer/values/colors.dart';
import 'package:agucareer/values/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateAnnouncement extends StatefulWidget {
  @override
  _CreateAnnouncement createState() => _CreateAnnouncement();
}

class _CreateAnnouncement extends State<CreateAnnouncement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getCustomAppBar(),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 20.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 50.0),
                     _buildAnnouncementTF(),
                      SizedBox(height: 20.0),
                      _buildSendBtn()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildAnnouncementTF() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20.0),
          Container(
            alignment: Alignment.centerLeft,
            decoration: secondBoxDecorationStyle,
            height: 50.0,
            child: TextFormField(
              keyboardType: TextInputType.text,
              style: TextStyle(
                color: AppColors.koyuMor,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.announcement,
                  color: AppColors.koyuMor.withOpacity(0.4),
                ),
                hintText: 'Duyurunuz',
                hintStyle: TextStyle(
                  color: AppColors.koyuMor.withOpacity(0.4),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              ),
            ),
          )
        ]);
  }

  Widget _buildSendBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        padding: EdgeInsets.all(15.0),
        color: AppColors.koyuMor.withOpacity(1.0),
        onPressed: () => print("gönder basildi"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text(
          'Gönder',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
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
                    Icons.arrow_back,
                    size: 28,
                    color: Colors.white,
                  ),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            Text(
              "Duyuru Yap",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
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
